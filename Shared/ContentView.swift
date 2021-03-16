//
//  ContentView.swift
//  Shared
//
//  Created by Mitch Tabian on 2021-03-15.
//

import SwiftUI

struct CapsuleText: View {
    var text: String
    var color: Color
    var body: some View{
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(color)
            .clipShape(Capsule())
    }
}

struct ContentView: View {
    var body: some View {
        VStack{
            CapsuleText(text: "Capsule 1", color: Color.blue)
            CapsuleText(text: "Capsule 2", color: Color.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
