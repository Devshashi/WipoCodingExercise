//
//  DisplaytableViewCell_Test.swift
//  WipoCodingExerciseTests
//
//  Created by Devshashi on 03/07/20.
//  Copyright © 2020 Devshashi. All rights reserved.
//

import XCTest
@testable import WipoCodingExercise

class DisplaytableViewCell_Test: XCTestCase {
    
    
    private var displayDataCell : DisplayDataCell!
    
    override func setUp() {
        super.setUp()
        self.displayDataCell = DisplayDataCell()
        
    }
    
    
    func test_configureWith(){
        let data = DataModel(title: "Title", description: "Description", imageHref: "URL")
        let dataVM = DataViewModel(data)
        XCTAssertNotNil(self.displayDataCell.configure(with: dataVM))
    }
    
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    
}
