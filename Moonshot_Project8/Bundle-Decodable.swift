//
//  Bundle-Decodable.swift
//  Moonshot_Project8
//
//  Created by Jesse Sheehan on 8/23/24.
//

import Foundation

extension Bundle {
    
    //YES - this makes liberal use of FatalError - this is good, even though it'll probably not happen for the user unless YOU made a mistake.
    
    
    
    //"T" could mean or be anythign at all - "T" is just a convention - "a type of something"
    //This is a "generic" - basically, it says you don't need to specify because swift can just figure it out
    //although you have to add the ":Codable" so that it follows the conventions of below.
    //btw - "Codable" is actually both "Encodable" AND "Decodable"
    func decode<T: Codable>(_ file: String) -> T { //[String: Astronaut] {
        //this guard ensures a URL is there
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        //this guard enrusres there is data in the url
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        //creates the decoder
        let decoder = JSONDecoder()
        let formatter = DateFormatter() //FYI - the user's timezone may be important, sometimes!!
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
//        //this guard ensures it is able to successfully decode the data.
//        guard let loaded = try? decoder.decode([String: Astronaut].self, from: data) else {
//            fatalError("Failed to decode \(file) from bundle.")
//        }
//        //returns the String:Astronaut Dictionary.
//        return loaded
        
        //INSTEAD of the guard (above^^), try this to help diagnose any problems more specifically.
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' - \(context.debugDescription)") //KEY NOT FOUND
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch - \(context.debugDescription)") // TYPE MISMATCH
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value - \(context.debugDescription)") // VALUE OF TYPE NOT FOUND!
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) form bundle because it appears to be an invalid JSON") //INVALID/CORRUPTED JSON FILE
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)") //CATCH ALL ERROR
        }
        
        
    }
}
