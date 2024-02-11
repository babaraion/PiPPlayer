//
//  PreviewViewModel.swift
//  PiPPlayer
//
//  Created by Muhammad Irfan on 10/02/2024.
//

import Foundation
import SwiftUI
import Combine
import AVKit

class PreviewViewModel: ObservableObject {

  @Published var errorMessage: String = TextMessage.errorMessage.rawValue
  @Published var isErrorPresented = false
  @Published var videoPreviewState: VideoPreviewState = .hidden
  @Published var pipState: PiPState = .hidden

  let player: VideoPlayable
  private let urlProvider: VideoURLProvider

  init(player: VideoPlayable = VideoPlayerViewModel(avPlayer: AVPlayer()), urlProvider: VideoURLProvider = DefaultVideoURLProvider()) {
    self.player = player
    self.urlProvider = urlProvider
  }

  func loadVideo() {
    if let url = urlProvider.getVideoURL() {
        player.avPlayer.replaceCurrentItem(with: AVPlayerItem(url: url))
    }else {
      isErrorPresented.toggle()
    }
  }

  func handlePlayAction() {
    if urlProvider.isURLPlayable() {
      videoPreviewState = .visible
    } else {
      isErrorPresented.toggle()
    }
  }

  func showHideVideoPlayer()-> Double {
    switch pipState {
    case .visible:
      return 0
    case .hidden:
      return 1
    case .none:
      return 1
    }
  }
}
