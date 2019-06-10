//
//  ViewController.swift
//  HenriPotierLibrary
//
//  Created by Sandy on 2019-06-06.
//  Copyright © 2019 Sandy. All rights reserved.
//

import UIKit

class BooksViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBAction func addToCartAction(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToCart", sender: self)
    }

   
    override func viewDidLoad() {
        super.viewDidLoad()
        displayResults()
    }
    
    override func configureView() {
       // tableView.dataSource = dataSource
        tableView.delegate = self
       // tableView.register(UINib(nibName: "BookCell", bundle: nil), forCellReuseIdentifier: BookCell.identifier)
        
    }
  
    override func displayResults() {
        
        //self.dataSource.update(with: b)
       // self.tableView.reloadData()
    }
}

//MARK - UITableViewDelegate
extension BooksViewController: UITableViewDelegate  {
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // guard let cell = tableView.cellForRow(at: indexPath) as? BookCell else { return }
       // cell.toggle()
        tableView.reloadData()
    }
}

//MARK - Segue
extension BooksViewController {
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // viewModel.addToCart(dataSource, tableView)
        //guard let cartVC = segue.destination as? CartViewController,
       // let selected = dataSource.selectedBooks as? [Book] else { return }
       // cartVC.viewModel.books = selected
    }
}

