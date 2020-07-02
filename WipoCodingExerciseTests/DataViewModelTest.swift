//
//  DataViewModelTest.swift
//  WipoCodingExerciseTests
//
//  Created by Devshashi on 03/07/20.
//  Copyright © 2020 Devshashi. All rights reserved.
//

import XCTest
@testable import WipoCodingExercise

class DataViewModelTest: XCTestCase {
    
    
    private var dataListViewModel : DataListViewModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        
        let dataArray = [DataModel(title: "Title0", description: "Description0", imageHref: "URL0"),DataModel(title: "Title1", description: "Description1", imageHref: "URL1"),DataModel(title: "Title2", description: "Description2", imageHref: "URL2"),DataModel(title: "Title3", description: "Description3", imageHref: "URL3")]
        
        self.dataListViewModel = DataListViewModel(row: dataArray)
        
    }
    
    
    
    func test_number_Of_Section(){
        
        XCTAssertEqual(1, self.dataListViewModel.numbrOfSection)
        
    }
    
    func test_number_Of_Rowsin_Section(){
        
        XCTAssertEqual(self.dataListViewModel.row.count, self.dataListViewModel.numberOfRowsinSection(self.dataListViewModel.numbrOfSection))
        
    }
    
    
    func test_dataAtIndex(){
        
        for (index,vm) in self.dataListViewModel.row.enumerated(){
            XCTAssertEqual(vm.description,self.dataListViewModel.dataAtIndex(index).description)
            XCTAssertEqual(vm.title,self.dataListViewModel.dataAtIndex(index).title)
            XCTAssertEqual(vm.imageHref,self.dataListViewModel.dataAtIndex(index).imageHref)
        }
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}
