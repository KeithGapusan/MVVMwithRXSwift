//
//  MovieViewModel.swift
//  MVVMwithRXSwiftDemo
//
//  Created by Keith Gapusan on 16/07/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit

class MovieViewModel: NSObject {
    @IBOutlet var moviesClient : MoviesClient!
    var movies : [NSDictionary]?
    
    func fetchMovies(completion: @escaping () -> ()){
        moviesClient.fetchMovies { (movies) in
            self.movies = movies
            completion()
        }
    }
    
    func numberOfItemsInSection(section: Int) -> Int{
        return movies?.count ?? 0
    }
    
    func titleItemForIndexPath(section:  Int) -> String{
        return "String"
    }
    
    
}
