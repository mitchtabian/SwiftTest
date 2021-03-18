//
//  ContentView.swift
//  Shared
//
//  Created by Mitch Tabian on 2021-03-15.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var order = Order()
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("Select your cake type", selection: $order.type){
                        ForEach(0..<Order.types.count){
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper(value: $order.quantity, in: 3...20){
                        Text("Number of cakes: \(order.quantity)")
                    }
                    Section{
                        Toggle(isOn: $order.specialRequestEnabled.animation()){
                            Text("Any special requests?")
                        }
                        if order.specialRequestEnabled{
                            Toggle(isOn: $order.extraFrosting, label: {
                                Text("Add extra frosting")
                            })
                            
                            Toggle(isOn: $order.addSprinkles, label: {
                                Text("Add extra sprinkles")
                            })
                        }
                    }
                }
                Section{
                    NavigationLink(
                        destination: AddressView(order: order),
                        label: {
                            Text("Delivery Details")
                        })
                }
            }.navigationBarTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
