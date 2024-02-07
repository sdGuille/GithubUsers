//
//  GithubUsersTests.swift
//  GithubUsersTests
//
//  Created by Guillermo Ruiz Baires on 7/2/24.
//

import XCTest
@testable import GithubUsers


final class GithubUsersTests: XCTestCase {
    
    func testSuccessfulTipCalculation() {
        // Given (Arrange)
        let enteredAmount = 100.00
        let tipSlider = 10.00
        let calculation = Calculation()
        
        // When (Act)
        let tip = calculation.calculateTip(of: enteredAmount, with: tipSlider)
        
        // Then (Assert)
        XCTAssertEqual(tip, 25)
        
    }

}
