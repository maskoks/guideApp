//
//  extension DescriptionVC + playerMethods.swift
//  guideApp
//
//  Created by Жеребцов Данил on 13.08.2021.
//

import Foundation
import UIKit

extension DescriptionVC {
    
    @IBAction func playPauseButtonAction(_ sender: Any) {
        
        if player!.isPlaying {
            player!.pause()
        } else {
            player!.play()
        }
        setPlayPauseButtonImage()
        writeAudioFileCurrentTime()
    }
    
    
    
    @IBAction func goForwardButtonAction(_ sender: Any) {
        player!.currentTime += 5
        updateTime()
    }
    
    
    @IBAction func goBackwardButtonAction(_ sender: Any) {
        player!.currentTime -= 5
        updateTime()
    }
    
    @IBAction func playerSliderAction(_ sender: Any) {
        player?.currentTime = TimeInterval(playerSlider.value)
        player?.play()
        setPlayPauseButtonImage()
    }
    
    @objc func updateTime() {
        playerSlider.value = Float(player!.currentTime)
        setLabelsTime()
        setPlayPauseButtonImage()
    }
    
    @IBAction func increasePlayBackRateButtonAction(_ sender: Any) {
        excursion?.isPlayBackRateIncreased.toggle()
    
        if excursion!.isPlayBackRateIncreased {
            player!.rate = 2.0
        } else {
            player!.rate = 1.0
        }
        setIncreasePlaybackRateButton()
    }
    
    
    
}
