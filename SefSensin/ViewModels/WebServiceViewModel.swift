//
//  HomeViewModel.swift
//  SefSensin
//
//  Created by Mehdican Büyükplevne on 28.02.2023.
//

import UIKit
import Firebase
import FirebaseStorage

final class WebServiceViewModel {

    // MARK: - Create Firebase Reference
    private var ref: DatabaseReference?
    var kitchens = [Kitchen]() // Insert Data Into
        // MARK: - Fetch All Data Func.
        public func fetchAllData(completion: @escaping () -> Void) {
            DispatchQueue.global(qos: .userInitiated).async { 
                self.ref = Database.database().reference().child("kitchen")
                self.ref?.observeSingleEvent(of: .value, with: { snapshot in
                    if let data = snapshot.value as? [[String:Any]] {
                        var fetchKitchenData = [Kitchen]()
                        for dict in data {
                            if let kitchenImage = dict["kitchenImage"] as? String,
                                let kitchenName = dict["kitchenName"] as? String,
                                let recipes = dict["recipes"] as? [[String:Any]] {
                                var fetchRecipesData = [Recipe]()
                                for recipeDict in recipes {
                                    if let calories = recipeDict["calories"] as? Int,
                                        let cookingTime = recipeDict["cookingTime"] as? String,
                                        let foodDetailImage = recipeDict["foodDetailImage"] as? String,
                                        let foodImage = recipeDict["foodImage"] as? String,
                                        let foodName = recipeDict["foodName"] as? String,
                                        let id = recipeDict["id"] as? String,
                                        let recipeIngredients = recipeDict["recipeIngredients"] as? [String],
                                        let recipeMaking = recipeDict["recipeMaking"] as? [String] {
                                        
                                        let recipeData = Recipe(calories: calories, cookingTime: cookingTime, foodDetailImage: foodDetailImage, foodName:   foodName, foodImage: foodImage, id: id, recipeIngredients: recipeIngredients, recipeMaking: recipeMaking)
                                        fetchRecipesData.append(recipeData)
                                    }
                                }
                                let kitchenData = Kitchen(kitchenImage: kitchenImage, kitchenName: kitchenName, recipes: fetchRecipesData)
                                fetchKitchenData.append(kitchenData)
                            }
                        }
                        DispatchQueue.main.async {
                            self.kitchens = fetchKitchenData
                            completion()
                    }
                }
            })
        }
    }
}
