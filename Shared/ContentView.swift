//
//  ContentView.swift
//  Shared
//
//  Created by Mitch Tabian on 2021-03-15.
//

import SwiftUI

struct SecondView: View{
    
    @Environment(\.presentationMode) var presentationMode
    var name: String
    
    var body: some View{
        Button("Dismiss"){
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ContentView: View {
    
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show sheet"){
            showingSheet.toggle()
        }.sheet(isPresented: $showingSheet, content: {
            SecondView(name: "@mitch_tabian")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
