//
//  ProductModel.swift
//  YTLearingProjectMVVM
//
//  Created by User on 26/03/25.
//

import Foundation


struct ProductModel:Codable {
    let id:Int
    let title:String
    let price:Float
    let description:String
    let category:String
    let image:String
    
    let rating : RatingModel
        
}

struct RatingModel:Codable {
    let rate:Float
    let count:Int
}
