//
//  WipoCodingExerciseTests.swift
//  WipoCodingExerciseTests
//
//  Created by Devshashi on 03/07/20.
//  Copyright © 2020 Devshashi. All rights reserved.
//

import XCTest
@testable import WipoCodingExercise

class WipoCodingExerciseTests: XCTestCase {
    
    private var dataDisplayVC : DisplayDataViewController!
    
    override func setUp() {
        super.setUp()
        self.dataDisplayVC = DisplayDataViewController()
        let connectivity =  Reachability.shared.isConnectedToNetwork()
        XCTAssertEqual(connectivity, true)
    }
    
    func test_call_GetApi(){
        XCTAssertNotNil(self.dataDisplayVC.callGetApi())
        
    }
    

    func test_initialSetup(){
        XCTAssertNotNil(self.dataDisplayVC.initialSetup())
    }
    
    
    override func tearDown() {
        super.tearDown()
    }
    
    
}
