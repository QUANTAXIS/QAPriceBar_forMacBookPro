//
//  CoinPriceTouchBar.swift
//  CoinPriceBar
//
//

import Cocoa

class CoinPriceTouchBar: NSTouchBar {

  var prices: [Code: String] = [:] {
    didSet {
      items.forEach { $0.price = prices[$0.code] }
    }
  }

    private var items: [CoinPriceTouchBarItem] = supportedCoins.map { CoinPriceTouchBarItem(code: $0) }

  override init() {
    super.init()
    templateItems = Set(items)
    defaultItemIdentifiers = [.fixedSpaceSmall, .flexibleSpace] + items.flatMap { [$0.identifier, .flexibleSpace] } + [.fixedSpaceSmall]
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }
}
