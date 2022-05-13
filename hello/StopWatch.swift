//
//  Stopwatchmanager.swift
//  hello
//
//  Created by Kabir Singh on 5/13/22.
//

import Foundation

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
