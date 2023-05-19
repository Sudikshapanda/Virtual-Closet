//
//  ContentView.swift
//  Virtual Closet
//
//  Created by Sudiksha Panda on 5/10/23.
//

import SwiftUI

struct ContentView: View {
    @State public var showingCloset = false
    var body: some View {
        if showingCloset {
            MyClosetView()
        }else {
            AppHome()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



    
