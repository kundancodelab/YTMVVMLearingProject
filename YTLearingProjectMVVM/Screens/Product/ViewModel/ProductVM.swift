//
//  ProductVM.swift
//  YTLearingProjectMVVM
//
//  Created by User on 27/03/25.
//

import Foundation

final class ProductVM {
    var products:[ProductModel] = []
    var eventHandler : ((_ event:Event) -> Void)?  // Data Binding closure 
    
    func  fetchProduct()  {
        self.eventHandler?(.loading)
        APIManager.shared.callAPI(
            modelType: [ProductModel].self,
            type: EndPointsItems.products
        ) { response  in
            self.eventHandler?(.stopLoading)
            switch  response  {
            case .success(let products):
                //   print(products)
                self.products = products
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
                print(error)
            }
        }
    }
    /*
    func fetchProduct() {
        self.eventHandler?(.loading)
            APIManager.shared.fetchProductData() {
                response in
                self.eventHandler?(.stopLoading)
                switch  response  {
                case .success(let products):
                    //   print(products)
                    self.products = products
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    self.eventHandler?(.error(error))
                    print(error)
                }
            }
        
    }
     */
}
extension ProductVM {
    enum Event {
    case loading
    case stopLoading
    case dataLoaded
    case error(Error?)
    }
}



