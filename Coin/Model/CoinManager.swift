//
//  CoinManager.swift
//  Coin
//
//  Created by admin on 18.04.2022.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdatePrice(_ coinManager: CoinManager, coinPrice: CoinModel)
    func didFailWithError(error:Error)
}

struct CoinManager {

    let baseURL: String
    let apiKey: String
    var delegate: CoinManagerDelegate?

    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    init() {
        self.apiKey = (Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String)!
        self.baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    }
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: urlString)
    }

    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let saveData = data {
                    
                }
            }
        }
    }

}
