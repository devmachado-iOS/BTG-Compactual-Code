//
//  Protocols.swift
//  Teste-iOS-BTG
//
//  Created by Carlos Machado on 21/03/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import UIKit


protocol FilterDelegate {
  func dataHandler(array:[String])
}

protocol InvestmentDelegate {
  func requesting()
}
