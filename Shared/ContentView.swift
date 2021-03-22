//
//  ContentView.swift
//  Shared
//
//  Created by Mitch Tabian on 2021-03-15.
//

import SwiftUI

struct ContentView: View {
    
    @State private var backgroundColor = Color.red
    
    var body: some View {
        VStack{
            Text("Hello World")
                .padding()
                .background(backgroundColor)
            
            Text("Change Color")
                .padding()
                .contextMenu(menuItems: {
                    Button(action: {
                        backgroundColor = .red
                    }, label: {
                        Text("Red")
                    })
                    Button(action: {
                        backgroundColor = .green
                    }, label: {
                        Text("Green")
                    })
                    Button(action: {
                        backgroundColor = .blue
                    }, label: {
                        Text("Blue")
                    })
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
