//
//  ListDataModel.swift
//  WipoCodingExercise
//
//  Created by Devshashi on 03/07/20.
//  Copyright © 2020 Devshashi. All rights reserved.
//

import Foundation
import UIKit



struct ListDataModel:Decodable {
    
    let title: String
    let rows: [DataModel]!
    
}


struct DataModel:Decodable {
    
    let title:String?
    let description:String?
    let imageHref:String?
    
}

