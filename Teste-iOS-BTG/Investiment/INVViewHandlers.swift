//
//  InvestimentsController + Handlers.swift
//  Teste-iOS-BTG
//
//  Created by Carlos Machado on 14/03/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

extension InvestimentsViewController{
  
  func investmentViewBuilder()
  {
    navBarConfig()
    createSearchAndInfoView()
    createTableView()
  }
  
   func navBarConfig()
  {
    let backButton = UIBarButtonItem()
    backButton.title = " "
    self.navigationItem.backBarButtonItem = backButton
    view.backgroundColor = UIColor.btg_gray
    navigationItem.title = Messages.investmentNavTitle
    navigationItem.backBarButtonItem = backButton
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,
    NSAttributedString.Key.font: UIFont.semiboldFont(size:18)]
    navigationController?.navigationBar.tintColor = UIColor.white
    navigationController?.navigationBar.barTintColor = UIColor.btg_mainColor
    navigationController?.navigationBar.isTranslucent = false
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:AssetNames.filther),
                                                        style: .plain,
                                                        target: self,
                                                        action: #selector(InvestimentsViewController.handleFilterView(_:)))
  }
  
  func createSearchAndInfoView()
  {
    //Adding subviews
    view.addSubview(bigContainerView)
    bigContainerView.addSubview(searchBar)
    bigContainerView.addSubview(lineView)
    bigContainerView.addSubview(smallContainerView1)
    bigContainerView.addSubview(smallContainerView2)
    bigContainerView.addSubview(smallContainerView3)
    smallContainerView1.addSubview(colorView1)
    smallContainerView1.addSubview(conservativeLabel)
    smallContainerView2.addSubview(colorView2)
    smallContainerView2.addSubview(modestLabel)
    smallContainerView3.addSubview(colorView3)
    smallContainerView3.addSubview(sophisticatedLabel)
    
    //ContainerView configuration
    bigContainerView.backgroundColor = .clear
    bigContainerView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
    bigContainerView.autoSetDimension(.height, toSize: containerHeight)
    
    //SearchBar configuration
    searchBar.delegate = self
    searchBar.searchBarStyle = .minimal
    searchBar.placeholder = Messages.placeHolder
    searchBar.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
    searchBar.autoSetDimension(.height, toSize: 50)
    if let textField = searchBar.value(forKey: Messages.searchKey) as? UITextField {
      textField.font = UIFont.lightFont(size: 14)
      let backgroundView = textField.subviews.first
      backgroundView?.backgroundColor = UIColor.clear
      backgroundView?.subviews.forEach({ $0.removeFromSuperview() })
    }
 
    //LineView Configuration
    lineView.backgroundColor = .lightGray
    lineView.autoSetDimension(.height, toSize: 0.5)
    lineView.autoPinEdge(.leading, to: .leading, of: bigContainerView, withOffset: 20)
    lineView.autoPinEdge(.trailing, to: .trailing, of: bigContainerView, withOffset: -50)
    lineView.autoPinEdge(.top, to: .bottom, of: searchBar, withOffset: -10)
    
    //SmallContainer/ColorView/Labels Configuration
    colorView1.backgroundColor = UIColor.btg_blue
    conservativeLabel.text = Messages.conservative
    conservativeLabel.font = UIFont.regularFont(size: 10)
    conservativeLabel.textAlignment = .left

    colorView2.backgroundColor = UIColor.btg_orange
    modestLabel.text = Messages.modest
    modestLabel.font = UIFont.regularFont(size: 10)
    modestLabel.textAlignment = .left

    colorView3.backgroundColor = UIColor.btg_red
    sophisticatedLabel.text = Messages.sophisticated
    sophisticatedLabel.font = UIFont.regularFont(size: 10)
    sophisticatedLabel.textAlignment = .left

    smallContainerView2.autoSetDimensions(to: CGSize(width: 80, height: 15))
    smallContainerView2.autoAlignAxis(toSuperviewAxis: .vertical)
    smallContainerView2.autoPinEdge(.top, to: .bottom, of: lineView, withOffset: 20)

    smallContainerView1.autoSetDimensions(to: CGSize(width: 80, height: 15))
    smallContainerView1.autoPinEdge(.trailing, to: .leading, of: smallContainerView2, withOffset: -10)
    smallContainerView1.autoPinEdge(.top, to: .bottom, of: lineView, withOffset: 20)

    smallContainerView3.autoSetDimensions(to: CGSize(width: 80, height: 15))
    smallContainerView3.autoPinEdge(.leading, to: .trailing, of: smallContainerView2, withOffset: 10)
    smallContainerView3.autoPinEdge(.top, to: .bottom, of: lineView, withOffset: 20)


    colorView1.autoSetDimension(.width, toSize: 7.5)
    colorView1.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .trailing)
    conservativeLabel.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .leading)
    conservativeLabel.autoPinEdge(.leading, to: .trailing, of: colorView1, withOffset: 5)

    colorView2.autoSetDimension(.width, toSize: 7.5)
    colorView2.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .trailing)
    modestLabel.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .leading)
    modestLabel.autoPinEdge(.leading, to: .trailing, of: colorView2, withOffset: 5)

    colorView3.autoSetDimension(.width, toSize: 7.5)
    colorView3.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .trailing)
    sophisticatedLabel.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .leading)
    sophisticatedLabel.autoPinEdge(.leading, to: .trailing, of: colorView3, withOffset: 5)
}
  
  
  func createTableView()
  {
    view.addSubview(tableView)
    tableView.backgroundColor = .clear
    tableView.separatorStyle = .none
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(InvestimentsTableViewCell.self, forCellReuseIdentifier: Messages.investimentCell)
    tableView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
    tableView.autoPinEdge(.top, to: .top, of: view, withOffset: containerHeight)
  }
}
