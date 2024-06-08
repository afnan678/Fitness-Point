//
//  YogaMusicVC.swift
//  Fitness Point
//
//  Created by Afnan Ahmed on 01/01/2024.
//

import UIKit
import AVFoundation

class YogaMusicVC: UIViewController  {
    
    @IBOutlet weak var musicTV: UITableView!
    var audioPlayer: AVAudioPlayer!
    var timer: Timer!
    var totalTime: Int!
    
    var music = ["Rain", "Heaven", "Birds Singing", "Om Chanting"]
    var songs = ["Play1","Play2","Play3","Play4"]
    var players: [AVAudioPlayer?] = Array(repeating: nil, count: 4)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setupTV()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func setupAudioPlayer(name: String) {
        if let audioPath = Bundle.main.path(forResource: name, ofType: "mp3") {
            let audioURL = URL(fileURLWithPath: audioPath)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
                audioPlayer.delegate = self
                audioPlayer.prepareToPlay()
                totalTime = Int(audioPlayer.duration)
            } catch {
                print("Error loading audio file: \(error.localizedDescription)")
            }
        } else {
            print("Audio file not found.")
        }
    }
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer.invalidate()
    }
    
    @objc func updateTimeLabel() {
        if audioPlayer.isPlaying {
            totalTime -= 1
            let minutes = totalTime / 60
            let seconds = totalTime % 60
            //                currentTimeLabel.text = String(format: "%02d:%02d", minutes, seconds)
            print(String(format: "%02d:%02d", minutes, seconds))
            
            //                cellToUpdateIndex = IndexPath(row: 0, section: 0) // Update with your desired index path
            
            // Check if the index path is valid and visible
            // Update the label content in the specific cell
            // Replace this with your own logic to update the label
        }
        
        if totalTime == 0 {
            stopTimer()
        }
    }
}
    

extension YogaMusicVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTV()
    {
        musicTV.delegate = self
        musicTV.dataSource = self
        musicTV.register(UINib(nibName: "SongsTVC", bundle: .main), forCellReuseIdentifier: "SongsTVC")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return music.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongsTVC", for: indexPath) as! SongsTVC
        cell.titleLBL.text = music[indexPath.row]
        cell.playBtn.setImage(UIImage(named: "Play"), for: .normal)
        cell.buttonTappedCallback = { [self] in
            if cell.playBtn.imageView?.image == UIImage(named: "Play")
            {
                cell.playBtn.setImage(UIImage(named: "Pause"), for: .normal)
                playPauseSong(at: indexPath.row)
            }
            else
            {
                cell.playBtn.setImage(UIImage(named: "Play"), for: .normal)
                playPauseSong(at: indexPath.row)
            }
            
         }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
    func playPauseSong(at index: Int) {
        guard let url = Bundle.main.url(forResource: songs[index], withExtension: "mp3") else {
            print("Could not find the file: \(songs[index]).mp3")
            return
        }

        if players[index]?.isPlaying == true {
            players[index]?.pause()
        } else {
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)

                if players[index] == nil {
                    players[index] = try AVAudioPlayer(contentsOf: url)
                    players[index]?.delegate = self
                }

                if let player = players[index] {
                    player.play()
                }
            } catch let error {
                print("Audio playback error: \(error.localizedDescription)")
            }
        }
    }

    // MARK: - Button Action

    @objc func playPauseButtonTapped(_ sender: UIButton) {
        playPauseSong(at: sender.tag)
    }
    
    
}

extension YogaMusicVC: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        // Handle audio playback finished event, if needed
    }
}
