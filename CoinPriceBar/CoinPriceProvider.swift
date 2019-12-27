//
//  CoinPriceProvider.swift
//  CoinPriceBar
//
//  Created by Thanh Pham on 12/12/17.
//  Copyright © 2017 Thanh Pham. All rights reserved.
//

protocol CoinPriceProvider {
    func getPrice(of: Code,completion: @escaping (String?) -> Void)
}
