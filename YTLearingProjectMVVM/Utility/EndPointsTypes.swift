//
//  EndPointsTypes.swift
//  YTLearingProjectMVVM
//
//  Created by User on 06/04/25.
//

import Foundation
enum HTTPMethods :String {
    case get = "GET"
    case post = "POST"
}

protocol EndPointType {
    var path: String { get }
    var baseURL: String { get }
    var url:String { get }
    var method: HTTPMethods { get }
  //  var parameters: [String: Any]? { get }
}

enum EndPointsItems {
    case products
  
}
extension EndPointsItems: EndPointType {
    var path: String {
        switch self {
        case .products:
            return "products"
        }
    }
    
    var baseURL: String {
        return "https://fakestoreapi.com/"
    }
    var url: String {
        switch self {
        case .products:
            return "\(baseURL)\(path)"
        }
    }
    
    var method: HTTPMethods {
        switch self {
        case .products:
            return .get
        }
    }
    
//    var parameters: [String : Any]? {
//        <#code#>
//    }
  
}
