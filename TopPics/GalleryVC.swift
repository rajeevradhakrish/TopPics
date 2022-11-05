//
//  GalleryVC.swift
//  TopPics
//
//  Created by Rajeev Radhakrishnan on 05/11/22.
//

import UIKit

class GalleryVC: UIViewController {
    
    var 

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

//MARK: Collection view datasource and delegates

extension GalleryVC:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
    }

}
