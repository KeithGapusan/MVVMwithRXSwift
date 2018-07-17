//
//  MovieListViewController.swift
//  MVVMwithRXSwiftDemo
//
//  Created by Keith Gapusan on 16/07/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var viewModel: MovieViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.viewModel.fetchMovies {
                
                self.tableView.reloadData()
            }
        }
        
   
        // Do any additional setup after loading the view.
    }



}
extension MovieListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: UITableViewCell , indexPath : IndexPath){
        cell.textLabel?.text = viewModel.titleItemForIndexPath(section: indexPath.row)
    }
    
}
