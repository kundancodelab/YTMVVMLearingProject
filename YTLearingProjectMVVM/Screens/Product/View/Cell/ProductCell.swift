//
//  ProductCell.swift
//  YTLearingProjectMVVM
//
//  Created by User on 28/03/25.
//

import UIKit

class ProductCell: UITableViewCell {
   // MARK: Outlets
    @IBOutlet weak var productBackgroundView: UIView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var ratingLabel: UIButton!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    var product : ProductModel? {
        didSet {   // Property Observer
            productDetailConfiguration()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        productBackgroundView.clipsToBounds = false
        productBackgroundView.layer.cornerRadius = 15
        productImage.layer.contents = 10
        self.productBackgroundView.backgroundColor = .systemGray6
       
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func didTapBuyButton(_ sender: UIButton) {
    }
    func productDetailConfiguration() {
       guard let product else { return }
        productTitle.text = product.title
        productImage.setImage(with: product.image)
        categoryLabel.text = product.category
        ratingLabel.setTitle("\(product.rating.rate)", for: .normal)
        productDescription.text = product.description
        priceLabel.text = "$\(product.price)"
    }
  
}
