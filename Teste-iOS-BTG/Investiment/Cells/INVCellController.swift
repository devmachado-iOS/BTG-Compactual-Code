//
//  InvestmentsTableViewCell.swift
//  Teste-iOS-BTG
//
//  Created by Carlos Machado on 15/03/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class InvestimentsTableViewCell: UITableViewCell{
  
  let cellViewContainer = UIView().configureForAutoLayout()
  let topRightImage = UIImageView().configureForAutoLayout()
  let topView = UIView().configureForAutoLayout()
  let colorView = UIView().configureForAutoLayout()
  let issuerNameLabel = UILabel().configureForAutoLayout()
  let categoryDescriptionLabel = UILabel().configureForAutoLayout()
  
  let monthView = UIView().configureForAutoLayout()
  let kTotalMonthLabel = UILabel().configureForAutoLayout()
  let twelveMonthsValue = UILabel().configureForAutoLayout()
  
  let investmentView = UIView().configureForAutoLayout()
  let kminimumInitialInvestmentLabel = UILabel().configureForAutoLayout()
  let minimumInitialInvestmentValue = UILabel().configureForAutoLayout()
  
  let rescueView = UIView().configureForAutoLayout()
  let kRescueQuotaLabel = UILabel().configureForAutoLayout()
  let rescueQuotaValue = UILabel().configureForAutoLayout()
  
  let currentMonthView = UIView().configureForAutoLayout()
  let kCurrentMonthLabel = UILabel().configureForAutoLayout()
  let monthValue = UILabel().configureForAutoLayout()
  
  let yearView = UIView().configureForAutoLayout()
  let kYearLabel = UILabel().configureForAutoLayout()
  let yearValue = UILabel().configureForAutoLayout()
  
  let beginView = UIView().configureForAutoLayout()
  let kBeginQuotaDateLabel = UILabel().configureForAutoLayout()
  let beginQuotaValueLabel = UILabel().configureForAutoLayout()
  
  let netView = UIView().configureForAutoLayout()
  let kNetEquityLabel = UILabel().configureForAutoLayout()
  let netEquityValue = UILabel().configureForAutoLayout()
  
  let endView = UIView().configureForAutoLayout()
  let kEndQuotaDateLabel = UILabel().configureForAutoLayout()
  let dateQuotaValue = UILabel().configureForAutoLayout()
  
  let valueView = UIView().configureForAutoLayout()
  let kValueQuotaLabel = UILabel().configureForAutoLayout()
  let quotaValue = UILabel().configureForAutoLayout()
  
  let bottonView = UIView().configureForAutoLayout()
  let separatorView = UIView().configureForAutoLayout()
  let smallContainer1 = UIView().configureForAutoLayout()
  let smallContainer2 = UIView().configureForAutoLayout()
  let detailButton = UIButton().configureForAutoLayout()
  let applyButton = UIButton().configureForAutoLayout()
  let detailsOptionImage = UIImageView().configureForAutoLayout()
  let applyOptionImage = UIImageView().configureForAutoLayout()
  let detailLabel = UILabel().configureForAutoLayout()
  let applyLabel = UILabel().configureForAutoLayout()
  let collapseButton = UIButton().configureForAutoLayout()
  let kcollapseButtonDiameter = 30
  let kBottonImagesDimention = 23
  let kBottonButtonDimention = 55
  
  func cellInitializer(collapsed: Bool)
  {
    
    addSubview(cellViewContainer)
    addSubview(collapseButton)
    cellViewContainer.addSubview(topView)
    cellViewContainer.addSubview(separatorView)
    cellViewContainer.addSubview(monthView)
    cellViewContainer.addSubview(investmentView)
    cellViewContainer.addSubview(rescueView)
    topView.addSubview(topRightImage)
    topView.addSubview(colorView)
    topView.addSubview(issuerNameLabel)
    topView.addSubview(categoryDescriptionLabel)
    monthView.addSubview(kTotalMonthLabel)
    monthView.addSubview(twelveMonthsValue)
    investmentView.addSubview(kminimumInitialInvestmentLabel)
    investmentView.addSubview(minimumInitialInvestmentValue)
    rescueView.addSubview(kRescueQuotaLabel)
    rescueView.addSubview(rescueQuotaValue)
    
    
    //MARK:- ITENS CONFIGURATION
    
    self.backgroundColor = .clear
    cellViewContainer.layer.cornerRadius = 3
    cellViewContainer.backgroundColor = .white
    
    //TOPVIEW
    topRightImage.image = UIImage(named: AssetNames.hasFund)
    issuerNameLabel.numberOfLines = 0
    issuerNameLabel.font = UIFont.semiboldFont(size: 15)
    categoryDescriptionLabel.font = UIFont.lightFont(size:9)

    
    //MonthView
    kTotalMonthLabel.font = UIFont.regularFont(size:9)
    kTotalMonthLabel.textColor = UIColor.darkGray
    kTotalMonthLabel.text = Messages.kTotalMonthTextLabel
    twelveMonthsValue.font = UIFont.semiboldFont(size:13)
    twelveMonthsValue.textColor = UIColor.darkGray
    
    //InvestimentView
    kminimumInitialInvestmentLabel.font = UIFont.regularFont(size:9)
    kminimumInitialInvestmentLabel.textColor = UIColor.darkGray
    kminimumInitialInvestmentLabel.text = Messages.kInitInvestmentTextLabel
    minimumInitialInvestmentValue.font = UIFont.semiboldFont(size:13)
    minimumInitialInvestmentValue.textColor = UIColor.darkGray
    
    //RescueView
    kRescueQuotaLabel.font = UIFont.regularFont(size:9)
    kRescueQuotaLabel.textColor = UIColor.darkGray
    kRescueQuotaLabel.text = Messages.kRescueQuotaTextLabel
    rescueQuotaValue.font = UIFont.semiboldFont(size:13)
    rescueQuotaValue.textColor = UIColor.darkGray
    
    //CollapseButton
    collapseButton.layer.cornerRadius = CGFloat(kcollapseButtonDiameter/2)
    
    if(collapsed != true){
      //CollapseButton
      collapseButton.setImage(UIImage(named:AssetNames.plus), for: .normal)
      collapseButton.contentMode = .center
      collapseButton.tintColor = .white
      collapseButton.backgroundColor = UIColor.btg_mainColor
      
      currentMonthView.removeFromSuperview()
      yearView.removeFromSuperview()
      beginView.removeFromSuperview()
      netView.removeFromSuperview()
      endView.removeFromSuperview()
      valueView.removeFromSuperview()
      bottonView.removeFromSuperview()
     
    }else{
      cellViewContainer.addSubview(currentMonthView)
      cellViewContainer.addSubview(yearView)
      cellViewContainer.addSubview(beginView)
      cellViewContainer.addSubview(netView)
      cellViewContainer.addSubview(endView)
      cellViewContainer.addSubview(valueView)
      cellViewContainer.addSubview(bottonView)
      currentMonthView.addSubview(kCurrentMonthLabel)
      currentMonthView.addSubview(monthValue)
      yearView.addSubview(kYearLabel)
      yearView.addSubview(yearValue)
      beginView.addSubview(kBeginQuotaDateLabel)
      beginView.addSubview(beginQuotaValueLabel)
      netView.addSubview(kNetEquityLabel)
      netView.addSubview(netEquityValue)
      endView.addSubview(kEndQuotaDateLabel)
      endView.addSubview(dateQuotaValue)
      valueView.addSubview(kValueQuotaLabel)
      valueView.addSubview(quotaValue)
      bottonView.addSubview(smallContainer1)
      bottonView.addSubview(smallContainer2)
      smallContainer1.addSubview(detailButton)
      smallContainer1.addSubview(detailLabel)
      smallContainer1.addSubview(detailsOptionImage)
      smallContainer2.addSubview(applyButton)
      smallContainer2.addSubview(applyLabel)
      smallContainer2.addSubview(applyOptionImage)
      
      //YEAR VIEW
      kYearLabel.font = UIFont.regularFont(size:9)
      kYearLabel.textColor = UIColor.darkGray
      kYearLabel.text = Messages.kYearTextLabel
      yearValue.font = UIFont.semiboldFont(size:13)
      yearValue.textColor = UIColor.darkGray
      
      //CURRENT MONTH VIEW
      kCurrentMonthLabel.font = UIFont.regularFont(size:9)
      kCurrentMonthLabel.textColor = UIColor.darkGray
      kCurrentMonthLabel.text = Messages.kCurrentMontTextLabel
      monthValue.font = UIFont.semiboldFont(size:13)
      monthValue.textColor = UIColor.darkGray
      
      //NET VIEW
      kNetEquityLabel.font = UIFont.regularFont(size:9)
      kNetEquityLabel.textColor = UIColor.darkGray
      kNetEquityLabel.text = Messages.kNetTextLabel
      netEquityValue.font = UIFont.semiboldFont(size:13)
      netEquityValue.textColor = UIColor.darkGray
      
      //BEGIN MONTH VIEW
      kBeginQuotaDateLabel.font = UIFont.regularFont(size:9)
      kBeginQuotaDateLabel.textColor = UIColor.darkGray
      kBeginQuotaDateLabel.text = Messages.kBeginTextLabel
      beginQuotaValueLabel.font = UIFont.semiboldFont(size:13)
      beginQuotaValueLabel.textColor = UIColor.darkGray
      
      //VALUE VIEW
      kValueQuotaLabel.font = UIFont.regularFont(size:9)
      kValueQuotaLabel.textColor = UIColor.darkGray
      kValueQuotaLabel.text = Messages.kValueQuotaTextLabel
      quotaValue.font = UIFont.semiboldFont(size:13)
      quotaValue.textColor = UIColor.darkGray
      
      //END MONTH VIEW
      kEndQuotaDateLabel.font = UIFont.regularFont(size:9)
      kEndQuotaDateLabel.textColor = UIColor.darkGray
      kEndQuotaDateLabel.text = Messages.kEndTextLabel
      dateQuotaValue.font = UIFont.semiboldFont(size:13)
      dateQuotaValue.textColor = UIColor.darkGray
      
      //BOTTONVIEW
      bottonView.backgroundColor = UIColor.btg_mainColor
      detailsOptionImage.image = UIImage(named: AssetNames.detailIcon)
      detailsOptionImage.backgroundColor = .clear
      detailsOptionImage.tintColor = .clear
      detailLabel.text = Messages.detailTextLabel
      detailLabel.textAlignment = .center
      detailLabel.textColor = .white
      detailLabel.font = UIFont.regularFont(size: 14)
      applyOptionImage.image = UIImage(named: AssetNames.applyIcon)
      applyLabel.text = Messages.applyTextLabel
      applyLabel.textAlignment = .center
      applyLabel.textColor = .white
      applyLabel.font = UIFont.regularFont(size: 14)
      
      //CollapseButton
      collapseButton.setImage(UIImage(named:AssetNames.plusCollapsed), for: .normal)
      collapseButton.imageView?.contentMode = UIView.ContentMode.center
      collapseButton.tintColor = UIColor.btg_blue
      collapseButton.backgroundColor = UIColor.white
    }

    autoLayoutHandler(collapsed: collapsed)
  }
  
  
  func autoLayoutHandler(collapsed: Bool)
  {
    //MARK:- ITENS AUTOLAYOUT
    
    //CONTAINER VIEW
    cellViewContainer.autoPinEdge(.leading, to: .leading, of: cellViewContainer.superview!, withOffset: 12)
    cellViewContainer.autoPinEdge(.trailing, to: .trailing, of: cellViewContainer.superview!, withOffset: -12)
    cellViewContainer.autoPinEdge(.top, to: .top, of: cellViewContainer.superview!, withOffset: 10)
    cellViewContainer.autoPinEdge(.bottom, to: .bottom, of: cellViewContainer.superview!, withOffset: -20)
    
    //SEPARATOR VIEW
    separatorView.autoAlignAxis(toSuperviewAxis: .vertical)
    separatorView.autoPinEdge(.top, to: .top, of: cellViewContainer)
    separatorView.autoPinEdge(.bottom, to: .bottom, of: cellViewContainer)
    separatorView.autoSetDimension(.width, toSize: 1)
    
    //TOP VIEW
    topView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
    topView.autoSetDimension(.height, toSize: 60)
    colorView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .trailing)
    colorView.autoSetDimension(.width, toSize: 4)
    topRightImage.autoPinEdge(.top, to: .top, of: topView, withOffset: -1)
    topRightImage.autoPinEdge(.trailing, to: .trailing, of: topView, withOffset: -20)
    topRightImage.autoSetDimensions(to: CGSize(width: 15, height: 15))
    issuerNameLabel.autoPinEdge(.top, to: .top, of: topView, withOffset:5)
    issuerNameLabel.autoPinEdge(.leading, to: .trailing, of: colorView, withOffset: 12)
    issuerNameLabel.autoPinEdge(.trailing, to: .trailing, of: topView, withOffset: -45)
    issuerNameLabel.autoSetDimension(.height, toSize: 40)
    categoryDescriptionLabel.autoPinEdge(.top, to: .bottom, of: issuerNameLabel)
    categoryDescriptionLabel.autoPinEdge(.bottom, to: .bottom, of: topView)
    categoryDescriptionLabel.autoPinEdge(.leading, to: .leading, of: issuerNameLabel)
    categoryDescriptionLabel.autoSetDimension(.width, toSize: 100)
    
    //INVESTIMENT VIEW
    investmentView.autoPinEdge(.top, to: .bottom, of: topView, withOffset: 5)
    investmentView.autoPinEdge(.leading, to: .leading, of: separatorView, withOffset: -40)
    investmentView.autoPinEdge(.trailing, to: .trailing, of: separatorView, withOffset: 60)
    investmentView.autoSetDimension(.height, toSize: 30)
    kminimumInitialInvestmentLabel.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
    kminimumInitialInvestmentLabel.autoSetDimension(.height, toSize: 10)
    minimumInitialInvestmentValue.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
    minimumInitialInvestmentValue.autoPinEdge(.top, to: .bottom, of: kminimumInitialInvestmentLabel)
    
    //MONTH VIEW
    monthView.autoPinEdge(.leading, to: .leading, of: issuerNameLabel)
    monthView.autoPinEdge(.trailing, to: .leading, of: investmentView, withOffset:-20)
    monthView.autoPinEdge(.top, to: .top, of: investmentView)
    monthView.autoSetDimension(.height, toSize: 30)
    kTotalMonthLabel.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
    kTotalMonthLabel.autoSetDimension(.height, toSize: 10)
    twelveMonthsValue.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
    twelveMonthsValue.autoPinEdge(.top, to: .bottom, of: kTotalMonthLabel)
    
    //RESCUE VIEW
    rescueView.autoPinEdge(.trailing, to: .leading, of: topRightImage, withOffset: 10)
    rescueView.autoPinEdge(.leading, to: .trailing, of: investmentView, withOffset:10, relation: .greaterThanOrEqual)
    rescueView.autoPinEdge(.top, to: .top, of: investmentView)
    rescueView.autoSetDimension(.height, toSize: 30)
    kRescueQuotaLabel.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
    kRescueQuotaLabel.autoSetDimension(.height, toSize: 10)
    rescueQuotaValue.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
    rescueQuotaValue.autoPinEdge(.top, to: .bottom, of: kRescueQuotaLabel)
    
    if(collapsed == true)
    {
      
      //YEAR VIEW
      yearView.autoPinEdge(.top, to: .bottom, of: investmentView, withOffset: 15)
      yearView.autoPinEdge(.leading, to: .leading, of: investmentView)
      yearView.autoPinEdge(.trailing, to: .trailing, of: investmentView)
      yearView.autoSetDimension(.height, toSize: 30)
      kYearLabel.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
      kYearLabel.autoSetDimension(.height, toSize: 10)
      yearValue.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
      yearValue.autoPinEdge(.top, to: .bottom, of: kYearLabel)
      
      //CURRENT MONTH VIEW
      currentMonthView.autoPinEdge(.leading, to: .leading, of: issuerNameLabel)
      currentMonthView.autoPinEdge(.trailing, to: .leading, of: investmentView, withOffset:-20)
      currentMonthView.autoPinEdge(.top, to: .top, of: yearView)
      currentMonthView.autoSetDimension(.height, toSize: 30)
      kCurrentMonthLabel.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
      kCurrentMonthLabel.autoSetDimension(.height, toSize: 10)
      monthValue.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
      monthValue.autoPinEdge(.top, to: .bottom, of: kCurrentMonthLabel)
      
      //NET VIEW
      netView.autoPinEdge(.top, to: .bottom, of: yearView, withOffset: 15)
      netView.autoPinEdge(.leading, to: .leading, of: investmentView)
      netView.autoPinEdge(.trailing, to: .trailing, of: investmentView)
      netView.autoSetDimension(.height, toSize: 30)
      kNetEquityLabel.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
      kNetEquityLabel.autoSetDimension(.height, toSize: 10)
      netEquityValue.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
      netEquityValue.autoPinEdge(.top, to: .bottom, of: kNetEquityLabel)
      
      //BEGIN VIEW
      beginView.autoPinEdge(.leading, to: .leading, of: issuerNameLabel)
      beginView.autoPinEdge(.trailing, to: .leading, of: investmentView, withOffset:-20)
      beginView.autoPinEdge(.top, to: .top, of: netView)
      beginView.autoSetDimension(.height, toSize: 30)
      kBeginQuotaDateLabel.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
      kBeginQuotaDateLabel.autoSetDimension(.height, toSize: 10)
      beginQuotaValueLabel.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
      beginQuotaValueLabel.autoPinEdge(.top, to: .bottom, of: kBeginQuotaDateLabel)
      
      //VALUE VIEW
      valueView.autoPinEdge(.top, to: .bottom, of: netView, withOffset: 15)
      valueView.autoPinEdge(.leading, to: .leading, of: investmentView)
      valueView.autoPinEdge(.trailing, to: .trailing, of: investmentView)
      valueView.autoSetDimension(.height, toSize: 30)
      kValueQuotaLabel.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
      kValueQuotaLabel.autoSetDimension(.height, toSize: 10)
      quotaValue.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
      quotaValue.autoPinEdge(.top, to: .bottom, of: kValueQuotaLabel)
      
      //END VIEW
      endView.autoPinEdge(.leading, to: .leading, of: issuerNameLabel)
      endView.autoPinEdge(.trailing, to: .leading, of: investmentView, withOffset:-20)
      endView.autoPinEdge(.top, to: .top, of: valueView)
      endView.autoSetDimension(.height, toSize: 30)
      kEndQuotaDateLabel.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
      kEndQuotaDateLabel.autoSetDimension(.height, toSize: 10)
      dateQuotaValue.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
      dateQuotaValue.autoPinEdge(.top, to: .bottom, of: kEndQuotaDateLabel)
      
      
      //BOTTON VIEW
      bottonView.autoPinEdgesToSuperviewSafeArea(with: .zero, excludingEdge: .top)
      bottonView.autoSetDimension(.height, toSize: 60)
      
      //DETAIL OPTION VIEW
      smallContainer1.autoPinEdgesToSuperviewSafeArea(with: .zero, excludingEdge: .trailing)
      smallContainer1.autoPinEdge(.trailing, to: .leading, of: separatorView)
      detailButton.autoAlignAxis(toSuperviewAxis: .horizontal)
      detailButton.autoAlignAxis(toSuperviewAxis: .vertical)
      detailButton.autoSetDimensions(to: CGSize(width: kBottonButtonDimention, height: kBottonButtonDimention))
      detailsOptionImage.autoSetDimensions(to: CGSize(width: kBottonImagesDimention, height: kBottonImagesDimention))
      detailsOptionImage.autoPinEdge(.top, to: .top, of: bottonView, withOffset: 10)
      detailsOptionImage.autoAlignAxis(toSuperviewAxis: .vertical)
      detailLabel.autoAlignAxis(toSuperviewAxis: .vertical)
      detailLabel.autoPinEdge(.top, to: .bottom, of: detailsOptionImage, withOffset: 2)
      detailLabel.autoSetDimensions(to: CGSize(width: 100, height: 20))

      //APPLY OPTION VIEW
      smallContainer2.autoPinEdge(.trailing,
                                  to: .leading,
                                  of: collapseButton,
                                  withOffset: -15,
                                  relation: .greaterThanOrEqual)
      smallContainer2.autoPinEdge(.top, to: .top, of: bottonView)
      smallContainer2.autoPinEdge(.bottom, to: .bottom, of: bottonView)
      smallContainer2.autoPinEdge(.leading, to: .trailing, of: separatorView)
      applyButton.autoAlignAxis(toSuperviewAxis: .horizontal)
      applyButton.autoAlignAxis(toSuperviewAxis: .vertical)
      applyButton.autoSetDimensions(to: CGSize(width: kBottonButtonDimention, height: kBottonButtonDimention))
      applyOptionImage.autoSetDimensions(to: CGSize(width: kBottonImagesDimention, height: kBottonImagesDimention))
      applyOptionImage.autoPinEdge(.top, to: .top, of: bottonView, withOffset: 10)
      applyOptionImage.autoAlignAxis(toSuperviewAxis: .vertical)
      applyLabel.autoAlignAxis(toSuperviewAxis: .vertical)
      applyLabel.autoPinEdge(.top, to: .bottom, of: detailsOptionImage, withOffset: 2)
      applyLabel.autoSetDimensions(to: CGSize(width: 50, height: 20))
      
    }
    
    //COLLAPSE BUTTON
    collapseButton.autoSetDimensions(to: CGSize(width: kcollapseButtonDiameter, height: kcollapseButtonDiameter))
    collapseButton.autoPinEdge(.trailing,
                               to: .trailing,
                               of: cellViewContainer,
                               withOffset: -CGFloat(kcollapseButtonDiameter/2))
    collapseButton.autoPinEdge(.top,
                               to: .bottom,
                               of: cellViewContainer,
                               withOffset: -CGFloat(kcollapseButtonDiameter/2))
  }

}
