//
//  SideBarView.swift
//  SongManager
//
//  Created by Patrick Alves on 02.03.23.
//

import SwiftUI

struct SideBarView: View {
    @Binding var toolbarTapped: Bool
    @Binding var tabbarInvisisble: Bool
    @Binding var closeMiniPlayer: Bool
    @State private var darkMode = true
    var body: some View {
        GeometryReader { proxy in
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        Button {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                closeMiniPlayer = false
                                tabbarInvisisble = false
                                toolbarTapped = false
                            }
                        } label: {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.primary)
                        }
                    }
                    .padding([.top, .bottom])
                    HStack {
                        Image("p2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("Paddi Maddi")
                                .font(.title2)
                            Text("Mood")
                                .font(.callout)
                        }
                    }
                    .foregroundColor(.primary)
                    .padding(.bottom, 50)
                    
                    SideBarItem(action: print("h"), label: "Profile", image: "person")
                    SideBarItem(action: print("a"), label: "Profile", image: "person")
                    SideBarItem(action: print("l"), label: "Profile", image: "person")
                    SideBarItem(action: print("l"), label: "Profile", image: "person")
                    SideBarItem(action: print("o"), label: "Settings", image: "gear")
                    
                    Divider()
                        .padding([.vertical, .leading, .trailing], -20)
                        .blendMode(.colorBurn)
                        
                    Toggle(isOn: $darkMode) {
                        Text(darkMode ? "Darkmode" : "Lightmode")
                    }
                    .font(.title2)
                    .tint(.primary)
                    .animation(.easeInOut(duration: 0.2), value: darkMode)
                }
                .padding(.trailing)
                .padding(.leading)
                
                Spacer()
            }
            .frame(maxWidth: proxy.size.width / 1.5, maxHeight: .infinity, alignment: .leading)
            .background(Color("AppColor"))
            .offset(x: toolbarTapped ? 0 : -proxy.size.width)
        }
    }
    
    func SideBarItem(action: (), label: String, image: String) -> some View {
        HStack {
            Button {
                action
            } label: {
                HStack(spacing: 30) {
                    Image(systemName: image)
                    Text(label)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .font(.title2)
        .padding(.bottom, 40)
        .foregroundColor(.primary)
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView(toolbarTapped: .constant(true), tabbarInvisisble: .constant(false), closeMiniPlayer: .constant(false))
    }
}
