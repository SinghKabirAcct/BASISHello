//
//  ContentView.swift
//  test2Menu(/*@START_MENU_TOKEN@*/"Menu"/*@END_MENU_TOKEN@*/) {
//
//  Created by Kabir Sahai on 3/28/21.
//


import SwiftUI //adding base import

//This will hold all View Data
struct ContentView: View {
    
    //Observed Var because View needs to watch elapsed value for updates
    @ObservedObject var stopWatchManager = StopWatchManager()
    
    var body: some View {
        
        //Vertical Stack for View
        VStack {
            Text(String(format: "%.2f", stopWatchManager.secondsElapsed))
                .font(.custom("Avenir", size: 40))
                .padding(.top, 150)
                .padding(.bottom, 75)
                Button(action: {self.stopWatchManager.start()}) {
                    TimerButton(label: "Start", buttonColor: .black, textCol: .white)
                }
                Button(action: {self.stopWatchManager.stop()}) {
                    TimerButton(label: "Stop", buttonColor: .white, textCol: .black)
                }
            Spacer()
        }
    }
}
    
//Buttom styling code for Content View
struct TimerButton: View {
    
    let label: String
    let buttonColor: Color
    let textCol: Color
    
    var body: some View {
        Text(label)
            .foregroundColor(textCol)
            .padding(.vertical, 20)
            .padding(.horizontal, 90).overlay(RoundedRectangle(cornerRadius: 10).stroke(textCol))
            .background(buttonColor).cornerRadius(10)
    }
}

//Preview Code
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
