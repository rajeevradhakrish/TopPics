//
//  ImgUrGridCell.swift
//  TopPics
//
//  Created by Rajeev Radhakrishnan on 05/11/22.
//

import UIKit
import SDWebImage

class ImgUrGridCell: UICollectionViewCell {
    
    //Cell identifier
    
    static let cellIdentifier = "grid"
    
    //Outlets declaration
    
    @IBOutlet weak var imgUrImage: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var dateTime: UILabel!
    
    @IBOutlet weak var imageCount: UILabel!
    
    //MARK: SetUp Cell UI
    
    func setUPCell(item:ImgurCellModel)
    {
        imgUrImage.sd_setImage(with: URL(string: item.imageUrl ?? ""),placeholderImage: UIImage(named: "place-holder"))
        title.text = item.title
        dateTime.text = item.getFormattedDate()
        imageCount.text = "\(item.getImgCount())"
        self.contentView.setBorderWidth(width: 1, color: UIColor.getColorFromHex(color: theme.colors.themeMain))
        self.contentView.setCustomRoundedCornerRadius(value: 10)
    }
    
    
}
