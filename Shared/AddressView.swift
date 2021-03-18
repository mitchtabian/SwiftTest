//
//  AddressView.swift
//  test
//
//  Created by Mitch Tabian on 2021-03-18.
//

import SwiftUI

struct AddressView: View {
    
    @ObservedObject var order: Order
    
    var body: some View {
        Form{
            Section{
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section{
                NavigationLink(destination: CheckoutView(order: order)){
                    Text("Check out")
                }
                .disabled(order.hasValidAddress == false)
            }
        }
        .navigationBarTitle(Text("Delivery Details"), displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
