//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Mukunda on 21/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
//  anyBodyWhoIsSubscribedTo ObservableObject canAccessThisRealTimeData
class NetworkManager: ObservableObject {
    
//.... atFirstMovingdecodable.hitsTo posts ThenInThat hits weNeed [Post] TherFore var posts = [Post]()....
    
    @Published var posts = [Post]()
    
    func featchData(){
        if let URL = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: URL) { (data:Data?, urlresponse:URLResponse?, error:Error?) in
                
                if error == nil{
                                        if let safeData = data{
                    let decoder = JSONDecoder()

                        
                        do{
                            
                            let decodedData = try decoder.decode(PostDataJson.self, from:safeData)
                            DispatchQueue.main.async {
                                self.posts = decodedData.hits
                            }
                            
                        }
                        
                        catch{
                            print(error)
                        }
                        
                        
                    }
                    
                }
                
                
                
            }
            task.resume()
        }
        
        
    }
}
