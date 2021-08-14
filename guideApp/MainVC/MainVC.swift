//
//  ViewController.swift
//  guideApp
//
//  Created by Жеребцов Данил on 11.08.2021.
//

import UIKit
import AVFoundation
import Kingfisher

class MainVC: UIViewController {
    
    var player = AVAudioPlayer()
    
    let defaultImageName = "https://mcleansmartialarts.com/wp-content/uploads/2017/04/default-image-620x600.jpg"
    
    var excursion: Excursion?
    
    let playImage = UIImage(systemName: "play.fill")
    let pauseImage = UIImage(systemName: "pause.fill")
    
    @IBOutlet weak var stageSerialNumberLabel: UILabel!
    @IBOutlet weak var stageTitleLabel: UILabel!
    @IBOutlet weak var playerTitleLabel: UILabel!
    @IBOutlet weak var stageSlider: UISlider!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var xMarkButton: UIButton!
    @IBOutlet weak var optionsButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var increasePlaybackRateButton: UIButton!
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var playerSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentDescriptionVC))
        playerView.addGestureRecognizer(tapGesture)
        
        createPlayer(audioName: (excursion?.stages[excursion!.selectedStageSerialNumber].audioFile)!)
        playerSlider.value = Float(player.currentTime)
        
        stageSerialNumberLabel.text = "Stage \(excursion!.selectedStageSerialNumber+1)/\(excursion!.stages.count)"
        stageTitleLabel.text = excursion?.stages[excursion!.selectedStageSerialNumber].title
        shortDescriptionLabel.text = excursion?.stages[excursion!.selectedStageSerialNumber].shortDescription
        playerTitleLabel.text = excursion?.stages[excursion!.selectedStageSerialNumber].title
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setStageSlider()
        setPlayPauseButtonImage()
        setIncreasePlaybackRateButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        xMarkButton.layer.cornerRadius = xMarkButton.bounds.size.width / 2
        optionsButton.layer.cornerRadius = optionsButton.bounds.size.width / 2
    }
    
    func provideModel(excursion: Excursion) {
        self.excursion = excursion
    }
    
    @objc func presentDescriptionVC() {
        writeAudioFileCurrentTime()
        
        guard let descriptionVC = storyboard?.instantiateViewController(withIdentifier: "DescriptionVC") as? DescriptionVC else { return }
        descriptionVC.provideModel(excursion: self.excursion!)
        descriptionVC.providePlayer(player: player)
        descriptionVC.modalPresentationStyle = .fullScreen
        present(descriptionVC, animated: true, completion: nil)
    }
    
    func createPlayer(audioName: String) {
        do {
            if let audioPath = Bundle.main.path(forResource: audioName, ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                player.enableRate = true
                playerSlider.maximumValue = Float(player.duration)
            }
        } catch {
            print("error")
        }
    }
    
    func writeAudioFileCurrentTime() {
        excursion?.stages[excursion!.selectedStageSerialNumber].audioFileCurrentTime = Float(player.currentTime)
    }

    
    func setPlayPauseButtonImage() {
        player.isPlaying ? playPauseButton.setImage(pauseImage, for: .normal) : playPauseButton.setImage(playImage, for: .normal)
    }
    
    func setIncreasePlaybackRateButton() {
        excursion!.isPlayBackRateIncreased ? increasePlaybackRateButton.setTitle("2x", for: .normal) : increasePlaybackRateButton.setTitle("1x", for: .normal)
    }
    
    func setStageSlider() {
        stageSlider.minimumValue = 0
        stageSlider.maximumValue = Float(excursion!.stages.count)
        stageSlider.value = Float(excursion!.selectedStageSerialNumber)+0.5
    }
    
    
    
    
    
    @IBAction func xMarkButtonAction(_ sender: Any) {
        player.stop()
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func optionsButtonAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Демонтрация навыка создания алертов", message: nil, preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAlertAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    
}

