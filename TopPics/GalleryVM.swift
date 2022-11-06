//
//  GalleryVM.swift
//  TopPics
//
//  Created by Rajeev Radhakrishnan on 05/11/22.
//

import Foundation
import UIKit

// Enum to manage type of cell

enum CellType {
case list,grid
}
//MARK: View model for gallery page(GalleryVC)

class GalleryVM
{
    
    //MARK: Array to store the required dayta for the cell
    
    var imgurArr = [ImgurCellModel]()
    
    //MARK:Fetching ImgUr images
    
    func fetchAPI(VC:UIViewController,searchStr:String, completion:@escaping ()->())
    {
        let authorization = ["Authorization":server.profile.authorization]
        NetworkCall(data: [:], headers: authorization, url: server.url.imgurUrl + searchStr , service: .posts, method: .get, isJSONRequest: false).executeQuery(){[weak self]
            (result: Result<ImgurResponse,Error>) in
            //ActivityIndicator.shared.removeLoader()
            guard let  sSelf = self else {return}
            switch result{
            case .success(let response):
                
                //Getting the data fetched from IMGur and converting to ImgurCellModel
                //Sorting the arra in reverse chronological order
                
                if let imgUrDataTemp = response.data
                {
                    sSelf.imgurArr = imgUrDataTemp.map({ImgurCellModel(id: $0.id, title: $0.title, datetime: $0.datetime, imagesCount: $0.imagesCount, imageUrl: $0.images?.first?.link ?? "")}).sorted(by: {Date(milliseconds: $0.datetime ?? 0) > Date(milliseconds: $1.datetime ?? 0)})
                }
                
                completion()
                
            case .failure(let error):
                print(error)
            }
        } failure: {
            AlertManager.shared.showAlertError(forMessage: "Something went wrong", desc: "")
        }
    }
    
    
   //MARK: Get required cell for grid/List
    
    func getImgUrCell(collection:UICollectionView, index:IndexPath,type:CellType)->UICollectionViewCell
    {
        if type == .grid,let cell = collection.dequeueReusableCell(withReuseIdentifier: ImgUrGridCell.cellIdentifier, for: index) as? ImgUrGridCell
        {
            cell.setUPCell(item: imgurArr[index.row])
            return cell
        }
        else if type == .list,let cell = collection.dequeueReusableCell(withReuseIdentifier: ImgUrListCell.cellIdentifier, for: index) as? ImgUrListCell
        {
            cell.setUPCell(item: imgurArr[index.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
}
