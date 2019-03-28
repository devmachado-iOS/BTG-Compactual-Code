//
//  FilterViewHandlers.swift
//  Teste-iOS-BTG
//
//  Created by Carlos Machado on 19/03/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import Foundation
import UIKit
import PureLayout


extension FilterViewController{
  func createFilterView()
  {
    collectionDirection.scrollDirection = .horizontal
    collectionView.backgroundColor = .clear
    collectionView.delegate = self
    collectionView.dataSource = self
    navigationItem.title = Messages.filterNaviTitle
    view.backgroundColor = .white
    view.addSubview(collectionView)
    view.addSubview(refineLabel)
    view.addSubview(riskLabel)
    view.addSubview(categoryTextView)
    view.addSubview(minimumInvestmentTextView)
    view.addSubview(rescueTextView)
    view.addSubview(underView1)
    view.addSubview(underView2)
    view.addSubview(underView3)
    view.addSubview(filterBottomButton)
    
    refineLabel.backgroundColor = .clear
    refineLabel.text = "REFINE SUA BUSCA"
    refineLabel.font = UIFont.boldFont(size: 15)
    refineLabel.textColor = UIColor.darkGray
    riskLabel.backgroundColor = .clear
    riskLabel.text = "RISCO:"
    riskLabel.font = UIFont.semiboldFont(size: 12)
    riskLabel.textColor = .darkGray
    
    categoryTextView.backgroundColor = .clear
    categoryTextView.text = "CATEGORIA"
    categoryTextView.font = UIFont.semiboldFont(size: 14)
    categoryTextView.textColor = UIColor.darkGray
    underView1.backgroundColor = .lightGray
    minimumInvestmentTextView.backgroundColor = .clear
    minimumInvestmentTextView.text = "APLICAÇÃO MÍNIMA"
    minimumInvestmentTextView.font = UIFont.semiboldFont(size: 14)
    minimumInvestmentTextView.textColor = UIColor.darkGray
    underView2.backgroundColor = .lightGray
    rescueTextView.backgroundColor = .clear
    rescueTextView.text = "RESGATE EM"
    rescueTextView.font = UIFont.semiboldFont(size: 14)
    rescueTextView.textColor = UIColor.darkGray
    underView3.backgroundColor = .lightGray
    
    filterBottomButton.backgroundColor = UIColor.btg_blue
    filterBottomButton.setTitle("FILTRAR", for: .normal)
    filterBottomButton.titleLabel?.font = UIFont.regularFont(size: 21)
    filterBottomButton.titleLabel?.textAlignment = .center
    filterBottomButton.titleLabel?.textColor = .white
    filterBottomButton.addTarget(self, action: #selector(delegateTrigger), for: .touchUpInside)
    
    setFilterAutoLayout()
  }
  
  func setFilterAutoLayout()
  {
    refineLabel.autoPinEdge(.top, to: .top, of: view, withOffset: 20)
    refineLabel.autoPinEdge(.leading, to: .leading, of: view, withOffset: 20)
    refineLabel.autoPinEdge(.trailing, to: .trailing, of: view, withOffset: -20)
    refineLabel.autoSetDimension(.height, toSize: 30)
    
    riskLabel.autoPinEdge(.bottom, to: .top, of: collectionView, withOffset: -10)
    riskLabel.autoPinEdge(.leading, to: .leading, of: refineLabel)
    riskLabel.autoSetDimensions(to: CGSize(width: 40, height: 15))
    
    collectionView.setCollectionViewLayout(collectionDirection, animated: true)
    collectionView.register(FilterCollectionCell.self, forCellWithReuseIdentifier: Messages.filterCell)
    collectionView.autoPinEdge(.leading, to: .leading, of: refineLabel)
    collectionView.autoPinEdge(.trailing, to: .trailing, of: refineLabel)
    collectionView.autoPinEdge(.top, to: .bottom, of: refineLabel, withOffset: 40)
    collectionView.autoSetDimension(.height, toSize: 50)
    
    categoryTextView.autoPinEdge(.leading, to: .leading, of: collectionView)
    categoryTextView.autoPinEdge(.trailing , to: .trailing, of: collectionView)
    categoryTextView.autoPinEdge(.top, to: .bottom, of: collectionView, withOffset: 35)
    categoryTextView.autoSetDimension(.height, toSize: 27)
    
    underView1.autoPinEdge(.top, to: .bottom, of: categoryTextView)
    underView1.autoPinEdge(.leading, to: .leading, of: categoryTextView)
    underView1.autoPinEdge(.trailing , to: .trailing, of: categoryTextView)
    underView1.autoSetDimension(.height, toSize: 0.5)
    
    minimumInvestmentTextView.autoPinEdge(.leading, to: .leading, of: categoryTextView)
    minimumInvestmentTextView.autoPinEdge(.trailing , to: .trailing, of: categoryTextView)
    minimumInvestmentTextView.autoPinEdge(.top, to: .bottom, of: categoryTextView, withOffset: 20)
    minimumInvestmentTextView.autoSetDimension(.height, toSize: 27)
    
    underView2.autoPinEdge(.top, to: .bottom, of: minimumInvestmentTextView)
    underView2.autoPinEdge(.leading, to: .leading, of: minimumInvestmentTextView)
    underView2.autoPinEdge(.trailing , to: .trailing, of: minimumInvestmentTextView)
    underView2.autoSetDimension(.height, toSize: 0.5)
    
    rescueTextView.autoPinEdge(.leading, to: .leading, of: minimumInvestmentTextView)
    rescueTextView.autoPinEdge(.trailing , to: .trailing, of: minimumInvestmentTextView)
    rescueTextView.autoPinEdge(.top, to: .bottom, of: minimumInvestmentTextView, withOffset: 20)
    rescueTextView.autoSetDimension(.height, toSize: 27)
    
    underView3.autoPinEdge(.top, to: .bottom, of: rescueTextView)
    underView3.autoPinEdge(.leading, to: .leading, of: rescueTextView)
    underView3.autoPinEdge(.trailing , to: .trailing, of: rescueTextView)
    underView3.autoSetDimension(.height, toSize: 0.5)
    
    filterBottomButton.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
    filterBottomButton.autoSetDimension(.height, toSize: 60)
  }
}
