//
//  ImageView+Extension.swift
//  YTLearingProjectMVVM
//
//  Created by User on 28/03/25.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let resource = KF.ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
