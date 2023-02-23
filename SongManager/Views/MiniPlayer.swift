//
//  MiniPlayer.swift
//  SongManager
//
//  Created by Patrick Alves on 20.02.23.
//

import SwiftUI

/// Miniplayer for current song
struct MiniPlayer: View {
    @State private var artistName = "Paddi Maddi"
    @State private var songTitle = "Moood"
    @State private var pauseButton = false
    @State private var heartFill = false
    var picHeight = UIScreen.main.bounds.height / 3
    @Binding var expand: Bool
    @State private var sliderAnimation: CGFloat = 0
    var body: some View {
        VStack {
            if expand {
                HStack {
                    Button {
                        print("line")
                    } label: {
                        Image(systemName: "line.horizontal.3")
                    }

                    Spacer()
                    Image(systemName: heartFill ? "heart.fill" : "heart")
                        .onTapGesture {
                            withAnimation(.easeOut(duration: 0.3)) {
                                heartFill.toggle()
                            }
                        }
                }
                .foregroundColor(Color("AppColor"))
                .font(.title)
                .padding(.horizontal)
                .padding(.bottom)
                Spacer()
            }
            HStack(spacing: 10) {
                if expand{Spacer()}
                
                Image("p2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: expand ? picHeight : 55, height: expand ? picHeight : 55)
                    .clipShape(expand ? RoundedRectangle(cornerRadius: 12) : RoundedRectangle(cornerRadius: 30))
                
                if !expand {
                    VStack(alignment: .leading) {
                        Text(artistName)
                            .font(.title2)
                        Text(songTitle)
                            .font(.callout)
                    }
                }
                
                Spacer()
                
                if !expand {
                    Button(action: {}) {
                        Image(systemName: "arrow.left.to.line")
                            .font(.title)
                            .foregroundColor(Color("AppColor"))
                    }
                    
                    Button {
                        pauseButton.toggle()
                    } label: {
                        Image(systemName: pauseButton ? "pause.fill" : "play.fill")
                            .font(.title)
                            .foregroundColor(Color("AppColor"))
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "arrow.right.to.line")
                            .font(.title)
                            .foregroundColor(Color("AppColor"))
                    }
                }
            }
            .padding(.horizontal, 10)
            
            if expand {
                VStack {
                    Text(artistName)
                        .font(.title)
                    
                    Text(songTitle)
                        .font(.title3)
                        .padding(.bottom, 50)
                    
                    ZStack {
                        Capsule()
                            .fill(.primary.opacity(0.1))
                            .frame(maxWidth: .infinity, maxHeight: 4)
                        
                        Circle()
                            .frame(width: 10, height: 10)
                            .gesture(DragGesture())
                            .foregroundColor(Color("AppColor"))
                    }
                    
                    HStack(spacing: 15) {
                        Button(action: {}) {
                            Image(systemName: "arrow.left.to.line")
                                .font(.title)
                                .foregroundColor(Color("AppColor"))
                        }
                        
                        Button {
                            pauseButton.toggle()
                        } label: {
                            Image(systemName: pauseButton ? "pause.fill" : "play.fill")
                                .font(.title)
                                .foregroundColor(Color("AppColor"))
                        }
                        
                        Button(action: {}) {
                            Image(systemName: "arrow.right.to.line")
                                .font(.title)
                                .foregroundColor(Color("AppColor"))
                        }
                    }
                    .padding(30)
                    
                    HStack {
                        Image(systemName: "volume.2.fill")
                            .foregroundColor(Color("AppColor"))
                        
                        Slider(value: $sliderAnimation)
                            .tint(Color("AppColor"))
                            
                    }
                    .padding(.top, 40)
                    
                    Button {
                        print("stop")
                    } label: {
                        Image(systemName: "stop.fill")
                            .padding(.top, 40)
                            .font(.title)
                            .foregroundColor(Color("AppColor"))
                    }

                }
                .padding(.horizontal)
                .padding(.top)
                
                Spacer()
                Spacer()
            }
        }
        .frame(maxHeight: expand ? .infinity : 80)
        .background(
            VStack(spacing: 0) {
                BlurView()
                
                Divider()
            }
                .onTapGesture {
                    withAnimation(.interactiveSpring(response: 0.5)) {
                        expand.toggle()
                    }
                }
                .ignoresSafeArea())
    }
}

struct MiniPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MiniPlayer(expand: .constant(true))
    }
}
