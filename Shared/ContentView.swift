//
//  ContentView.swift
//  Shared
//
//  Created by Mitch Tabian on 2021-03-15.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(
        entity: Book.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Book.title,ascending: true),
            NSSortDescriptor(keyPath: \Book.author, ascending: true)
        ]
    )
    var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(books, id: \.self){ book in
                    NavigationLink(
                        destination: DetailView(book: book),
                        label: {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            VStack(alignment: .leading){
                                Text(book.title ?? "Unknown title")
                                    .font(.headline)
                                Text(book.author ?? "Unknown author")
                                    .foregroundColor(.secondary)
                            }
                        })
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationBarTitle("Bookworm")
            .navigationBarItems(leading: EditButton(),trailing:
                Button(action: {
                    self.showingAddScreen.toggle()
                }, label: {
                    Image(systemName: "plus")
                })
                .sheet(isPresented: $showingAddScreen, content: {
                    AddBookView().environment(\.managedObjectContext, self.viewContext)
                })
            )
        }
    }
    
    func deleteBooks(at offsets: IndexSet){
        for offset in offsets{
            let book = books[offset]
            viewContext.delete(book)
        }
        try? viewContext.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
