//
//  HomeCollectionModel.swift
//  SefSensin
//
//  Created by Mehdican Büyükplevne on 28.02.2023.
//

import UIKit

// MARK: - Child
struct WebServiceModel {
    let kitchen: [Kitchen]
}

// MARK: - Kitchen
struct Kitchen {
    let kitchenImage: String
    let kitchenName: String
    let recipes: [Recipe]
}

// MARK: - Recipe
struct Recipe {
    let calories: Int
    let cookingTime: String
    let foodDetailImage: String
    let foodName: String
    let foodImage: String
    let id: String
    let recipeIngredients: [String]
    let recipeMaking: [String]
}


