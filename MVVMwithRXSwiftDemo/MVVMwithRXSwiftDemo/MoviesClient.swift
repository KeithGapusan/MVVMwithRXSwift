//
//  MovieClient.swift
//  MVVMwithRXSwiftDemo
//
//  Created by Keith Gapusan on 17/07/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit

class MoviesClient: NSObject {
    
//    func fetchMoviesV2(completion:@escaping ([Dictionary<AnyHashable,Any>]?) -> ()){
//        let urlString = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
//        let url = URL(string: urlString)
//        let session = URLSession(configuration: URLSessionConfiguration.default)
//        let task = session.dataTask(with: url!, completionHandler: {
//            (data, response, error) in
//            if error != nil{
//                completion(nil)
//                return
//            }
//            //            var error : NSError
//            if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [Dictionary<AnyHashable,Any>] {
//             
//                if let movies = json![keyPath(path: "feed.entry")]{
//                    //value(forKey: "feed.entry"){
//                    completion(movies as? [Dictionary<AnyHashable,Any>])
//                    print(movies)
//                    return
//                    
//                }
//            }
//        })
//        
//        task.resume()
//    
//    }
    
    func fetchMovies(completion: @escaping ([NSDictionary]?) -> ()){
        // fetch the data
        // call the completion
        let urlString = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
        let url = URL(string: urlString)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            if error != nil{
                completion(nil)
                return
            }
            //            var error : NSError
            if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
               
                if let movies = json?.value(forKeyPath: "feed.entry"){
                //value(forKey: "feed.entry"){
                    completion(movies as? [NSDictionary])
                    print(movies)
                    return
                    
                }
            }
        })
            
            task.resume()
        }

    func keyPath<T>(path: String) -> (_ box: [String: AnyObject]) -> T? {
        return { box in
            return (box as NSDictionary).value(forKeyPath: path) as? T
        }
    }
}
