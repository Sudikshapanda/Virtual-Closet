//
//  ContentView.swift
//  Virtual Closet
//
//  Created by Sudiksha Panda on 5/10/23.
//

import SwiftUI

struct ContentView: View {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

    
