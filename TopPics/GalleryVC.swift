//
//  GalleryVC.swift
//  TopPics
//
//  Created by Rajeev Radhakrishnan on 05/11/22.
//

import UIKit

class GalleryVC: UIViewController {
    
    
    @IBOutlet weak var imgUrlCollection: UICollectionView!
    
    
    var imgUrList = [ImgurCellModel]()
    
    var galleryVM = GalleryVM()
    
    var currentCellType:CellType = .list
    {
        didSet
        {
            imgUrlCollection.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        galleryVM.fetchAPI(VC: self, searchStr: "cat", completion: {[weak self] in
            guard let sSelf = self else {return}
            ExecuteOnMain {
                sSelf.imgUrlCollection.reloadData()
            }
        })
    }
    
    
}

//MARK: Collection view datasource and delegates

extension GalleryVC:UICollectionViewDataSource,UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return galleryVM.imgurArr.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        galleryVM.getImgUrCell(collection: collectionView, index: indexPath, type: currentCellType)
    }
}

//MARK: Flow layout delegates

extension GalleryVC:UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(collectionView.frame.width-20)/3 , height: ((collectionView.frame.width-15)/3)*1.4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
}
