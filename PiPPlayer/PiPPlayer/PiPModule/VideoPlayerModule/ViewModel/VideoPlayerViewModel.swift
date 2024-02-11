//
//  VideoPlayerViewModel.swift
//  PiPPlayer
//
//  Created by Muhammad Irfan on 10/02/2024.
//

import SwiftUI
import AVKit

protocol VideoPlayable {
  var  avPlayer: AVPlayer { get }
  func play()
  func pause()
}

extension VideoPlayable {

  func play() {
    if #available(iOS 10.0, *) {
      avPlayer.playImmediately(atRate: 1.0)
    } else {
      avPlayer.play()
    }
  }

  func pause() {
    avPlayer.pause()
  }
}

struct VideoPlayerViewModel: VideoPlayable {
  var avPlayer: AVPlayer
}
