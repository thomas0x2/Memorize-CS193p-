//
//  ContentView.swift
//  Memorize
//
//  Created by Thomas Bollenbach on 08.01.24.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["♠️", "♦️", "♣️", "♥️", "♠️", "♦️", "♣️", "♥️", "♠️", "♦️", "♣️", "♥️", "♠️", "♦️", "♣️", "♥️"]
    @State var card_count = 4
    var body: some View {
        
        VStack(spacing: 20){
            ScrollView{
                cards
            }
            Spacer()
            cardCounterAdjusters
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<card_count, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
    var cardCounterAdjusters: some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCounterAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action:{
            card_count += offset
        }, label:{
            Image(systemName: symbol)
        })
        .disabled(card_count + offset < 1 || card_count + offset > emojis.count)
    }
    var cardRemover: some View{
        return cardCounterAdjuster(by: -1, symbol: "minus.circle")
    }
    var cardAdder: some View{
        return cardCounterAdjuster(by: +1, symbol: "plus.app")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 15)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill(.black).opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}



#Preview {
    ContentView()
}

