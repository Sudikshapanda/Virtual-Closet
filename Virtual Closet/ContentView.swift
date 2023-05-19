//
//  ContentView.swift
//  Virtual Closet
//
//  Created by Sudiksha Panda on 5/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingCloset = false
    @State private var showingAddItem = false
    @State private var showingCleanCloset = false
    var body: some View {
        if showingCloset {
            MyClosetView()
        }else {
            //AppHome()
            VStack {
                Image("my closet")
                    .resizable()
                    .frame(width:1056, height:1024)
                    .offset(y: -110)
                    .animation(.easeInOut, value: true)
                HStack {
                    Button(action: {showingCloset.toggle()}){
                        Text("My Closet")
                    }
                    .offset(y: -568)
                    //Button(action: {sh})
                }
            }
            .padding()
        }
}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



    
