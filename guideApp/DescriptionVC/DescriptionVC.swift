//
//  DescriptionVC.swift
//  guideApp
//
//  Created by Жеребцов Данил on 13.08.2021.
//

import UIKit
import AVFoundation

class DescriptionVC: UIViewController {
    
    
    @IBOutlet weak var excursionTitleLabel: UILabel!
    @IBOutlet weak var stageTitleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var playerSlider: UISlider!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var stackLabels: UIStackView!
    @IBOutlet weak var minTimeLabel: UILabel!
    @IBOutlet weak var maxTimeLabel: UILabel!
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var increasePlayBackRateButton: UIButton!
    
    let playImage = UIImage(systemName: "play.fill")
    let pauseImage = UIImage(systemName: "pause.fill")
    
    var excursion: Excursion?
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextView.isEditable = false
        setPlayPauseButtonImage()
        setSwipe()
        setLabelsTime()
        setIncreasePlaybackRateButton()
        
        excursionTitleLabel.text = excursion?.name
        stageTitleLabel.text = excursion?.stages[excursion!.selectedStageSerialNumber].title
        descriptionTextView.text = excursion?.stages[excursion!.selectedStageSerialNumber].description
        
        
        playerSlider.maximumValue = Float(player!.duration)
        playerSlider.value = (excursion?.stages[excursion!.selectedStageSerialNumber].audioFileCurrentTime)!
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerView.layer.cornerRadius = 5
    }
    
    func setSwipe() {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(dismissVC))
        swipe.direction = .down
        stackLabels.addGestureRecognizer(swipe)
    }
    
    func provideModel(excursion: Excursion) {
        self.excursion = excursion
    }
    
    func providePlayer(player: AVAudioPlayer) {
        self.player = player
    }
    
    func setPlayPauseButtonImage() {
        player!.isPlaying ? playPauseButton.setImage(pauseImage, for: .normal) : playPauseButton.setImage(playImage, for: .normal)
    }
    
    func writeAudioFileCurrentTime() {
        excursion?.stages[excursion!.selectedStageSerialNumber].audioFileCurrentTime = Float(player!.currentTime)
    }
    
    
    @objc func dismissVC() {
        writeAudioFileCurrentTime()
        dismiss(animated: true, completion: nil)
    }
   
    @IBAction func dismissButtonAction(_ sender: Any) {
        dismissVC()
    }
    
    @IBAction func stageListButtonAction(_ sender: Any) {
        guard let stageListVC = storyboard?.instantiateViewController(withIdentifier: "StageListVC") as? StageListVC else { return }
        stageListVC.modalPresentationStyle = .fullScreen
        present(stageListVC, animated: true, completion: nil)
    }
    
    func setLabelsTime() {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        guard let formattedMinTime = formatter.string(from: TimeInterval(player!.currentTime)) else { return }
        guard let formattedMaxTime = formatter.string(from: TimeInterval(player!.duration-player!.currentTime)) else { return }
        
        
        switch formattedMinTime.count {
        
        case 1:
            minTimeLabel.text = "00:0\(formattedMinTime)"
        case 2:
            minTimeLabel.text = "00:\(formattedMinTime)"
        default:
            minTimeLabel.text = formattedMinTime
        }
        
        switch formattedMaxTime.count {
        
        case 1:
            maxTimeLabel.text = "00:0\(formattedMaxTime)"
        case 2:
            maxTimeLabel.text = "00:\(formattedMaxTime)"
        default:
            maxTimeLabel.text = formattedMaxTime
        }
    }
    
    func setIncreasePlaybackRateButton() {
        excursion!.isPlayBackRateIncreased ? increasePlayBackRateButton.setTitle("2x", for: .normal) : increasePlayBackRateButton.setTitle("1x", for: .normal)
    }
    
    
    
    
    
    
    
}
