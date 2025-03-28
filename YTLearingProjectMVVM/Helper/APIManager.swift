//
//  APIManager.swift
//  YTLearingProjectMVVM
//
//  Created by User on 26/03/25.
//

import Foundation
import UIKit

enum DataError:Error {
    case invalidURL
    case invalidData
    case invalidResponse
    case network(Error?)
    
}

typealias handler = (Result<[ProductModel], DataError>) -> Void
// Singlton Design Patern
final class APIManager {
    static let shared = APIManager()
    
    private init() {}
    func   fetchProductData(completion : @escaping handler ) {
        
        guard let url = URL(string: Constant.API.productURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
       URLSession.shared.dataTask(with: url) { (data, response, error) in
           guard let data , error == nil else {
               completion(.failure(.invalidData))
               return
           }
           
           guard let  response = response  as? HTTPURLResponse ,   200 ... 299 ~= response.statusCode else {
               completion(.failure(.invalidResponse))
               return
           }
           
           do {
               let products =  try JSONDecoder().decode([ProductModel].self, from: data)
               completion(.success(products))
           }catch  {
               completion(.failure(.network(error)))
           }
           
       }.resume()
        
        
    }
}
