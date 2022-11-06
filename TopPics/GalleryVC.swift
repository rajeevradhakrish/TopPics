//
//  GalleryVC.swift
//  TopPics
//
//  Created by Rajeev Radhakrishnan on 05/11/22.
//

import UIKit

class GalleryVC: UIViewController {
    
    //MARK: Collection view outlet
    
    @IBOutlet weak var imgUrlCollection: UICollectionView!
    
    //MARK: Variable declaration
    
    var imgUrList = [ImgurCellModel]()
    
    var galleryVM = GalleryVM()
    
    var currentCellType:CellType = .list
    {
        didSet
        {
            imgUrlCollection.reloadData()
        }
    }
    
   //MARK: View management
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setUPGridListButton()
        //Fetch IMGur with default "Latest" search
        loadSearchData(searchText: "Latest")
    }
    
    //MARK: Load IMGur images
    
    func loadSearchData(searchText:String)
    {
        galleryVM.fetchAPI(VC: self, searchStr: searchText, completion: {[weak self] in
            guard let sSelf = self else {return}
            ExecuteOnMain {
                sSelf.imgUrlCollection.reloadData()
            }
        })
    }
    
    //MARK: Functions
    
    func setUPGridListButton()
    {
        let gridListButton = UIButton()
        gridListButton.setImage(UIImage(named: "list"), for: .normal)
        gridListButton.setImage(UIImage(named: "grid"), for: .selected)
        gridListButton.addTarget(self, action: #selector(toggleGridList(sender:)), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: gridListButton)
    }
    
    //Toggle action
    
    @objc func toggleGridList(sender:UIButton)
    {
        sender.isSelected = !sender.isSelected
        currentCellType = sender.isSelected ? .grid : .list
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
        return currentCellType == .list ? CGSize(width:(collectionView.frame.width-20)/3 , height: ((collectionView.frame.width-15)/3)*1.4) : CGSize(width:(collectionView.frame.width-20) , height: ((collectionView.frame.width-20)/2.77))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return currentCellType == .list ?  5 : 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return currentCellType == .list ? UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5) : UIEdgeInsets(top: 10, left: 10, bottom: 5, right: 10)
    }
    
}

//MARK: Search bar delegates

extension GalleryVC:UISearchBarDelegate
{
    //Show cancel button when search start
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar){
        searchBar.showsCancelButton = true
    }
    
    //Search button click handled here
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.showsCancelButton = false
        loadSearchData(searchText: searchBar.text ?? "")
        searchBar.resignFirstResponder()
    }
    
    //Cancel button click handled here
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        loadSearchData(searchText: "Latest")
        searchBar.resignFirstResponder()
    }
}


