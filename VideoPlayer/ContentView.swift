//
//  ContentView.swift
//  VideoPlayer
//
//  Created by Cleo Larkin on 11/15/23.
//


import SwiftUI
import AVKit
struct ContentView: View {
    
    var player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "MrChinBday", ofType: "MOV")!))
    
    var body: some View {
        ZStack {
            // Video Player in the background
            GeometryReader { proxy in
                VideoPlayer(player: player)
                    .ignoresSafeArea()
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .onAppear() {
                        player.play()
                    }
            }.disabled(true)
            
            // Black bar at the bottom
            VStack {
                Spacer()
                ZStack {
                    HStack(spacing: 30){
                        Spacer().frame(width: 10)
                        Image(systemName: "backward.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.white)
                            .onTapGesture {
                                player.seek(to: CMTime.zero)
                            }
                        
                        Spacer().frame(width: 50)
                        Image(systemName: "play.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.white)
                            .onTapGesture {
                                player.play()
                            }
                        Image(systemName: "pause.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.white)
                            .onTapGesture {
                                player.pause()
                            }
                        Spacer()
                        
                    }
                }
            }
        }
    }
}
//}

// video player that work with url
//struct ContentView: View {
//    let url = URL(string: "IMG_0475.mp4")!
//
//    var body: some View {
//        NavigationStack {
//            VStack {
//                VideoPlayer(player: AVPlayer(url: url))
//            }
//        }
//    }
//}

#Preview {
    ContentView()
}



