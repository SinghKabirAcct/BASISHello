//
//  ContentView.swift
//  test2
//
//  Created by Kabir Sahai on 3/28/21.
//


import SwiftUI
import AVFoundation

struct ContentView: View {

    class StopWatchManager: ObservableObject {
        
        @Published var secondsElapsed = 0.0
        
        var timer = Timer()
        
        var timerState = "normal"
        
        func start() {
            if(timerState != "started"){
                timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
                    self.secondsElapsed = self.secondsElapsed + 0.01
                    self.timerState = "started"
                }
                playSound()
            }
        }
        func stop() {
            timer.invalidate()
            self.timerState = "normal"
            player?.stop()
        }
    
    }
    
    @ObservedObject var stopWatchManager = StopWatchManager()
    
    var body: some View {
        VStack {
            Text(String(format: "%.2f", stopWatchManager.secondsElapsed))
                .font(.custom("Avenir", size: 40))
                .padding(.top, 200)
                .padding(.bottom, 100)
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

var player: AVAudioPlayer?

func playSound() {
    guard let url = Bundle.main.url(forResource: "ok", withExtension: "mp3") else { return }

    do {
        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try AVAudioSession.sharedInstance().setActive(true)

        /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

        /* iOS 10 and earlier require the following line:
        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

        guard let player = player else { return }

        player.play()

    } catch let error {
        print(error.localizedDescription)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

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
