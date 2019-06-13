//
//  HenriPotierSwiftTests.swift
//  HenriPotierSwiftTests
//
//  Created by Sandy on 2019-06-10.
//  Copyright © 2019 Sandy. All rights reserved.
//

import XCTest
@testable import HenriPotierSwift

class HenriPotierSwiftTests: XCTestCase {
    var offer: Offer?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    func testSliceOperation() {
        offer = Offer(type: "slice", sliceValue: 100, value: 12, discountValue: 0)
        offer = offer?.calculate(with: 100, type: .slice)
        guard let discount = offer?.discountValue else { return }
        print(discount)
        XCTAssertTrue((discount == 88), "discount value should be \(String(describing: offer?.value)) for every \(String(describing: offer?.sliceValue))")
    }
    
    func testPercentageOperation() {
        offer = Offer(type: "percentage", sliceValue: 0, value: 5, discountValue: 0)
        offer = offer?.calculate(with: 100, type: .percentage)
        guard let discount = offer?.discountValue else { return }
        print(discount)
        XCTAssertTrue((discount == 95), "discounted value should be \(100 - ((100 * 5) / 100))")
    }
    
    func testPercentageOperationFail() {
        offer = Offer(type: "percentage", sliceValue: 0, value: 5, discountValue: 0)
        offer = offer?.calculate(with: 100, type: .percentage)
        guard let discount = offer?.discountValue else { return }
        print(discount)
        XCTAssertTrue((discount != 97), "discounted value should be \(100 - ((100 * 5) / 100))")
    }
}
