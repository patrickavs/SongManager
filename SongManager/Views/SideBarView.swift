//
//  SideBarView.swift
//  SongManager
//
//  Created by Patrick Alves on 02.03.23.
//

import SwiftUI

struct SideBarView: View {
    @Binding var toolbarTapped: Bool
    var body: some View {
        GeometryReader { proxy in
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Image("p2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
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
                    
                    SideBarItem(action: print("profile"), label: "Profile", image: "person")
                    SideBarItem(action: print("profile"), label: "Profile", image: "person")
                    SideBarItem(action: print("profile"), label: "Profile", image: "person")
                    SideBarItem(action: print("profile"), label: "Profile", image: "person")
                    SideBarItem(action: print("profile"), label: "Settings", image: "gear")

                }
                .padding(.leading)
                
                Spacer()
            }
            .frame(maxWidth: proxy.size.width / 1.5, maxHeight: .infinity, alignment: .leading)
            .background(Color("AppColor"))
            .offset(x: toolbarTapped ? 0 : -UIScreen.main.bounds.width)
        }
    }
    
    func SideBarItem(action: (), label: String, image: String) -> some View {
        HStack {
            Image(systemName: image)
                .padding(.trailing)
            
            Button {
                action
            } label: {
                Text(label)
            }
            .bold()
        }
        .font(.title2)
        .padding(.bottom, 40)
        .foregroundColor(.primary)
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView(toolbarTapped: .constant(true))
    }
}
