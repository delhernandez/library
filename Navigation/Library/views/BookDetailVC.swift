//
//  BookDetailVC.swift
//  Navigation
//
//  Created by Delfin Hernandez Gomez on 20/10/22.
//

import UIKit

class BookDetailVC: UIViewController {
    
    var book: Book? = nil
    
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let book = (book) {
            title = book.author
            bookTitle.text = book.title
            bookImage.image = getImageFromBase64(base64: book.coverImageData)
        }
    }
    
    private func getImageFromBase64(base64: String) -> UIImage? {
        if let data = Data(base64Encoded: base64) {
            if let image = UIImage(data: data) {
                return image
            }
        }
        return nil
    }
}
