//
//  FilterViewController.swift
//  Teste-iOS-BTG
//
//  Created by Carlos Machado on 19/03/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//


import UIKit
import PureLayout


class FilterViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout{
  
  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).configureForAutoLayout()
  let collectionDirection = UICollectionViewFlowLayout()
  let refineLabel = UILabel().configureForAutoLayout()
  let riskLabel = UILabel().configureForAutoLayout()
  let categoryTextView = UILabel().configureForAutoLayout()
  let minimumInvestmentTextView = UILabel().configureForAutoLayout()
  let rescueTextView = UILabel().configureForAutoLayout()
  let underView1 = UIView().configureForAutoLayout()
  let underView2 = UIView().configureForAutoLayout()
  let underView3 = UIView().configureForAutoLayout()
  var filterBottomButton = UIButton().configureForAutoLayout()
  var collectionCellData:[RiskCollection] = []
  
  var newArray = [String]()
  
  override func viewDidLoad(){
    super.viewDidLoad()
    createFilterView()
    collectionCellData = [RiskCollection.init(type: Messages.conservative, color: UIColor.btg_blue),
                          RiskCollection.init(type: Messages.modest,color: UIColor.btg_green),
                          RiskCollection.init(type: Messages.sophisticated,color: UIColor.btg_red)]
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 80, height: 50)
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return collectionCellData.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Messages.filterCell,
                                                  for: indexPath) as! FilterCollectionCell
    
    cell.typeLabel.text = collectionCellData[indexPath.row].type
    cell.colorView.backgroundColor = collectionCellData[indexPath.row].color
    if collectionCellData[indexPath.row].isSelected{
      cell.checkImageView.isHidden = false
      cell.checkViewContainer.layer.borderColor = UIColor.clear.cgColor
    }else{
      cell.checkImageView.isHidden = true
      cell.checkViewContainer.layer.borderColor = UIColor.btg_blue.cgColor
    }
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionCellData[indexPath.row].isSelected = !collectionCellData[indexPath.row].isSelected
    collectionView.reloadData()
  }
  
  //MARK:- DELEGATE HANDLER
  @objc func delegateTrigger(){
    for item in 0...(collectionCellData.count - 1) {
      
      switch collectionCellData[item].type {
      case "CONSERVADOR":
        newArray.append("CONSERVATIVE")
      case "MODERADO":
        newArray.append("MODERATE")
      case "SOFISTICADO":
        newArray.append("SOPHISTICATED")
      default:
        break
      }
    }
    navigationController?.popViewController(animated: true)
  }
}
