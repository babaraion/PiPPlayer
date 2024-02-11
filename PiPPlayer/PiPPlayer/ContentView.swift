//
//  ContentView.swift
//  PiPPlayer
//
//  Created by Muhammad Irfan on 10/02/2024.
//

import SwiftUI
import AVFAudio
import AVFoundation

struct ContentView: View {

  var body: some View {
      let viewModel = PreviewViewModel()
      PreviewPageView(viewModel: viewModel).onAppear {
      setAudioSession()
    }
  }

  func setAudioSession(){
    let session = AVAudioSession.sharedInstance()

    do {
      try session.setCategory(.playback, mode: .moviePlayback)
    } catch let err {
      print(err.localizedDescription)
    }
  }
}

#Preview {
    ContentView()
}
