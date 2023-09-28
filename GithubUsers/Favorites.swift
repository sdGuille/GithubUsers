//
//  Favorites.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 26/9/23.
//

import Foundation

class Favorites: ObservableObject {
    private var users: Set<String>
    private let saveKey = "Favorites"
    
    init() {
        users = []
    }
    
    func contains( user: User) -> Bool {
        users.contains(user.login)
    }
    
    func add(_ user: User) {
        objectWillChange.send()
        users.insert(user.login)
        save()
    }
    
    func remove(_ user: User) {
        objectWillChange.send()
        users.remove(user.login)
        save()
    }
    
    func save() {
        do {
            let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
            let userLogin = Array(self.users)
            let data = try JSONEncoder().encode(userLogin)
            try data.write(to: filename, options: [.atomic, .completeFileProtection])
            print("User data saved.")
        } catch {
            print("Unable to save data.")
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
    
    func load() {
        let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
        do {
            let data = try Data(contentsOf: filename)
            let userLogin = try JSONDecoder().decode([String].self, from: data)
            users = Set(userLogin)
        } catch {
            print("Unable to load data")
        }
    }
}
