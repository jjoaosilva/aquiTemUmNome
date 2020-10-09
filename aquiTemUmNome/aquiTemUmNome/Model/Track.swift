//
//  Track.swift
//  aquiTemUmNome
//
//  Created by Larissa Uchoa on 07/10/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import Foundation
import AVFoundation

class Track {

    let fileName: String
    var avAudioPlayer: AVAudioPlayer = AVAudioPlayer()

    init(fileNamed: String) {
        self.fileName = fileNamed
        do {

            let URL: URL = Bundle.main.url(forResource: fileNamed, withExtension: "mp3")!
            try self.avAudioPlayer = AVAudioPlayer(contentsOf: URL)

        } catch {
            fatalError("Invalid URL, AVAudioPlayer not initialized")
        }
    }
}
