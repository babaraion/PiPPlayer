//
//  VideoPlayerCoordinator.swift
//  PiPPlayer
//
//  Created by Muhammad Irfan on 10/02/2024.
//
import AVKit

class VideoPlayerCoordinator: NSObject {

  private var parent: VideoPlayerController

  init(_ parent: VideoPlayerController) {
    self.parent = parent
  }
}

extension VideoPlayerCoordinator {

  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    guard let player = object as? AVPlayer,
          keyPath == #keyPath(AVPlayer.timeControlStatus) else { return }

    if player.timeControlStatus == .playing {
      // hide activity indicator when playing
      parent.activityIndicator.stopAnimating()
      parent.activityIndicator.isHidden = true
    } else if player.timeControlStatus == .paused {
      // show activity indicator when paused (i.e., buffering)
      parent.activityIndicator.isHidden = false
      parent.activityIndicator.startAnimating()
    }else {
      // Add activity inidicator just before video starts buffering
      parent.controller.view.addSubview(parent.activityIndicator)
      parent.activityIndicator.center = parent.controller.view.center
      parent.activityIndicator.startAnimating()
    }
  }
}

extension VideoPlayerCoordinator: AVPlayerViewControllerDelegate {

  func playerViewControllerDidStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
    parent.viewModel.pipState = .visible
  }

  func playerViewControllerDidStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
    parent.viewModel.pipState = .hidden
  }
}

extension VideoPlayerCoordinator: CustomAVPlayerViewControllerDelegate {
  func playerViewControllerDidDismiss() {
    parent.delegate?.playerViewControllerDidDismiss()
  }
}
