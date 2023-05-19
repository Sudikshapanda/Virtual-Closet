//
//  AppHome.swift
//  Virtual Closet
//
//  Created by Sudiksha Panda on 5/19/23.
//

import SwiftUI

struct AppHome: View {
    //@Binding var showingCloset: Bool
    var body: some View {
        VStack {
            Image("my closet")
                .resizable()
                .frame(width:1056, height:1024)
                .offset(y: -110)
                .animation(.easeInOut, value: true)
        }
        .padding()
    }
    //Button(isPlaying ? "Pause" : "Play") {
    //isPlaying.toggle()
    Button("My Closet", showingCloset.Toggle()
    )
    
    struct AppHome_Previews: PreviewProvider {
        static var previews: some View {
            AppHome()
        }
    }
    
}
