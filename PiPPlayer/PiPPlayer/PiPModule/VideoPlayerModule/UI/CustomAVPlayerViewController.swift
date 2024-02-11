//
//  CustomAVPlayerViewController.swift
//  PiPPlayer
//
//  Created by Muhammad Irfan on 11/02/2024.
//

import UIKit
import AVKit

protocol CustomAVPlayerViewControllerDelegate {
    func playerViewControllerDidDismiss()
}

class CustomAVPlayerViewController: AVPlayerViewController {
    var customDelegate: CustomAVPlayerViewControllerDelegate?

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        customDelegate?.playerViewControllerDidDismiss()
    }
}
