//
//  FilterCell.swift
//  Teste-iOS-BTG
//
//  Created by Carlos Machado on 19/03/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import Foundation
import UIKit
import PureLayout


class FilterCollectionCell: UICollectionViewCell{
  
  let cellContainer = UIView().configureForAutoLayout()
  let checkViewContainer = UIView().configureForAutoLayout()
  let checkImageView = UIImageView().configureForAutoLayout()
  let typeLabel = UILabel().configureForAutoLayout()
  let colorView = UIView().configureForAutoLayout()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    filterCellBuild()
    cellAutoLayout()
    
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func filterCellBuild()
  {
    addSubview(cellContainer)
    cellContainer.addSubview(checkViewContainer)
    checkViewContainer.addSubview(checkImageView)
    cellContainer.addSubview(typeLabel)
    cellContainer.addSubview(colorView)
    
    checkImageView.tintColor = .white
    checkImageView.backgroundColor = UIColor.btg_blue
    checkImageView.contentMode = .center
    checkImageView.image = UIImage(named: AssetNames.checkIcon)
    checkImageView.layer.cornerRadius = 3
    checkViewContainer.backgroundColor = .clear
    checkViewContainer.layer.borderWidth = 1
    checkViewContainer.layer.cornerRadius = 3
    typeLabel.font = UIFont.semiboldFont(size: 10)
    typeLabel.textColor = .darkGray
    typeLabel.textAlignment = .center
  }
  
  
  func cellAutoLayout()
  {
    cellContainer.autoPinEdgesToSuperviewEdges()
    checkViewContainer.autoAlignAxis(toSuperviewAxis: .vertical)
    checkViewContainer.autoPinEdge(.top, to: .top, of: cellContainer, withOffset: 1)
    checkViewContainer.autoSetDimensions(to: CGSize(width: 28, height: 28))
    checkImageView.autoPinEdgesToSuperviewEdges(with: .init(top: 2, left: 2, bottom: 2, right: 2))
    
    typeLabel.autoPinEdge(.top, to: .bottom, of: checkViewContainer, withOffset: 5)
    typeLabel.autoSetDimension(.height, toSize: 10)
    typeLabel.autoPinEdge(.leading, to: .leading, of: cellContainer, withOffset: 5)
    typeLabel.autoPinEdge(.trailing, to: .trailing, of: cellContainer, withOffset: -5)
    
    colorView.autoPinEdge(.top, to: .bottom, of: typeLabel, withOffset: 2)
    colorView.autoPinEdge(.bottom, to: .bottom, of: cellContainer)
    colorView.autoPinEdge(.leading, to: .leading, of: typeLabel)
    colorView.autoPinEdge(.trailing, to: .trailing, of: typeLabel)
  }
}
