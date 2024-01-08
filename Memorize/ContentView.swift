//
//  ContentView.swift
//  Memorize
//
//  Created by Thomas Bollenbach on 08.01.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
        }
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(lineWidth: 2)
                Text("♠️").font(.largeTitle)
            }
            else{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.black)
            }
        }
    }
}



#Preview {
    ContentView()
}

