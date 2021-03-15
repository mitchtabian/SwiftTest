//
//  ContentView.swift
//  Shared
//
//  Created by Mitch Tabian on 2021-03-15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            Section{
                Text("Hello there...").padding()
                Text("Hello there...").padding()
                Text("Hello there...").padding()
            }
            Group {
                Text("Hello there...").padding()
                Text("Hello there...").padding()
                Text("Hello there...").padding()
            }
            Group {
                Text("Hello there...").padding()
                Text("Hello there...").padding()
                Text("Hello there...").padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
