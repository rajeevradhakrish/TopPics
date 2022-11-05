//
//  GalleryVM.swift
//  TopPics
//
//  Created by Rajeev Radhakrishnan on 05/11/22.
//

import Foundation
import UIKit

class GalleryVM
{
    //MARK: Array to store the required dayta for the cell
    
    var imgurArr = [ImgurCellModel]()
    
    //MARK:Fetching ImgUr images
    
    func fetchAPI(VC:UIViewController,searchStr:String, completion:@escaping ()->())
    {
        NetworkCall(data: [:], headers: [:], url: server.url.imgurUrl + searchStr , service: .posts, method: .get, isJSONRequest: false).executeQuery(){[weak self]
            (result: Result<ImgurResponse,Error>) in
            //ActivityIndicator.shared.removeLoader()
            guard let  sSelf = self else {return}
            switch result{
            case .success(let response):
                if let imgUrDataTemp = response.data
                {
                    sSelf.imgurArr = imgUrDataTemp.map({ImgurCellModel(id: $0.id, title: $0.title, datetime: $0.datetime, imagesCount: $0.imagesCount, imageUrl: $0.images?.first?.gifv ?? "")})
                }
                
                completion()
                
            case .failure(let error):
                print(error)
            }
        } failure: {
            AlertManager.shared.showAlertError(forMessage: "Something went wrong", desc: "")
        }
    }
    
    
}
