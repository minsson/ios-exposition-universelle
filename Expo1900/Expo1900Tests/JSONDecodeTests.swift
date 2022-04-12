//
//  JSONDecodeTests.swift
//  JSONDecodeTests
//
//  Created by Lingo on 2022/04/11.
//

import XCTest
@testable import Expo1900

final class JSONDecodeTests: XCTestCase {
  
  private var decoder: JSONDecoder?
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    self.decoder = JSONDecoder()
  }
  
  override func tearDownWithError() throws {
    try super.tearDownWithError()
    self.decoder = nil
  }
  
  func testDecode_WhenExpoDataProvided_ShouldNotThrowError() {
    // given when then
    guard let asset = NSDataAsset(name: "exposition_universelle_1900", bundle: .main) else {
      XCTFail("Expo Decode Failure")
      return
    }
    XCTAssertNoThrow(try decoder?.decode(Expo.self, from: asset.data))
  }
  
  func testDecode_WhenExpoDataProvided_ShouldReturnExpoTitle() {
    // given when then
    guard let asset = NSDataAsset(name: "exposition_universelle_1900", bundle: .main),
          let expo = try? decoder?.decode(Expo.self, from: asset.data)
    else {
      XCTFail("Expo Decode Failure")
      return
    }
    XCTAssertEqual(expo.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
  }
  
  func testDecode_WhenExpoItemDataProvided_ShouldNotThrowError() {
    // given when then
    guard let asset = NSDataAsset(name: "items", bundle: .main) else {
      XCTFail("ExpoItems Decode Failure")
      return
    }
    XCTAssertNoThrow(try decoder?.decode([ExpoItem].self, from: asset.data))
  }
  
  func testDecode_WhenExpoDataProvided_ShouldReturnExpoItemsName() {
    // given when then
    guard let asset = NSDataAsset(name: "items", bundle: .main),
          let expoItems = try? decoder?.decode([ExpoItem].self, from: asset.data)
    else {
      XCTFail("ExpoItems Decode Failure")
      return
    }
    XCTAssertEqual(expoItems[0].name, "직지심체요절")
  }
}
