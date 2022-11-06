//
//  Configuration.swift
//  TopPics
//
//  Created by Rajeev Radhakrishnan on 05/11/22.
//

import Foundation

struct server{
    struct url
    {
        //Url to fecth top images of week 
        static let imgurUrl = "https://api.imgur.com/3/gallery/search/top/week?q_type=jpg&q="
    }
    struct endPoints
    {
        static let search = ""
    }
    struct profile
    {
        static let authorization = "Client-ID bf1b699f719d022"
        static let clientID = "bf1b699f719d022"
        static let clientSecret = "643212d5ab7950bc44b48ebca47c9da84296d2c4"
    }
    
}

struct theme
{
    struct colors
    {
        static let themeMain = "377D9D"
    }
}
