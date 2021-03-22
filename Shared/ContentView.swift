//
//  ContentView.swift
//  Shared
//
//  Created by Mitch Tabian on 2021-03-15.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numbers = [1,2,3,4,5,6,7,8,9,10]
    
    var body: some View {
        NavigationView{
            List{
                ForEach(numbers, id: \.self){ row in
                    NavigationLink(
                        destination: VStack{
                            Text("Detail \(row)")
                            Image("apostle_islands")
                                .resizable()
                                .scaledToFit()
                        }
                        ,
                        label: {
                            Text("Row \(row)")
                        }
                    )
                }
                .onDelete(perform: deleteRow)
            }
            .navigationBarItems(leading: EditButton())
            .navigationBarTitle("SwiftUI")
        }
    }
    
    func deleteRow(at offsets: IndexSet){
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
