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

    public static var sharedInstance = MusicManager()
    private var tracks: [Track] = []

    func setTracks(withNames names: [String]) {

        for name in names {
            let newTrack = Track(fileNamed: name)
            tracks.append(newTrack)
        }
    }

    func playAll(numberOfLoops: Int) {
//        let now = self.tracks[0].avAudioPlayer.deviceCurrentTime

        for track in self.tracks {
            track.avAudioPlayer.numberOfLoops = numberOfLoops
            track.avAudioPlayer.play()
        }
    }

    func muteAll() {

        for track in self.tracks {
            track.avAudioPlayer.volume = 0
        }
    }

    func disableTracks(named names: [String] , withFade fade: Bool) {

        names.forEach { name in
            self.tracks.filter {
                return name == $0.fileName
            }.forEach {
                if fade {
                    while ($0.avAudioPlayer.volume > 0) {
                        $0.avAudioPlayer.volume -= 0.1
                    }
                } else {
                    $0.avAudioPlayer.volume = 0
                }
            }
        }
    }

    func enableTracks(named names: [String], volume: Float, fade: Bool) {

        let status = UserDefaults.standard.bool(forKey: "mute")
        if status {

        } else {
            names.forEach { name in
                self.tracks.filter {
                    return name == $0.fileName
                }.forEach {
                    if fade {
                        while ($0.avAudioPlayer.volume < volume) {
                            $0.avAudioPlayer.volume += 0.001
                        }
                    } else {
                        $0.avAudioPlayer.volume = volume
                    }
                }
            }
        }
    }
}
