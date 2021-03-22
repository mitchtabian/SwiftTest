//
//  ContentView.swift
//  Shared
//
//  Created by Mitch Tabian on 2021-03-15.
//

import SwiftUI

enum NetworkError: Error {
    case badURL, requestFailed, unknown
}

struct ContentView: View {
    var body: some View {
        Text("hello")
            .onAppear {
                self.fetchData(
                    from: "https://www.apple.com",
                    completion: { result in
                        switch result {
                        case .success(let str):
                            print(str)
                        case .failure(let error):
                            switch error{
                            case .badURL:
                                print("BAD URL")
                            case .requestFailed:
                                print("Network problems")
                            case .unknown:
                                print("Unknown error")
                            }
                        }
                    }
                )
            }
    }
    
    func fetchData(from urlString: String, completion: @escaping(Result<String, NetworkError>) -> Void)  {
        guard let url = URL(string: urlString) else{
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            DispatchQueue.main.async{
                if let data = data{
                    let stringData = String(decoding: data, as: UTF8.self)
                    completion(.success(stringData))
                }else if error != nil{
                    completion(.failure(.requestFailed))
                }else{
                    completion(.failure(.unknown))
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
