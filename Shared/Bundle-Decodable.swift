//
//  Bundle-Decodable.swift
//  test
//
//  Created by Mitch Tabian on 2021-03-18.
//

import Foundation

extension Bundle{
    func decode<T: Codable>(_ file: String) -> T {
        guard let fileUrl = url(forResource: file, withExtension: nil) else{
            fatalError("Failed to locate \(file) from bundle.")
        }
        
        guard let data = try? Data(contentsOf: fileUrl) else{
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
