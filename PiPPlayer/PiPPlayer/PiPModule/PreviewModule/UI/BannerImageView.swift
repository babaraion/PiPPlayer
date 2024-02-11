//
//  BannerImageView.swift
//  PiPPlayer
//
//  Created by Muhammad Irfan on 10/02/2024.
//

import Foundation
import SwiftUI
struct BannerImageView: View {
    var body: some View {        
        Image("banner")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(20)
            .frame(maxWidth: .infinity)
    }
    
}

#Preview {
  BannerImageView()
}
