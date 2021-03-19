//
//  DetailView.swift
//  test
//
//  Created by Mitch Tabian on 2021-03-19.
//

import SwiftUI
import CoreData

struct DetailView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentationMode
    @State private var showingDeleteAlert = false
    
    let book: Book
    
    var body: some View {
        GeometryReader{ geo in
            VStack{
                ZStack(alignment: .bottomTrailing){
                    Image(self.book.genre ?? "Fantasy")
                        .frame(minWidth: geo.size.width)
                    
                    Text(self.book.genre?.uppercased() ?? "FANTASY")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.75))
                        .clipShape(Capsule())
                        .offset(x: -5, y: -5)
                }
                Text(self.book.author ?? "Unknown author")
                    .font(.title)
                    .foregroundColor(.secondary)
                
                Text(self.book.review ?? "No review")
                    .font(.title)
                    .foregroundColor(.secondary)
                
                RatingView(rating: .constant(Int(self.book.rating)))
                    .font(.largeTitle)
                
                Spacer()
            }
        }
        .navigationBarTitle(Text(book.title ?? "Unknown Book"), displayMode: .inline)
        .alert(isPresented: $showingDeleteAlert, content: {
            Alert(
                title: Text("Delete Book"),
                message: Text("Are you sure?"),
                primaryButton: .destructive(Text("Delete")){
                    self.deleteBook()
                },
                secondaryButton: .cancel()
            )
        })
        .navigationBarItems(trailing: Button(action: {
            self.showingDeleteAlert = true
        }, label: {
            Image(systemName: "trash")
        }))
    }
    
    func deleteBook(){
        viewContext.delete(book)
        
//        try? self.viewContext.save()
        
        presentationMode.wrappedValue.dismiss()
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static let viewContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some  View{
        let book = Book(context: viewContext)
        book.id = UUID()
        book.title = "Some Book Title"
        book.author = "Mitch Tabian"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "This was a great book... But the author needs to learn how to spell."
        return NavigationView{
            DetailView(book: book)
        }
    }
}
