//
//  ContentView.swift
//  MazeSlayer
//
//  Created by Rio Johanes Sumolang on 25/05/23.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene = SKScene(fileNamed: "GameScene.sks")!
    
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
        SpriteView(scene: scene)
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
