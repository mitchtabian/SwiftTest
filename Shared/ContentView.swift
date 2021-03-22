//
//  ContentView.swift
//  Shared
//
//  Created by Mitch Tabian on 2021-03-15.
//

import SwiftUI

class DelayedUpdater: ObservableObject{
    
//    @Published var value = 0
    
    var value = 0 {
        willSet{
            objectWillChange.send()
        }
    }
    
    init(){
        for i in 1...10{
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i), execute: {
                self.value += 1
            })
        }
    }
}

struct ContentView: View {
    
    @ObservedObject var updater = DelayedUpdater()
    
    var body: some View {
        Text("Value is: \(updater.value)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
