//
//  AddView.swift
//  test
//
//  Created by Mitch Tabian on 2021-03-18.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type){
                    ForEach(Self.types, id: \.self){
                        Text($0)
                    }
                }
                
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing:
                Button("Save"){
                    let actualAmount = Int(amount)
                    if (actualAmount != nil) {
                        let item = ExpenseItem(name: name, type: type, amount: actualAmount!)
                        expenses.items.append(item)
                        presentationMode.wrappedValue.dismiss()
                    }else{
                        print("Error with the amount")
                    }
                }
            )
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
