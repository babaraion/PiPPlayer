//
//  VideoPlayerModel.swift
//  PiPPlayer
//
//  Created by Muhammad Irfan on 11/02/2024.
//

import Foundation
import AVKit

enum PiPState {
    case visible
    case hidden
    case none
}

protocol VideoURLProvider {
    func getVideoURL() -> URL?
    func isURLPlayable()-> Bool
}

struct DefaultVideoURLProvider: VideoURLProvider {
  
  private let videoURL = "https://t.ly/9EIy-"

  func isURLPlayable()-> Bool {
    if let url = URL(string: videoURL) {
      let assets = AVAsset(url: url)
      let length = Float(assets.duration.value)/Float(assets.duration.timescale)
      if length != 0.0  {
        return true
      }
    }
    return false
  }

  func getVideoURL() -> URL? {
    return URL(string: videoURL)
  }
}
