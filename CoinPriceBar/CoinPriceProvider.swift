//
//  CoinPriceProvider.swift
//  CoinPriceBar

//

protocol CoinPriceProvider {
    func getPrice(of: Code,completion: @escaping (String?) -> Void)
}
