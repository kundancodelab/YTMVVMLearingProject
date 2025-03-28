//
//  ProductListViewController.swift
//  YTLearingProjectMVVM
//
//  Created by User on 26/03/25.
//

import UIKit
import MBProgressHUD

class ProductListViewController: UIViewController {
    @IBOutlet weak var productTableView: UITableView!
    private var productViewModel = ProductVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTalbeView(productTableView)
        configuration()
    }
    func configureTalbeView(_ tableView: UITableView){
        tableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        tableView.delegate = self
        tableView.dataSource = self
       // tableView.separatorStyle = .none
    }
 
}
extension ProductListViewController {
    func configuration(){
        initViewModel()
        observeEvent()
    }
    func initViewModel(){
        productViewModel.fetchProduct()
    }
    // MARK: Data binding event communication will be done here between ViewModel and View
    func observeEvent(){
        productViewModel.eventHandler  = { [weak self] event in
            guard let self = self else { return }
                       switch event {
                       case .loading:
                           print("Product Loading...")
                       case .stopLoading:
                          print("Stop Loading...")
                       case .dataLoaded:
                           print("Data loaded...")
                           print(self.productViewModel.products)
                           DispatchQueue.main.async {
                               self.productTableView.reloadData()
                           }
                       case .error(let error):
                           print(error ?? "Error" )
                       }
        }
    }
}

// MARK: UITableView Delegates & DataSource Methods
extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productViewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"ProductCell", for: indexPath) as? ProductCell else {
            fatalError("Could not dequeue cell")
        }
        let product = productViewModel.products[indexPath.row]
        cell.product = product
         return cell
    }
   
}
extension UIViewController{
    func showHUD(progressLabel:String) {
        DispatchQueue.main.async {
            let progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
            progressHUD.label.text = progressLabel
        }
    }
    
    func dismissHUD(isAnimated:Bool){
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: isAnimated)
        }
    }
}


