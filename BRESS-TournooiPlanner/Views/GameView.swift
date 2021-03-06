//
//  GameView.swift
//  BRESS-TournooiPlanner
//
//  Created by Bas Buijsen on 06/01/2022.
//

import SwiftUI

struct GameView: View {
    var game : Game
    @Binding var showPopUp : Bool
    
    var body: some View {
        VStack{
            VStack(alignment: .center, spacing: 0, content: {
                HStack{
                    Color.gray.overlay(
                        Text(game.gameStarted ? "Je huidige wedstrijd" : "Je volgende wedstrijd")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                    )
                }.frame(height: 50)
                
                HStack{
                    Color.accentColor.overlay(
                        Text("Wedstrijd #" + String(game.id))
                            .foregroundColor(.white)
                    )
                }.frame(height: 50)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Speler 1:")
                        
                        Text("Speler 2:")
                        
                        Text("Locatie:")
                    }
                    VStack(alignment: .leading){
                        Text("\(game.player1.firstName) \(game.player1.lastName)")
                        
                        Text("\(game.player2.firstName) \(game.player2.lastName)")
                        
                        Text(game.field?.name ?? "Nog geen veld bekend")
                    }.padding(.leading, 20)
                }.padding(15)
                
                if game.gameStarted{
                    HStack{
                        Color.accentColor.overlay(
                            Text("Score")
                                .foregroundColor(.white)
                        )
                    }.frame(height: 50)
                        .padding(0)
                    
                    HStack{
                        Button{
                            self.showPopUp = true
                        } label: {
                            Text("Vul score in")
                                .foregroundColor(Color("ButtonTextBlack"))
                                .padding(5)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                        }.background(Color("ButtonBlack"))
                            .padding(.vertical, 15)
                            .padding(.horizontal, 30)
                    }
                }
            })
            
        }.border(.gray, width: 1)
    }
}
