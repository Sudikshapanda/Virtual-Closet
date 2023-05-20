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
                Image("HomeHangers")
                    .resizable()
                    .animation(.easeInOut, value: true)
                HStack {
                    // Button 1: My Closet
                    Button(action: {showingCloset.toggle()}){
                        Text("My Closet")
                    }
                    .offset(x: -67 , y: -587)
                    .buttonStyle(HomeButton())
                    
                    // Button 2: Add Item
                    Button(action: {showingAddItem.toggle()}){
                        Text("Add Item")
                    }
                    .offset(x: 65 , y: -587)
                    .buttonStyle(HomeButton())
                }
               
                HStack {
                    // Button 3: Clean Closet
                    Button(action: {showingCloset.toggle()}){
                        Text("Clean Closet")
                    }
                    .offset(x: -67 , y: -587)
                    .buttonStyle(HomeButton())
                    
                    // Button 4: Plan Fit
                    Button(action: {showingAddItem.toggle()}){
                        Text("Plan Fit")
                    }
                    .offset(x: 65 , y: -587)
                    .buttonStyle(HomeButton())
                }
                HStack {
                    // Button 5: Post
                    Button(action: {showingCloset.toggle()}){
                        Text("Post")
                    }
                    .offset(x: -67 , y: -587)
                    .buttonStyle(HomeButton())
                    
                    // Button 6: Help
                    Button(action: {showingAddItem.toggle()}){
                        Text("Help")
                    }
                    .offset(x: 65 , y: -587)
                    .buttonStyle(HomeButton())
                }
            }
            //.padding()
            .background(Image("HomeBackground2").resizable()).ignoresSafeArea()
            
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



    
