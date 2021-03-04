import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var gameState = GameState.shared
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame()).id(gameState.gameID)
            
        }
    }
    
}


