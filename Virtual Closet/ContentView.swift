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
                            .multilineTextAlignment(.center)
                            .padding(.trailing, 25)
                    }
                    .padding()
                    .offset(y: -568)
                    .buttonStyle(HomeButton())
                    Button(action: {showingAddItem.toggle()}){
                        Text("Add Item")
                            .multilineTextAlignment(.center)
                            .padding(.trailing, 25)
                    }
                    .padding()
                    .offset(y: -568)
                    .buttonStyle(HomeButton())
                    Button(action: {showingCleanCloset.toggle()}){
                        Text("Clean Closet")
                            .multilineTextAlignment(.trailing)
                            .padding(.leading)
                    }
                    .padding()
                    .offset(y: -568)
                    .buttonStyle(HomeButton())
                }
            }
            .padding()
        }
}
}

struct HomeButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.bold)
            .foregroundColor(Color.black)
            
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



    
