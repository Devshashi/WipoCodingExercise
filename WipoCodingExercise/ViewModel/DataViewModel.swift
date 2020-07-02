//
//  DataViewModel.swift
//  WipoCodingExercise
//
//  Created by Devshashi on 03/07/20.
//  Copyright © 2020 Devshashi. All rights reserved.
//

import Foundation

struct DataListViewModel {
    
    let row :[DataModel]
    
}


//MARK: Datasource for Tableview

extension DataListViewModel{
    
    var numbrOfSection:Int{
        return 1
    }
    
    func numberOfRowsinSection(_ section:Int)->Int{
        return  self.row.count
    }
    
    func dataAtIndex(_ index:Int)->DataViewModel{
        
        let article = self.row[index]
        return DataViewModel(article)
    }
    
}


//MARK: This view model provide info to User intertface

struct DataViewModel {
    
    private let Data:DataModel
}

//MARK: Initialize Data View Model

extension DataViewModel{
    
    init(_ data:DataModel) {
        self.Data = data
    }
}



//MARK: Initialize Data View Model properties which are need to show in tableview

extension DataViewModel{
    
    var title:String{
        return self.Data.title ?? "No title Found"
    }
    
    var description:String{
        return self.Data.description ?? "No Description Found"
    }
    
    var imageHref:String{
        return self.Data.imageHref ?? ""
    }
    
}

