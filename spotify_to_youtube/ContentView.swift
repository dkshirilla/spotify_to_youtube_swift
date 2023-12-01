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
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Boobs!")
        }
        .padding()
        
        Button(action: {
            

            // create an instance and retain it
            let oauthswift = OAuth2Swift(
                consumerKey:    SpotifyClientId,
                consumerSecret: SpotifyClientSecret,
                authorizeUrl: "https://accounts.spotify.com/authorize",
                responseType: "code"
            )
            oauthswift.accessTokenBasicAuthentification = true

            guard let codeVerifier = generateCodeVerifier() else {return}
            guard let codeChallenge = generateCodeChallenge(codeVerifier: codeVerifier) else {return}

            let handle = oauthswift.authorize(
                withCallbackURL: "spotify-to-youtube://spotify-to-youtube/",
                scope: "playlist-read-private",
                state:"State01",
                codeChallenge: codeChallenge,
                codeChallengeMethod: "S256",
                codeVerifier: codeVerifier) { result in
                switch result {
                case .success(let (credential, response, parameters)):
                  print(credential.oauthToken)
                  // Do your request
                case .failure(let error):
                  print(error.localizedDescription)
                }
            }
            
                    
        }, label: {
            Text("boobs #2")
        })
    }
}

#Preview {
    ContentView()
}
