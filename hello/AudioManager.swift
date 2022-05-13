//
//  AudioManager.swift
//  hello
//
//  Created by Kabir Singh on 5/13/22.
//

import Foundation
import AVFoundation //adding audio import

//Audio Code
var player: AVAudioPlayer?

func playSound() {
    guard let url = Bundle.main.url(forResource: "ok", withExtension: "mp3") else { return }

    do {
        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try AVAudioSession.sharedInstance().setActive(true)

        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

        guard let player = player else { return }

        player.play()

    } catch let error {
        print(error.localizedDescription)
    }
}
