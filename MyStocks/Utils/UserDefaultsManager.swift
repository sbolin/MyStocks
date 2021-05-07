//
//  UserDefaultsManager.swift
//  MyStocks
//
//  Created by Scott Bolin on 27-Apr-21.
//

import Foundation

final class UserDefaultsManager {
    
    private static let symbolKey = "SYMBOL_KEY"
    private static let nameKey = "NAME_KEY"

    var savedSymbols: [String] = []
    var savedNames: [String] = []
    
    static let shared = UserDefaultsManager()
    
    private init() {
        get()
    }
    
    func get() {
        if let symbols = UserDefaults.standard.array(forKey: Self.symbolKey) as? [String] {
            savedSymbols = symbols
        }
        if let names = UserDefaults.standard.array(forKey: Self.nameKey) as? [String] {
            savedNames = names
        }
    }
    
    func set(symbol: String, name: String) {
        savedSymbols.append(symbol)
        savedNames.append(name)
        UserDefaults.standard.set(self.savedSymbols, forKey: Self.symbolKey)
        UserDefaults.standard.set(self.savedNames, forKey: Self.nameKey)
    }
    
    func removeSymbol(symbol: String, name: String) {
        guard let index = savedSymbols.firstIndex(of: symbol) else { return }
        savedSymbols.remove(at: index)
        savedNames.remove(at: index)
        UserDefaults.standard.removeObject(forKey: symbol)
        UserDefaults.standard.removeObject(forKey: name)
    }
}
