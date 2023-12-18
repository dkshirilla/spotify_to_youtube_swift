//
//  spotify_to_youtubeApp.swift
//  spotify_to_youtube
//
//  Created by Douglas Shirilla on 11/26/23.
//

import SwiftUI
import OAuthSwift

@main
struct spotify_to_youtubeApp: App {
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
                .onOpenURL(perform: {url in
                    if url.host == "spotify-to-youtube" {
                        OAuthSwift.handle(url:url)
                    }
                })
        }
    }
}
