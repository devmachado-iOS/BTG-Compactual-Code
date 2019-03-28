//
//  InvestmentsViewController.swift
//  Teste-iOS-BTG
//
//  Created by Carlos Machado on 14/03/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import Foundation
import UIKit
import PureLayout
import Alamofire
import SwiftyJSON

class InvestimentsViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource{
  
  
  let tableView = UITableView().configureForAutoLayout()
  let bigContainerView = UIView().configureForAutoLayout()
  let lineView = UIView().configureForAutoLayout()
  let smallContainerView1 = UIView().configureForAutoLayout()
  let smallContainerView2 = UIView().configureForAutoLayout()
  let smallContainerView3 = UIView().configureForAutoLayout()
  let colorView1 = UIView().configureForAutoLayout()
  let colorView2 = UIView().configureForAutoLayout()
  let colorView3 = UIView().configureForAutoLayout()
  let conservativeLabel = UILabel().configureForAutoLayout()
  let modestLabel = UILabel().configureForAutoLayout()
  let sophisticatedLabel = UILabel().configureForAutoLayout()
  let searchBar = UISearchBar().configureForAutoLayout()
  let containerHeight = CGFloat(90)
  var isSearch = false
  var jsonData: [FundJSON] = []
  var currentData: [FundJSON] = []
  

  
  override func viewDidLoad(){
    super.viewDidLoad()
    hideKeyboardWhenTappedAround()
    investmentViewBuilder()
    getData()
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if isSearch{
      if (currentData[indexPath.row].collapse == false){
        return 150
      }else{
        return 330
      }
    }else{
      if (jsonData[indexPath.row].collapse == false){
        return 150
      }else{
        return 330
      }
    }
}

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if isSearch{
    if currentData.isEmpty && isSearch{
      currentData = jsonData
    }
    return currentData.count
    }else{
      return jsonData.count
    }
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Messages.investimentCell,
                                             for: indexPath) as! InvestimentsTableViewCell
    
    if isSearch{
      cell.cellInitializer(collapsed: currentData[indexPath.row].collapse)
      switch currentData[indexPath.row].type{
      case "CONSERVATIVE":
        cell.colorView.backgroundColor = UIColor.btg_blue
      case "MODERATE":
        cell.colorView.backgroundColor = UIColor.btg_orange
      case "SOPHISTICATED":
        cell.colorView.backgroundColor = UIColor.btg_red
      default:
        break
      }
      
      cell.issuerNameLabel.text = currentData[indexPath.row].issuerName
      cell.categoryDescriptionLabel.text = currentData[indexPath.row].detail.categoryDescription
      cell.minimumInitialInvestmentValue.text = currentData[indexPath.row].minimumInitialInvestment?.formattedWithSeparator
      cell.twelveMonthsValue.text = String.percentFormating(value: currentData[indexPath.row].profitability!.twelveMonths!)
      cell.rescueQuotaValue.text = currentData[indexPath.row].detail.rescueQuota
      cell.monthValue.text = String.percentFormating(value:currentData[indexPath.row].profitability!.month!)
      
      if (jsonData[indexPath.row].collapse == true)
      {
        cell.yearValue.text = String.percentFormating(value:currentData[indexPath.row].profitability!.year!)
        cell.beginQuotaValueLabel.text = Date.getFormattedDate(string:currentData[indexPath.row].begin!)
        cell.netEquityValue.text = currentData[indexPath.row].netEquity?.formattedWithSeparator
        cell.dateQuotaValue.text = Date.getFormattedDate(string: currentData[indexPath.row].detail.dateQuota!)
        cell.quotaValue.text = currentData[indexPath.row].detail.valueQuota?.formattedWithSeparator
      }
      
    }else{

      switch jsonData[indexPath.row].type{
      case "CONSERVATIVE":
        cell.colorView.backgroundColor = UIColor.btg_blue
      case "MODERATE":
        cell.colorView.backgroundColor = UIColor.btg_orange
      case "SOPHISTICATED":
        cell.colorView.backgroundColor = UIColor.btg_red
      default:
        break
      }
      cell.cellInitializer(collapsed: jsonData[indexPath.row].collapse)
      cell.issuerNameLabel.text = jsonData[indexPath.row].issuerName
      cell.categoryDescriptionLabel.text = jsonData[indexPath.row].detail.categoryDescription
      cell.minimumInitialInvestmentValue.text = jsonData[indexPath.row].minimumInitialInvestment?.formattedWithSeparator
      cell.twelveMonthsValue.text = String.percentFormating(value: jsonData[indexPath.row].profitability!.twelveMonths!)
      cell.rescueQuotaValue.text = jsonData[indexPath.row].detail.rescueQuota
      cell.monthValue.text = String.percentFormating(value:jsonData[indexPath.row].profitability!.month!)

      if (jsonData[indexPath.row].collapse == true)
      {
        cell.yearValue.text = String.percentFormating(value:jsonData[indexPath.row].profitability!.year!)
        cell.beginQuotaValueLabel.text = Date.getFormattedDate(string:jsonData[indexPath.row].begin!)
        cell.netEquityValue.text = jsonData[indexPath.row].netEquity?.formattedWithSeparator
        cell.dateQuotaValue.text = Date.getFormattedDate(string: jsonData[indexPath.row].detail.dateQuota!)
        cell.quotaValue.text = jsonData[indexPath.row].detail.valueQuota?.formattedWithSeparator
      }
    }
  
    cell.selectionStyle = .none
    cell.collapseButton.tag = indexPath.row
    cell.collapseButton.addTarget(self, action: #selector(handleCollapsingCell), for: .touchUpInside)
    return cell
  }
  
  //MARK: UISearchbar delegate
  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
    isSearch = false;
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
    isSearch = false;
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
    isSearch = false;
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    if searchText.count == 0 {
      isSearch = false;
      self.tableView.reloadData()
    } else {
      filterContentForCell(searchText)
      if(currentData.count == 0){
        isSearch = false;
      } else {
        isSearch = true;
      }
      self.tableView.reloadData()
    }
  }
  
  //Filtering Informations
  func filterContentForCell(_ searchText: String){
    currentData = jsonData.filter({( fundData : FundJSON) -> Bool in
      return (fundData.issuerName?.lowercased().contains(searchText.lowercased()))! ||
        (fundData.type?.lowercased().contains(searchText.lowercased()))!
    })
    tableView.reloadData()
  }
  
  //COLLAPSING CELL HANDLER
  @objc func handleCollapsingCell(_ sender: UIButton){
    jsonData[sender.tag].collapse = !jsonData[sender.tag].collapse
    let indexPath = IndexPath(row: sender.tag, section: 0)
    tableView.reloadRows(at: [indexPath], with: .automatic)
  }
  
  //GETTING JSON DATA
  func getData()
  {
    let url = "https://www.btgpactualdigital.com/services/public/funds/"
    Alamofire.request(url, method: .get)
      .responseJSON { response in
        if response.result.isSuccess {
          let json : JSON = JSON(response.result.value!)
          for index in 0...(json.count - 1){
            let singleFund = FundJSON.init(issuerName: json[index]["issuerName"].string ?? String(),
                                       type: json[index]["type"].string ?? String(),
                                       minimumInitialInvestment: json[index]["minimumInitialInvestment"].doubleValue,
                                       netEquity: json[index]["netEquity"].doubleValue,
                                       begin: json[index]["begin"].string! ,
                                       profitability: ProfitJSON.init(twelveMonths: json[index]["profitability"]["twelveMonths"].doubleValue,
                                                                  month: json[index]["profitability"]["month"].doubleValue,
                                                                  year: json[index]["profitability"]["year"].doubleValue),
                                       detail: DetailJSON.init(rescueQuota: json[index]["detail"]["rescueQuota"].string ?? String(),
                                                           categoryDescription: json[index]["detail"]["categoryDescription"].string ?? String(),
                                                           dateQuota: json[index]["detail"]["dateQuota"].string!,
                                                           valueQuota: json[index]["detail"]["valueQuota"].doubleValue),
                                       collapse: false)
            self.jsonData.append(singleFund)
          }
          self.tableView.reloadData()
        } else {
          print("Error: \(String(describing: response.result.error))")
        }
    }
  }
  
  @objc func handleFilterView(_ sender: UIButton){
    navigationController?.pushViewController(FilterViewController(), animated: true)
  }
  
  
  
  
  
}
