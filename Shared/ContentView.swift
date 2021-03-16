//
//  ContentView.swift
//  Shared
//
//  Created by Mitch Tabian on 2021-03-15.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date()
    var body: some View {
        Form{
            DatePicker(
                "Please enter a date",
                selection: $wakeUp,
                in: Date()...,
                displayedComponents: .date
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
