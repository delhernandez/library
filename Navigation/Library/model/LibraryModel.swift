//
//  LibraryModel.swift
//  Navigation
//
//  Created by Delfin Hernandez Gomez on 20/10/22.
//

import Foundation


struct Author {
    let name: String
    let biography: String
}

enum Category: String, CaseIterable {
    case Filosofia
    case Historia
    case Psicoanálisis
    case Ciencia_Ficcion
}


struct Book {
    let author: String
    let cathegory: Category
    let title: String
    let coverImageData: String
}


