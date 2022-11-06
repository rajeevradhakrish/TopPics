//
//  ValidateImgurData.swift
//  TopPicsTests
//
//  Created by Rajeev Radhakrishnan on 06/11/22.
//

import XCTest
@testable import TopPics

final class ValidateImgurData: XCTestCase {
    
    var testVM:GalleryVM!
    
    override func setUp() {
        super.setUp()
        testVM = GalleryVM()
        
    }
    
    override func tearDown() {
        super.tearDown()
        testVM = nil
    }
    
    // Function to test if there is any error thrown while fetching including errors in model
    
    func testDataFetchSuceed()
    {
        XCTAssertNoThrow(testVM.fetchAPI(VC: GalleryVC(), searchStr: "cat", completion: {
            XCTAssertTrue(!self.testVM.imgurArr.isEmpty)
        }))
        
        
    }
    
    
}
