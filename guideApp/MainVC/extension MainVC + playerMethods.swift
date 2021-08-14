//
//  extension MainVC + playerMethods.swift
//  guideApp
//
//  Created by Жеребцов Данил on 12.08.2021.
//

import Foundation
import AVFoundation

extension MainVC {
    
    @IBAction func playPauseButtonAction(_ sender: Any) {
        if player.isPlaying {
            player.pause()
        } else {
            player.play()
        }
        setPlayPauseButtonImage()
    }
    
    @IBAction func playerSliderAction(_ sender: Any) {
        player.currentTime = TimeInterval(playerSlider.value)
    }
    
    @IBAction func goBackward(_ sender: Any) {
        player.currentTime -= 5
        updateTime()
    }
    
    @IBAction func goForward(_ sender: Any) {
        player.currentTime += 5
        updateTime()
    }

    @objc func updateTime() {
        playerSlider.value = Float(player.currentTime)
        setPlayPauseButtonImage()
    }
    
    @IBAction func increasePlaybackRateButtonAction(_ sender: Any) {
        excursion?.isPlayBackRateIncreased.toggle()
        if excursion!.isPlayBackRateIncreased {
            player.rate = 2.0
        } else {
            player.rate = 1.0
        }
        setIncreasePlaybackRateButton()
    }
}
