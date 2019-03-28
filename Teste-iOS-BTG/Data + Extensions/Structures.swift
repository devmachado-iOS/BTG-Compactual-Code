//
//  LabelMessages.swift
//  Teste-iOS-BTG
//
//  Created by Carlos Machado on 14/03/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import Foundation
import UIKit

class Messages{
  //Labels
  static let investmentNavTitle = "Fundos de Investimentos"
  static let filterNaviTitle = "Filtros"
  static let conservative = "CONSERVADOR"
  static let modest = "MODERADO"
  static let sophisticated = "SOFISTICADO"
  static let kInitInvestmentTextLabel = "APLICAÇÃO INICIAL (R$)"
  static let kTotalMonthTextLabel = "12 MESES"
  static let kRescueQuotaTextLabel = "RESGATE EM"
  static let kCurrentMontTextLabel = "MÊS ATUAL"
  static let kYearTextLabel = "ANO"
  static let kBeginTextLabel = "INÍCIO DO FUNDO"
  static let kNetTextLabel = "PATRIMÔNIO LÍQUIDO"
  static let kEndTextLabel = "ÚLTIMA COTA"
  static let kValueQuotaTextLabel = "VALOR DA COTA (R$)"
  static let detailTextLabel = "DETALHES"
  static let applyTextLabel = "APLICAR"
  
  //Cells
  static let investimentCell = "investmentCell"
  static let filterCell = "filterCell"
  
  //Others
  static let placeHolder = "Pesquisar"
  static let searchKey = "searchField"
  
}

class AssetNames{
  static let filther = "filter_icon"
  static let hasFund = "have_fund_flag"
  static let plus = "plus"
  static let plusCollapsed = "closeIcon"
  static let detailIcon = "detail_icon"
  static let applyIcon = "fund_rescue_icon"
  static let searchIcon = "search_icon"
  static let checkIcon = "check"
}

struct ProfitJSON
{
  var twelveMonths: Double?
  var month: Double?
  var year: Double?
  
  init(twelveMonths: Double, month: Double, year: Double) {
    self.twelveMonths = twelveMonths
    self.month = month
    self.year = year
  }
}

struct DetailJSON  {
  var rescueQuota: String?
  var categoryDescription: String?
  var dateQuota: String?
  var valueQuota: Double?
  
  init(rescueQuota: String, categoryDescription: String, dateQuota: String, valueQuota: Double) {
    self.rescueQuota = rescueQuota
    self.categoryDescription = categoryDescription
    self.dateQuota = dateQuota
    self.valueQuota = valueQuota
  }
}

struct FundJSON
{
  var issuerName: String?
  var type: String?
  var minimumInitialInvestment: Double?
  var netEquity: Double?
  var begin: String? 
  var profitability: ProfitJSON?
  var detail: DetailJSON
  var collapse: Bool
  
  init(issuerName: String, type: String, minimumInitialInvestment: Double, netEquity: Double,
       begin: String, profitability: ProfitJSON, detail: DetailJSON, collapse: Bool = false) {
    self.issuerName = issuerName
    self.type = type
    self.minimumInitialInvestment = minimumInitialInvestment
    self.netEquity = netEquity
    self.begin = begin
    self.profitability = profitability
    self.detail = detail
    self.collapse = collapse
  }
}

struct RiskCollection {
  let type: String
  let color: UIColor
  var isSelected: Bool
  
  init(type:String,color:UIColor,isSelected:Bool = true) {
    self.type = type
    self.color = color
    self.isSelected = isSelected
  }
}
