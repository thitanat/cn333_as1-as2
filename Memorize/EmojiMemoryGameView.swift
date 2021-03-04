import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        VStack{
                Grid(viewModel.cards) { card in  //ใช้ grid ช่วยในการเรียง
                    CardView(card : card).onTapGesture {
                        viewModel.choose(card : card)
                    }.padding(5)
            }
            .foregroundColor(.orange)
            //.font(viewModel.cards.count>=8 ? .body : .largeTitle)
            //.foregroundColor(viewModel.cards.count>6 ? .red : .blue)
            Button("New Game"){
                GameState.shared.gameID = UUID()
            }
            Text("Score = \(viewModel.scorePoint)")
        }
    }
}
struct CardView: View {
    var card : MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content).font(Font.system(size : fontSize(for: geometry.size)))
                }
                else if !card.isMatched {
                    RoundedRectangle(cornerRadius:
                                        cornerRadius).fill()
                }
            }//.aspectRatio(0.667,contentMode: .fit) // ratio scale 2:3
        }
    }
    //MARK: DRAWING CONSTANTS
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3.0
    let fontScaleFactor: CGFloat = 0.75

    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height)*fontScaleFactor
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
