//
//  CollectionViewCell.swift
//  StarMovie
//
//  Created by Dmytro on 19.09.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var duration: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func addData(movieOnline: Movie) {
        title.text = movieOnline.name
        icon.downloaded(from: URL(string: movieOnline.imgPath!)!)
        duration.text = movieOnline.duration
    }
    
    override func systemLayoutSizeFitting(
            _ targetSize: CGSize,
            withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
            verticalFittingPriority: UILayoutPriority) -> CGSize {
            
            // Replace the height in the target size to
            // allow the cell to flexibly compute its height
            var targetSize = targetSize
            targetSize.height = CGFloat.greatestFiniteMagnitude
            
            // The .required horizontal fitting priority means
            // the desired cell width (targetSize.width) will be
            // preserved. However, the vertical fitting priority is
            // .fittingSizeLevel meaning the cell will find the
            // height that best fits the content
            let size = super.systemLayoutSizeFitting(
                targetSize,
                withHorizontalFittingPriority: .required,
                verticalFittingPriority: .fittingSizeLevel
            )
            
            return size
        }

}
