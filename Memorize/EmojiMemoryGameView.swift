import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
    HStack {
            ForEach(viewModel.cards) { card in
                CardView(card : card).onTapGesture {
                    viewModel.choose(card : card)
                }
            }
        }
        .foregroundColor(.orange)
        .padding()
        .font(viewModel.cards.count>=8 ? .body : .largeTitle)
        //.foregroundColor(viewModel.cards.count>6 ? .red : .blue)
    }
}
struct CardView: View {
    var card : MemoryGame<String>.Card
    var body: some View {
        ZStack{
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text(card.content)
            }
            else {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }.aspectRatio(0.667,contentMode: .fit) // ratio scale 2:3
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
