//
//  TableVC.swift
//  Navigation
//
//  Created by Delfin Hernandez Gomez on 20/10/22.
//

import UIKit

class LibraryTableVC : UITableViewController {
    
    let cellIdentifier = "BookCell"
    let presenter: LibraryPresenter = LibraryPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadData()
        title = "Library"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.getSectionsCount()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getBooksForSection(sectionIndex: section).count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? BookCell else {
            return UITableViewCell()
        }
        
        cell.bookTitle.text = presenter.getBook(forRowAt: indexPath).title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //performSegue(withIdentifier: "", sender: tableView)
        
        let bookDetailVC: BookDetailVC = UIStoryboard(name: "Navigation", bundle: nil).instantiateViewController(withIdentifier: "BookDetailVC") as! BookDetailVC
        
        bookDetailVC.book = presenter.getBook(forRowAt: indexPath)
        self.navigationController?.pushViewController(bookDetailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tableView = (sender as? UITableView) {
            if let indexPath = tableView.indexPathForSelectedRow {
                let selectedBook = presenter.getBook(forRowAt: indexPath)
                
                if let detailBookVC = segue.destination as? BookDetailVC {
                    detailBookVC.book = selectedBook
                }
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
}


