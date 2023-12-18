//
//  ContentView.swift
//  spotify_to_youtube
//
//  Created by Douglas Shirilla on 11/26/23.
//

import SwiftUI
import OAuth2
import OAuthSwift

struct ContentView: View {
    @State private var isAuthorized = false
    var oauthswift = OAuth2Swift(
        consumerKey:    SpotifyClientId,
        consumerSecret: SpotifyClientSecret,
        authorizeUrl:   "https://accounts.spotify.com/authorize",
        accessTokenUrl: "https://accounts.spotify.com/api/token",
        responseType:   "code"
    )
    var body: some View {
        
        VStack {
            
            Button(action: {
                var handle = self.oauthswift.authorize(
                    withCallbackURL: "spotify-to-youtube://spotify-to-youtube/",
                    scope: "playlist-read-private", state:"State01") { result in
                        switch result {
                        case .success(let (credential, response, _)):
                            print(credential.oauthToken)
                            // Do your request
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                
            }, label: {
                Text("Sign into Spotify")
            })
        }
        .padding()
    }
    
}
