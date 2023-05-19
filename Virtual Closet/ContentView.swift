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
                    // Button 1: My Closet
                    Button(action: {showingCloset.toggle()}){
                        Text("My Closet")
                    }
                    .offset(x: -42 , y: -568)
                    .buttonStyle(HomeButton())
                    
                    // Button 2: Add Item
                    Button(action: {showingAddItem.toggle()}){
                        Text("Add Item")
                    }
                    .offset(x: 8 , y: -568)
                    .buttonStyle(HomeButton())
                    
                    // Button 3: Clean Closet
                    Button(action: {showingCleanCloset.toggle()}){
                        Text("Clean Closet")
                    }
                    .offset(x: 50 , y: -568)
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
            .padding(.vertical, 3)
            .fontWeight(.medium)
            .foregroundColor(Color.black)
            .font(.custom(
                "Economica",
                fixedSize: 25))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



    
