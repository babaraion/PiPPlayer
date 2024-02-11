//
//  AVVideoPlayer.swift
//  PiPPlayer
//
//  Created by Muhammad Irfan on 10/02/2024.
//

import UIKit
import AVKit
import SwiftUI

struct VideoPlayerController: UIViewControllerRepresentable {

  @ObservedObject var viewModel: PreviewViewModel

  var controller = CustomAVPlayerViewController()

  var delegate: CustomAVPlayerViewControllerDelegate?

  lazy var activityIndicator : UIActivityIndicatorView = {
    let indicator = UIActivityIndicatorView(style: .large)
    indicator.color = .white
    return indicator
  }()

  func makeUIViewController(context: Context) -> AVPlayerViewController {
    controller.player = viewModel.player.avPlayer
    controller.customDelegate = context.coordinator
    controller.delegate = context.coordinator
    controller.allowsPictureInPicturePlayback = true
    controller.canStartPictureInPictureAutomaticallyFromInline = true
    controller.modalPresentationStyle = .fullScreen
    
    // Observe player's buffering status
    viewModel.player.avPlayer.addObserver(context.coordinator, forKeyPath: #keyPath(AVPlayer.timeControlStatus), options: [.old, .new], context: nil)
    return controller
  }

  func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) { }

  func makeCoordinator()-> VideoPlayerCoordinator {
    return VideoPlayerCoordinator(self)
  }
}
