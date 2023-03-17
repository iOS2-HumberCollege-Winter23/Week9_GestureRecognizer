//
//  NetworkingManager.swift
//  Week8_Networking_API
//
//  Created by Rania Arbash on 2021-11-12.
//

import Foundation

class NetworkingManager{
    
    func fetchDataFromAPI(handler: @escaping (Result<CoursePackage,Error>)->Void){
        let url = "https://raw.githubusercontent.com/RaniaArbash/Networking_IOS/main/courses_data.json"
        
        let URLObject = URL(string: url)!
       let task = URLSession.shared.dataTask(with: URLObject) { Data, response, error in
            //
            if let error = error {
                print(error)
                handler(.failure(error))
                return
            }
            guard let httpresponse = response as? HTTPURLResponse , (200...299).contains(httpresponse.statusCode) else {
                print( "incorrect response ")
                handler(.failure(error!))
                return
            }
            if let jsondata = Data {
                
                let deconder = JSONDecoder()
                
                deconder.dateDecodingStrategy = .iso8601
                do {
                    let resutl = try deconder.decode(CoursePackage.self, from: jsondata)
                    handler(.success(resutl))
                   
                }catch {
                    print(error)
                    handler(.failure(error))
                }
            }
            // guard (condition) else {some code then return }
            // if (condition) else {}
            
        }
        task.resume()
        
    }
    
}
