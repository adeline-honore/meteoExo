//
//  MeteoTestsCase.swift
//  MeteoTests
//
//  Created by HONORE Adeline on 19/12/2022.
//

import XCTest
@testable import Meteo

class MeteoTestsCase: XCTestCase {

    // Given
    private var weather: WeatherService!
    private let cityID = 2983990
    
    private func initSUT(isFailed: Bool = false) {
        weather = WeatherService(network: NetworkFake(testCase: .meteo, isFailed: isFailed))
    }
    
    override func tearDown() {
        super.setUp()
        weather = nil
    }
    
    func testWeatherShouldPostSuccess() {
        // Given
        initSUT()
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        // Then
        weather.getData(city: cityID) { result in
            switch result {
            case .success(_):
                expectation.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testWeatherShouldPostSuccessOnDataName() {
        // Given
        let nameReceived = "Rennes"
        initSUT()
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        // Then
        weather.getData(city: cityID) { result in
            switch result {
            case .success(_):
                XCTAssertEqual(try? result.get().name, nameReceived)
                expectation.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testWeatherShouldPostSuccessOnDataTemperatureValue() {
        // Given
        let temperatureReceived = 278.1
        initSUT()
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        // Then
        weather.getData(city: cityID) { result in
            switch result {
            case .success(_):
                XCTAssertEqual(try? result.get().main.temp, temperatureReceived)
                expectation.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testWeatherShouldPostSuccessOnDataDescriptionValue() {
        // Given
        let descriptionReceived = "light intensity drizzle"
        initSUT()
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        // Then
        weather.getData(city: cityID) { result in
            switch result {
            case .success(_):
                XCTAssertEqual(try? result.get().weather.first?.description, descriptionReceived)
                expectation.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testWeatherShouldPostSuccessOnDataIcon() {
        // Given
        let iconReceived = "09d"
        initSUT()
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        // Then
        weather.getData(city: cityID) { result in
            switch result {
            case .success(_):
                XCTAssertEqual(try? result.get().weather.first?.icon, iconReceived)
                expectation.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testWeatherShouldReturnFailure() {
        // Given
        initSUT(isFailed: true)
        // When
        let expectation = XCTestExpectation(description: "Should return failure")
        // Then
        weather.getData(city: cityID) { result in
            switch result {
            case .success(_):
                XCTFail()
            case .failure(_):
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }
}
