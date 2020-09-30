//
//  MusicManager.swift
//  aquiTemUmNome
//
//  Created by Larissa Uchoa on 30/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class MusicManager {
    private var audioPlayer: AVAudioPlayer? = AVAudioPlayer()
    private var isPlaying = false
    public static let shared = MusicManager()

    func playIntro() {
        let sound = Bundle.main.path(forResource: "aquiTemUmaIntro", ofType: "mp3")

        if self.isPlaying {
            stopMusic()
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                self.isPlaying = true
                self.audioPlayer?.numberOfLoops = 999999
                self.audioPlayer?.play()
            } catch {
                print(error)
            }
        } else {
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                self.isPlaying = true
                self.audioPlayer?.numberOfLoops = 999999
                self.audioPlayer?.play()
            } catch {
                print(error)
            }
        }

        let status = UserDefaults.standard.bool(forKey: "mute")
        if status {
            self.audioPlayer?.setVolume(0.0, fadeDuration: 0)
            stopMusic()
        } else {
            self.audioPlayer?.setVolume(1.0, fadeDuration: 0)
        }
    }

    func playEasyMusic() {
        let sound = Bundle.main.path(forResource: "aquiTemUmaMusicaFacil", ofType: "mp3")

        if self.isPlaying {
            stopMusic()
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                self.isPlaying = true
                self.audioPlayer?.numberOfLoops = 999999
                self.audioPlayer?.play()
            } catch {
                print(error)
            }
        } else {
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                self.isPlaying = true
                self.audioPlayer?.numberOfLoops = 999999
                self.audioPlayer?.play()
            } catch {
                print(error)
            }
        }

        let status = UserDefaults.standard.bool(forKey: "mute")
        if status {
            self.audioPlayer?.setVolume(0.0, fadeDuration: 0)
            stopMusic()
        } else {
            self.audioPlayer?.setVolume(1.0, fadeDuration: 0)
        }
    }

    func playMediumMusic() {
        let sound = Bundle.main.path(forResource: "aquiTemUmaMusicaMedia", ofType: "mp3")

        if self.isPlaying {
            stopMusic()
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                self.isPlaying = true
                self.audioPlayer?.numberOfLoops = 999999
                self.audioPlayer?.play()
            } catch {
                print(error)
            }
        } else {
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                self.isPlaying = true
                self.audioPlayer?.numberOfLoops = 999999
                self.audioPlayer?.play()
            } catch {
                print(error)
            }
        }

        let status = UserDefaults.standard.bool(forKey: "mute")
        if status {
            self.audioPlayer?.setVolume(0.0, fadeDuration: 0)
            stopMusic()
        } else {
            self.audioPlayer?.setVolume(1.0, fadeDuration: 0)
        }
    }

    func playGameOver() {
        let sound = Bundle.main.path(forResource: "aquiTemUmGameOver", ofType: "mp3")

        if self.isPlaying {
            stopMusic()
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                self.isPlaying = true
                self.audioPlayer?.numberOfLoops = 999999
                self.audioPlayer?.play()
            } catch {
                print(error)
            }
        } else {
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                self.isPlaying = true
                self.audioPlayer?.numberOfLoops = 999999
                self.audioPlayer?.play()
            } catch {
                print(error)
            }
        }

        let status = UserDefaults.standard.bool(forKey: "mute")
        if status {
            self.audioPlayer?.setVolume(0.0, fadeDuration: 0)
            stopMusic()
        } else {
            self.audioPlayer?.setVolume(1.0, fadeDuration: 0)
        }
    }

    func stopMusic() {
        self.audioPlayer?.stop()
        self.audioPlayer?.currentTime = 0
        self.isPlaying = false
        self.audioPlayer = nil
    }

    func getCurrentTime() -> TimeInterval {
        return self.audioPlayer?.currentTime ?? 0
    }
}
