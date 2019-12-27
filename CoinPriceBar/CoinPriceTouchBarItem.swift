//
//  CoinPriceTouchBarItem.swift
//  CoinPriceBar
//
//

import Cocoa

class CoinPriceTouchBarItem: NSTouchBarItem {

  let code: Code


  var price: String? {
    didSet {
      reloadText()
    }
  }

  private var textField: NSTextField = {
    let textField = NSTextField(labelWithString: "")
    return textField
  }()

  override var view: NSView? {
    return textField
  }

    init(code: Code) {
    self.code = code
    super.init(identifier: NSTouchBarItem.Identifier(rawValue: self.code.rawValue))
    textField.stringValue = identifier.rawValue
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  private func reloadText() {
    guard let price = price else { return }
    let coinSymbol = code.unicode()
    let string = "\(coinSymbol) \(price)"
    let attributedString = NSMutableAttributedString(string: string)
    attributedString.addAttribute(.foregroundColor, value: code.color(), range: (string as NSString).range(of: coinSymbol))
    textField.attributedStringValue = attributedString
  }
}
