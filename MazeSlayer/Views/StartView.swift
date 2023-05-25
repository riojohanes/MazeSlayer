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
                    HStack{
                        Spacer()
                        Button {
                            
                        } label: {
                            Image("ButtonSound").resizable().frame(width: 60, height: 60)
                        }
                        Button {
                            
                        } label: {
                            Image("ButtonSetting").resizable().frame(width: 60, height: 60)
                        }
                    }
                    
                    Spacer()
                    
                    Text("Maze Slayer!")
                        .font(.custom("Papyrus", size: 28))
                        .background(Image("ButtonRect").resizable().frame(width: 250, height: 100))
                        .foregroundColor(.white)
                        .padding(10)
                    
                    Spacer()
                    HStack{
                        NavigationLink {
                            ContentView().navigationBarHidden(true).navigationBarBackButtonHidden(true)
                        } label: {
                            Text("Start")
                                .font(.custom("Papyrus", size: 18))
                                .background(Image("ButtonHex").resizable().frame(width: 120, height: 45)).foregroundColor(.white)
                        }
                    }
                }
            }//ZStack
            .frame(width: 800, height: 300, alignment: .center)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .background(Image("3436").resizable().frame(width: 1334, height: 500))
        }//NaviView
        .navigationViewStyle(StackNavigationViewStyle())
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

