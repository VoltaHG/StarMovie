//
//  MovieOnline.swift
//  StarMovie
//
//  Created by Dmytro on 23.09.2022.
//

import Foundation
import UIKit


struct Movie: Decodable {
    var id : String
    var name : String?
    var raiting : String?
    var imgPath : String?
    var type : String?
    var duration : String?
}
