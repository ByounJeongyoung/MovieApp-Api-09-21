//
//  MovieModel.swift
//  MovieApp
//
//  Created by Young on 2021/09/12.
//

import Foundation

struct MovieModel : Codable {
    let resultCount : Int?
    let results : [Result]
}

struct Result : Codable {
    let trackName : String?
    let previewUrl : String?
    let image : String? //나중에 바꿀값
    let shortDescription :String?
    let longDescription : String
    var currency: String
    var trackPrice : Double
    //계산속성은 내가 설정한 값이다,
    //CodingKeys에서 받지 않아도 된다. 받지 않는다
    var totalPrice: String {
        let price = "\(currency)\(trackPrice)"
        return price
    }
    
    enum CodingKeys: String, CodingKey {
        case trackName,previewUrl,shortDescription,longDescription,currency,trackPrice
        case image = "artworkUrl100"
        // 내가 받고 싶은 값을 치환할수 있다. 즉 API에 나와았는 값을 image로 일종의 치환한 것이다.
    }
}
