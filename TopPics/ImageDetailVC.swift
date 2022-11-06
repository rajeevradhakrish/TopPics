//
//  ImageDetailVC.swift
//  TopPics
//
//  Created by Rajeev Radhakrishnan on 06/11/22.
//

import UIKit
import WebKit

class ImageDetailVC: UIViewController {
    
    //MARK: Image view delaration
    
    @IBOutlet weak var imgurImage: UIImageView!
    
    
    var imageUrl = ""
    
    //MARK: View management
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        loadImageView()
        
    }
    
    //MARK: Load image
    
    func loadImageView()
    {
        imgurImage.sd_setImage(with: URL(string: imageUrl),placeholderImage: UIImage(named: "place-holder"))
    }
    
}
