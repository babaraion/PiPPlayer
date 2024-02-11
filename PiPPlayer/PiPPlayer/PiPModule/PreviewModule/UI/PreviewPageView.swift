//
//  PreviewPageView.swift
//  PiPPlayer
//
//  Created by Muhammad Irfan on 10/02/2024.
//

import Foundation
import SwiftUI
import AVKit

struct PreviewPageView: View {
  @StateObject var viewModel: PreviewViewModel

  var body: some View {
    GeometryReader { geometry in
      ZStack {
        VStack {
          BannerImageView()
          PlayButtonView(livePreviewAction: {
              viewModel.handlePlayAction()
          })
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        //show video player if preview button is tapped
        if viewModel.videoPreviewState == .visible {
          VideoPlayerController(viewModel: viewModel, delegate: self)
            .opacity(viewModel.showHideVideoPlayer())
            .onAppear {
              viewModel.player.play()
            }
        }
      }.onAppear {
          viewModel.loadVideo()
      }
      .background(Color.white)
      .ignoresSafeArea()
      .sheet(isPresented: $viewModel.isErrorPresented, content: {
        EmptyViewComponent(message: viewModel.errorMessage)
      })
    }
  }
}

extension PreviewPageView: CustomAVPlayerViewControllerDelegate {
    func playerViewControllerDidDismiss() {
       viewModel.videoPreviewState = .hidden
    }
}
