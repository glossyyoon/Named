//
//  Constants.swift
//  GiveMeAName
//
//  Created by 박지윤 on 2021/05/25.
//

import Foundation
struct Constants{
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToStart" //static을 사용하면 struct를 새로 초기화해줄 필요 없이 갖다 쓸 수 있다.
}
struct N{
    static let reusableCell = "ProductCell"
    static let reusableCellWithImage = "ImageCellTableViewCell"
    static let nibName = "CellTableViewCell"
    static let imageCellNibName = "CellWithImage"
    static let registerSegue = "RegisterToStart"
    static let loginSegue = "LoginToStart"
    static let kakaoSegue = "KakaoToStart"
    
    struct BrandColors {
        static let blue = "BrandBlue"
        static let pink = "BrandPink"
        static let yellow = "BrandYellow"
    }
    
    struct FStore {
        static let collectionName = "item"
        static let titleField = "title"
        static let explanationField = "explanation"
        static let isItNamedField = "isItNamed"
        static let imageField = "image"
    }
}
