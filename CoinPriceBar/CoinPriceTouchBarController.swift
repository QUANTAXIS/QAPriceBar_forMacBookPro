//
//  CoinPriceTouchBarController.swift
//  CoinPriceBar
//

import Cocoa

class CoinPriceTouchBarController: NSViewController {

  private let priceRefreshInterval: TimeInterval = 1
  private let coinPriceTouchBar = CoinPriceTouchBar()

  init() {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  override func loadView() {
    self.view = NSView()
  }

  override func makeTouchBar() -> NSTouchBar? {
    return coinPriceTouchBar
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    for code in supportedCoins {
        getPrice(of: code)
    }
  }

    private func getPrice(of code:Code) {
    code.priceProvider().getPrice(of: code) { [weak self] price in
      guard let sself = self else { return }
      sself.coinPriceTouchBar.prices[code] = price
      Timer.scheduledTimer(withTimeInterval: sself.priceRefreshInterval, repeats: false) { [weak sself] _ in
        sself?.getPrice(of: code)
      }
    }
  }
}
