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
    @Binding var closeMiniPlayer: Bool
    @Binding var recognizing: Bool
    @State private var volume: CGFloat = 0
    @State private var offset : CGFloat = 0
    @State private var circleOffset: CGFloat = 0
    var body: some View {
        VStack {
            if expand {
                Capsule()
                    .frame(maxWidth: 100, maxHeight: 4)
                    .foregroundColor(.black)
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
                .padding(.top, 5)
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
                    
                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                        Capsule()
                            .fill(.primary.opacity(0.1))
                            .frame(maxHeight: 4)
                        
                        Capsule()
                            .fill(Color("AppColor"))
                            .frame(maxWidth: circleOffset + 15, maxHeight: 4)
                        
                        Circle()
                            .fill(.ultraThinMaterial)
                            .frame(width: 25, height: 25)
                            .offset(x: circleOffset)
                        Circle()
                            .strokeBorder(Color("AppColor"), lineWidth: 4)
                            .frame(width: 25, height: 25)
                            .offset(x: circleOffset)
                        
                    }
                    .gesture(DragGesture().onChanged(onChangedCircle(value:)))
                    
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
                        
                        Slider(value: $volume)
                            .tint(Color("AppColor"))
                        
                    }
                    .padding(.top, 40)
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            closeMiniPlayer = true
                            expand = false
                        }
                    } label: {
                        Image(systemName: "stop.fill")
                            .font(.title)
                            .foregroundColor(Color("AppColor"))
                    }
                    
                    Spacer()
                    
                }
                .padding(.horizontal)
                .padding(.top)
                
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
                        expand = true
                    }
                })
        .cornerRadius(expand ? 10 : 0)
        .ignoresSafeArea(edges: .bottom)
        .offset(y: offset)
        .gesture(DragGesture().onEnded(onEnded(value:)).onChanged(onChanged(value:)))
    }
    
    func onEnded(value: DragGesture.Value) {
        withAnimation(.easeOut) {
            if value.translation.height > picHeight {
                expand = false
            }
            offset = 0
        }
    }
    
    func onChanged(value: DragGesture.Value) {
        if value.translation.height > 0 && expand {
            offset = value.translation.height
        }
    }
    
    func onChangedCircle(value: DragGesture.Value) {
        if value.location.x >= 0 && value.location.x <= UIScreen.main.bounds.width - 50 {
            circleOffset = value.location.x
        }
    }
}

struct MiniPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MiniPlayer(expand: .constant(true), closeMiniPlayer: .constant(false), recognizing: .constant(true))
    }
}
