//
//  CoinbasePriceProvider.swift
//  CoinPriceBar
//
//

struct CoinbasePriceProvider: CoinPriceProvider {

  func getPrice(of code: Code, completion: @escaping (String?) -> Void) {
    let url = URL(string: "http://www.yutiansut.com:8010/realtime/price?code=\(code.realcode())")!
    URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else {
        DispatchQueue.main.async {
          completion(nil)
        }
        return
      }
      guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
        let json = jsonObject as? [String: Any],
        let price = json["price"] as? Float64 else {
          DispatchQueue.main.async {
            completion(nil)
          }
          return
      }
      DispatchQueue.main.async {
        print(price)
        completion(String(price))
      }
    }.resume()
  }
}
