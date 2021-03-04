//
//  AppState.swift
//  Memorize
//
//  Created by Macintosh HD on 4/3/2564 BE.
//

import Foundation

class GameState: ObservableObject {
    static let shared = GameState()

    @Published var gameID = UUID()
}
