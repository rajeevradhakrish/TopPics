//
//  ImageModel.swift
//  TopPics
//
//  Created by Rajeev Radhakrishnan on 05/11/22.
//

import Foundation

// MARK: ImgurResponse to handle the response from UMGUR

struct ImgurResponse: Codable {
    let data: [ImgurModel]?
    let success: Bool?
    let status: Int?
}

// MARK: - Image model to hold all the image related data
struct ImgurModel: Codable {
    let id, title: String?
    let datumDescription: String?
    let datetime: Int?
    let cover: String?
    let coverWidth, coverHeight: Int?
    let accountURL: String?
    let accountID: Int?
    let privacy: String?
    let layout: String?
    let views: Int?
    let link: String?
    let ups, downs, points, score: Int?
    let isAlbum: Bool?
    let vote: String?
    let favorite, nsfw: Bool?
    let section: String?
    let commentCount, favoriteCount: Int?
    let topic: String?
    let topicID: Int?
    let imagesCount: Int?
    let inGallery, isAd: Bool?
    let tags: [Tag]?
    let adType: Int?
    let adURL: String?
    let inMostViral, includeAlbumAds: Bool?
    let images: [Image]?
    let type: String?
    let animated: Bool?
    let width, height, size, bandwidth: Int?
    let hasSound: Bool?
    let edited, mp4Size: Int?
    let mp4: String?
    let gifv: String?
    let hls: String?
    let processing: Processing?

    enum CodingKeys: String, CodingKey {
        case id, title
        case datumDescription = "description"
        case datetime, cover
        case coverWidth = "cover_width"
        case coverHeight = "cover_height"
        case accountURL = "account_url"
        case accountID = "account_id"
        case privacy, layout, views, link, ups, downs, points, score
        case isAlbum = "is_album"
        case vote, favorite, nsfw, section
        case commentCount = "comment_count"
        case favoriteCount = "favorite_count"
        case topic
        case topicID = "topic_id"
        case imagesCount = "images_count"
        case inGallery = "in_gallery"
        case isAd = "is_ad"
        case tags
        case adType = "ad_type"
        case adURL = "ad_url"
        case inMostViral = "in_most_viral"
        case includeAlbumAds = "include_album_ads"
        case images
        case type, animated, width, height, size, bandwidth
        case hasSound = "has_sound"
        case edited
        case mp4Size = "mp4_size"
        case mp4, gifv, hls, processing
    }
}


enum SafeFlag: String, Codable {
    case album = "album"
    case gallery = "gallery"
    case inGallery = "in_gallery"
    case pageLoad = "page_load"
    case sixthModSafe = "sixth_mod_safe"
}

// MARK: - Image
struct Image: Codable {
    let id: String?
    let title: String?
    let imageDescription: String?
    let datetime: Int?
    let type: String?
    let animated: Bool?
    let width, height, size, views: Int?
    let bandwidth: Int?
    let vote: String?
    let favorite: Bool?
    let nsfw, section, accountURL, accountID: String?
    let isAd, inMostViral, hasSound: Bool?
    let adType: Int?
    let adURL, edited: String?
    let inGallery: Bool?
    let link: String?
    let mp4Size: Int?
    let mp4: String?
    let gifv: String?
    let hls: String?
    let processing: Processing?
    let commentCount, favoriteCount, ups, downs: String?
    let points, score: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case imageDescription = "description"
        case datetime, type, animated, width, height, size, views, bandwidth, vote, favorite, nsfw, section
        case accountURL = "account_url"
        case accountID = "account_id"
        case isAd = "is_ad"
        case inMostViral = "in_most_viral"
        case hasSound = "has_sound"
        case adType = "ad_type"
        case adURL = "ad_url"
        case edited
        case inGallery = "in_gallery"
        case link
        case mp4Size = "mp4_size"
        case mp4, gifv, hls, processing
        case commentCount = "comment_count"
        case favoriteCount = "favorite_count"
        case ups, downs, points, score
    }
}

// MARK: - Processing
struct Processing: Codable {
    let status: String?
}



// MARK: - Tag
struct Tag: Codable {
    let name, displayName: String?
    let followers, totalItems: Int?
    let following, isWhitelisted: Bool?
    let backgroundHash: String?
    let thumbnailHash, accent: String?
    let backgroundIsAnimated, thumbnailIsAnimated, isPromoted: Bool?
    let tagDescription: String?
    let logoHash, logoDestinationURL: String?
    let descriptionAnnotations: DescriptionAnnotations?

    enum CodingKeys: String, CodingKey {
        case name
        case displayName = "display_name"
        case followers
        case totalItems = "total_items"
        case following
        case isWhitelisted = "is_whitelisted"
        case backgroundHash = "background_hash"
        case thumbnailHash = "thumbnail_hash"
        case accent
        case backgroundIsAnimated = "background_is_animated"
        case thumbnailIsAnimated = "thumbnail_is_animated"
        case isPromoted = "is_promoted"
        case tagDescription = "description"
        case logoHash = "logo_hash"
        case logoDestinationURL = "logo_destination_url"
        case descriptionAnnotations = "description_annotations"
    }
}

// MARK: - DescriptionAnnotations
struct DescriptionAnnotations: Codable {
}

enum Description: String, Codable {
    case allThingsAnimal = "all things animal"
    case combatAndAdventure = "combat and adventure"
    case creativeCreations = "creative creations"
    case cuteAndAdorable = "cute and adorable"
    case empty = ""
    case felineFriends = "feline friends"
    case happyLoveYourPetsDay = "Happy Love Your Pets Day!"
    case internationalNinjaDayDEC5Th = "International Ninja Day Dec. 5th!"
    case loLsROFLsLMAOS = "LOLs, ROFLs, LMAOs"
    case neatAndAmazing = "neat and amazing"
    case ourFelineFriends = "Our feline friends"
    case theFreshestMemes = "the freshest memes"
    case videosWithSound = "videos with sound"
}


//MARK: ImgurCellModel to handle only required data for Cell

struct ImgurCellModel
{
    let id, title: String?
    let datetime: Int?
    let imagesCount: Int?
    let imageUrl: String?
}

