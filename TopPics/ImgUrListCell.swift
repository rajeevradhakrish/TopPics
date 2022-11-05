//
//  ImgUrListCell.swift
//  TopPics
//
//  Created by Rajeev Radhakrishnan on 05/11/22.
//

import UIKit

class ImgUrListCell: UICollectionViewCell {
    
    static let cellIdentifier = "list"
    
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
        dateTime.text = ""
        imageCount.text = "\(item.imagesCount ?? 0)"
        self.contentView.
    }
    
    
}
