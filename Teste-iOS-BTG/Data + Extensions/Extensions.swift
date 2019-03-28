import Foundation
import UIKit

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat? = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a!)
    }
    
    static let btg_blue = UIColor(r: 0.0, g: 143.0, b: 212.0)
    static let btg_green = UIColor(r: 166.0, g: 206.0, b: 57.0)
    static let btg_brown = UIColor(r: 154.0, g: 103.0, b: 53.0)
    static let btg_orange = UIColor(r: 245.0, g: 125.0, b: 13.0)
    static let btg_red = UIColor(r: 185.0, g: 72.0, b: 74.0)
    static let btg_mainColor = UIColor(r: 52.0, g: 64.0, b: 82.0)
    static let btg_gray = UIColor(r: 242.0, g: 242.0, b: 242.0)
}


extension UIFont
{
  static func extraLightFont(size:Int) -> UIFont{
    return UIFont(name: "SourceSansPro-ExtraLight", size: CGFloat(size))!
  }
  static func lightFont(size:Int) -> UIFont{
    return UIFont(name: "SourceSansPro-Light", size: CGFloat(size))!
  }
  static func regularFont(size:Int) -> UIFont{
    return UIFont(name: "SourceSansPro-Regular", size: CGFloat(size))!
  }
  static func semiboldFont(size:Int) -> UIFont{
    return UIFont(name: "SourceSansPro-Semibold", size: CGFloat(size))!
  }
  static func boldFont(size:Int) -> UIFont{
    return UIFont(name: "SourceSansPro-Bold", size: CGFloat(size))!
  }
}

extension UIViewController {
  func hideKeyboardWhenTappedAround() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
}

extension String {
  static func percentFormating(value: Double) -> String
  {return String(format: "%.2f%%", value) }
 
}
extension Date {
  static func getFormattedDate(string: String) -> String{
    let separateData = string.components(separatedBy: "T")
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    let formateDate = dateFormatter.date(from:separateData[0])!
    dateFormatter.dateFormat = "dd/MM/yyyy"
    
    return dateFormatter.string(from: formateDate)
  }
}

extension Formatter {
  static let withSeparator: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.groupingSeparator = "."
    formatter.numberStyle = .decimal
    formatter.decimalSeparator = ","
    return formatter
  }()
}
extension Double{
  var formattedWithSeparator: String {
    return Formatter.withSeparator.string(for: self) ?? ""
  }
}



