//
//  PlayButtonView.swift
//  PiPPlayer
//
//  Created by Muhammad Irfan on 10/02/2024.
//

import Foundation
import SwiftUI

struct PlayButtonView: View {
    let livePreviewAction: () -> Void

    var body: some View {
        Button(action: {
          livePreviewAction()
        }) {
          Text("Live Preview")
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
        }
        .background(Color.red)
        .cornerRadius(10)
        .padding()
    }
}
