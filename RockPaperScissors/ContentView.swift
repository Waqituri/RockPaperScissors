//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Waqar Hussain on 31/12/2024.
//

import SwiftUI

struct ContentView: View {
    var appChoice = ["Rock", "Paper", "Scissors"]
    @State private var gameOver = false
    @State private  var shouldWin = Bool.random()
    @State private  var gamechoice = Int.random(in: 0...2)
    @State private var score = 0
    @State private var questionCount = 0
    
    
    var body: some View {
        VStack {
            VStack (spacing: 10){
                Text("The app choses")
                    .font(.title3.bold())
                
                Text(appChoice[gamechoice])
                    .font(.largeTitle.bold())
            }
                    .padding(.horizontal, 100)
                    .padding(.vertical, 20)
                    .background(Color.brown)
                    .foregroundStyle(.white)
                    
                Text(shouldWin ? "Your goal: \"Win\"" : "Your goal: \"Lose\"")
                    .font(.title.italic().bold())
                    .padding(.horizontal, 60)
                    .padding(.vertical, 20)
                    .background(Color.green)
            
         
            
                HStack{
                    ForEach(0..<3){number in
                        Button { choiceTapped(number)
                        }
                        label: {Image(appChoice[number])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                               }
                    }
                    
            }
                .padding(30)
            Text("Your Score = \(score)")
        }
        .alert("Game Over", isPresented: $gameOver)
        {
            Button ("Continue", action: reset)
        }
        message : {
            Text( "Your score is \(score)")
        }
    }
    func choiceTapped ( _ playerChoice: Int) {
        let winGame = [ 1, 2, 0 ]
        if shouldWin {
            if winGame[gamechoice] == playerChoice {
                score += 1
            }
            else {
                score
            }
            
        }
        else {
            if winGame[playerChoice] == gamechoice {
                score += 1
            }
            else {
                score
            }
        }
        questionCount += 1
        nextRound()
        }
    func nextRound (){
        if questionCount == 10 {
            gameOver = true
        }
        else{
            gamechoice = Int.random(in: 0...2)
            shouldWin.toggle()
//            questionCount += 1
        }
        }
    func reset () {
        questionCount = 0
        gamechoice = Int.random(in: 0...2)
        shouldWin = Bool.random()
        score = 0
    }
    }


#Preview {
    ContentView()
}
