//
//  PreviewViewModelTests.swift
//  PiPPlayerTests
//
//  Created by Muhammad Irfan on 11/02/2024.
//

import XCTest
@testable import PiPPlayer
import AVFoundation

final class PreviewViewModelTests: XCTestCase {

  var viewModel: PreviewViewModel!
  var mockPlayer: MockVideoPlayable!
  var mockURLProvider: MockVideoURLProvider!

  override func setUpWithError() throws {
    mockPlayer = MockVideoPlayable()
    mockURLProvider = MockVideoURLProvider()
    viewModel = PreviewViewModel(player: mockPlayer, urlProvider: mockURLProvider)
  }

  override func tearDownWithError() throws {
    viewModel = nil
    mockPlayer = nil
    mockURLProvider = nil
  }

  func testLoadVideoWithValidURL() {
    // Given
    let dummyURL = URL(string: "https://example.com/video.mp4")!
    mockURLProvider.stubbedGetVideoURLResult = dummyURL

    // When
    viewModel.loadVideo()

    // Then
    XCTAssertEqual(mockPlayer.avPlayer.currentItem?.asset as? AVURLAsset, AVURLAsset(url: dummyURL))
  }

  func testLoadVideoWithInvalidURL() {
    // Given
    mockURLProvider.stubbedGetVideoURLResult = nil

    // When
    viewModel.loadVideo()

    // Then
    XCTAssertTrue(viewModel.isErrorPresented)
  }

  func testHandlePlayActionWithPlayableURL() {
    // Given
    mockURLProvider.stubbedIsURLPlayableResult = true

    // When
    viewModel.handlePlayAction()

    // Then
    XCTAssertEqual(viewModel.videoPreviewState, .visible)
  }

  func testHandlePlayActionWithUnplayableURL() {
    // Given
    mockURLProvider.stubbedIsURLPlayableResult = false

    // When
    viewModel.handlePlayAction()

    // Then
    XCTAssertTrue(viewModel.isErrorPresented)
  }

  func testShowHideVideoPlayer() {
    // Given
    viewModel.pipState = .visible

    // When
    let alpha = viewModel.showHideVideoPlayer()

    // Then
    XCTAssertEqual(alpha, 0)
  }

}

// Mock classes for dependencies
class MockVideoPlayable: VideoPlayable {
    var avPlayer: AVPlayer = AVPlayer()
}

class MockVideoURLProvider: VideoURLProvider {
    var stubbedGetVideoURLResult: URL?
    var stubbedIsURLPlayableResult: Bool = false

    func getVideoURL() -> URL? {
        return stubbedGetVideoURLResult
    }

    func isURLPlayable() -> Bool {
        return stubbedIsURLPlayableResult
    }
}
