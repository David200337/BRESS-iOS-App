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
                        Text(game.player1.name)
                        
                        Text(game.player2.name)
                        
                        Text(game.field.name)
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
                                .foregroundColor(Color.white)
                                .padding(5)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                        }.background(.black)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 30)
                    }
                }
            })
            
        }.border(.gray, width: 1)
    }
}
