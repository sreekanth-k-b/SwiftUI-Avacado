//
//  ContentView.swift
//  AvacadoSampleApp
//
//  Created by Sreekanth on 18/08/23.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    func placeholderModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 160)
            .foregroundColor(.purple)
            .opacity(0.5)
        
    }
}

struct ContentView: View {
   private  var imageUrl: String = "https://credo.academy/credo-academy@3x.png"
    var body: some View {
      // MARK: basics
        VStack {
//            AsyncImage(url: URL(string: imageUrl)) { image in
//                image.imageModifier()
//
//            } placeholder: {
//                Image(systemName: "photo.circle.fill").placeholderModifier()
//
//            }
              // MARK: phase
//            AsyncImage(url: URL(string: imageUrl)) { phase in
//                if let image = phase.image {
//                    image.imageModifier()
//                } else if phase.error != nil {
//                    Image(systemName: "ant.circle.fill").placeholderModifier()
//                } else {
//                    Image(systemName: "photo.circle.fill").placeholderModifier()
//                }
//            }
  // MARK: animation
            AsyncImage(url: URL(string: imageUrl),transaction: Transaction(animation: .spring(response: 0.4,dampingFraction: 0.6,blendDuration: 0.25))) { phase in
                switch phase {
                case .success(let image):
                    image.imageModifier()
                        .transition(.scale)
                case .failure(_):
                    Image(systemName: "ant.circle.fill")
                        .placeholderModifier()
                case .empty:
                    Image(systemName: "photo.circle.fill")
                        .placeholderModifier()
               default:
                    Image(systemName: "photo.circle.fill")
                        .placeholderModifier()
                }
            }

        }
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
