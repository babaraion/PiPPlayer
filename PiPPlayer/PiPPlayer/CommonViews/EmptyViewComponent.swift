//
//  EmptyViewComponent.swift
//  PiPPlayer
//
//  Created by Muhammad Irfan on 11/02/2024.
//

import SwiftUI

struct EmptyViewComponent: View {
    let message: String
    var body: some View {
      ZStack {
        Color.white.edgesIgnoringSafeArea(.all)
        VStack {
          Spacer()
          Image(systemName: "exclamationmark.triangle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
            .foregroundColor(.red)

          Text(message)
            .foregroundColor(.gray)
            .font(.title)
            .padding()
          Spacer()
        }
      }
    }
}

#Preview {
    EmptyViewComponent(message: "Something went wrong")
}
