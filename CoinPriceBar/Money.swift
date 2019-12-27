//
//  Money.swift

//

typealias FreedomMoney = Code

enum Code: String {
  case SHI
  case HS300
  case RBL8
  case JML8
  case JL8
}


extension Code {

  func priceProvider() -> CoinPriceProvider {
    switch self {
    default: return CoinbasePriceProvider()
    }
  }
}

extension Code {

  func unicode() -> String {
    switch self {

    case .SHI: return "上证指数"
    case .HS300: return "沪深300"
    case .JL8: return "焦炭主连"
    case .RBL8: return "螺纹主连"
    case .JML8: return "焦煤主连"
    }
  }
  func realcode() -> String {
    switch self {
        case .SHI: return "000001&market=index_cn"
        case .HS300: return "000300&market=index_cn"
        case .JL8: return "JL8&market=future_cn"
        case .RBL8: return "RBL8&market=future_cn"
        case .JML8: return "JML8&market=future_cn"
  }
}

  func color() -> NSColor {
    switch self {
    case .SHI: return NSColor(displayP3Red: 154 / 255, green: 193 / 255, blue: 98 / 255, alpha: 1)
    case .HS300: return NSColor(displayP3Red: 115 / 255, green: 123 / 255, blue: 182 / 255, alpha: 1)
    case .JML8: return NSColor(displayP3Red: 85 / 255, green: 183 / 255, blue: 182 / 255, alpha: 1)
    case .RBL8: return NSColor(displayP3Red: 43 / 255, green: 103 / 255, blue: 182 / 255, alpha: 1)
    case .JL8: return NSColor(displayP3Red: 123 / 255, green: 33 / 255, blue: 182 / 255, alpha: 1)
    }
  }
}
