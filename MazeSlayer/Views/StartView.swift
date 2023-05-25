//
//  StartView.swift
//  MazeSlayer
//
//  Created by Rio Johanes Sumolang on 25/05/23.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    Spacer()
                    
                    Text("Maze Slayer!")
                        .font(.custom("Papyrus", size: 45))
                    
                    Spacer()
                    HStack{
                        NavigationLink {
                            ContentView().navigationBarHidden(true).navigationBarBackButtonHidden(true)
                        } label: {
                            Text("Start")
                        }
                    }
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

