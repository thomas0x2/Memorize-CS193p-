//
//  ContentView.swift
//  Memorize
//
//  Created by Thomas Bollenbach on 08.01.24.
//

import SwiftUI

struct ContentView: View {
    @State var emojis: [String] = ["♠️", "♦️", "♣️", "♥️", "♠️", "♦️", "♣️", "♥️", "♟️", "🎲", "🕯️", "🍷", "🃏", "♟️", "🎲", "🕯️", "🍷", "🃏"]
    var body: some View {
        
        VStack(spacing: 20){
            Text("Memorize!").font(.largeTitle)
            ScrollView{
                cards
            }
            Spacer()
            cardAdjusters
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
    var cardAdjusters: some View{
        HStack{
            halloweenThemer
            classicThemer
            flagsThemer
        }
        .imageScale(.large)
    }
    
    func themeChooser(emojis: [String], name: String, symbol: String) -> some View {
        Button(action:{
            self.emojis = emojis.shuffled()
        }, label:{
            VStack{
                Image(systemName: symbol).font(.largeTitle)
                Text(name)
            }
        })
    }
    var classicThemer: some View{
        return themeChooser(emojis: ["♠️", "♦️", "♣️", "♥️", "♠️", "♦️", "♣️", "♥️", "♟️", "🎲", "🕯️", "🍷", "🃏", "♟️", "🎲", "🕯️", "🍷", "🃏"], name: "Classic", symbol: "heart")
    }
    var halloweenThemer: some View{
        return themeChooser(emojis: ["🩸", "🪞", "🕷️", "🧟‍♂️", "💀", "👻", "🎃", "👹","🩸", "🪞", "🕷️", "🧟‍♂️", "💀", "👻", "🎃", "👹",], name:"Halloween", symbol: "cat")
    }
    var flagsThemer: some View{
        return themeChooser(emojis: ["🏴‍☠️", "🇩🇪", "🇪🇺", "🇫🇷", "🇮🇳", "🇰🇵", "🇺🇸", "🇬🇧", "🇧🇷", "🇨🇳", "🇷🇺", "🏴‍☠️", "🇩🇪", "🇪🇺", "🇫🇷", "🇮🇳", "🇰🇵", "🇺🇸", "🇬🇧", "🇧🇷", "🇨🇳", "🇷🇺"], name:"Flags", symbol: "flag")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 15)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill(.red).opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}



#Preview {
    ContentView()
}

