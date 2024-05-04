//
//  CharacterView.swift
//  BB Quotes
//
//  Created by Elnura Arzybaeva on 03.05.24.
//

import SwiftUI

struct CharacterView: View {
    let show:String
    let character:Character
    
    
    var body: some View {
        GeometryReader {geo in
            ZStack (alignment: .top) {
                
                Image(show.lowerNoSpaces)
                    .resizable()
                    .scaledToFit()
                ScrollView {
                    VStack {
                        AsyncImage(url: character.images.randomElement())
                        { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }

                            
                    }
                    .frame(width: geo.size.width/1.2, height: geo.size.height/1.7)
                    .cornerRadius(25)
                    .padding(.top,60)
                    
                    VStack(alignment: .leading) {
                        Text(character.name)
                            .font(.largeTitle)
                        
                        Text("Portrayed by:\(character.portrayedBy)")
                            .font(.subheadline)
                        Divider()
                        
                        Text("\(character.name) Info:")
                            .font(.title2)
                        
                        Text("Born:\(character.birthday)")
                        Divider()
                        
                        Text("Occupations:")
                        ForEach(character.occupations, id: \.self) {occupation in
                            Text("• \(occupation)")
                                .font(.subheadline)
                        }
                        Divider()
                        
                        Text("Nicknames:")
                        if character.name.count > 0 {
                            ForEach(character.aliases, id:\.self) {nickname in
                                Text("• \(nickname)")
                                    .font(.subheadline)
                            }
                        }else {
                            Text("None")
                                .font(.subheadline)
                        }
                    }
                    .padding(.leading,40)
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CharacterView(show: Constants.bbName, character: Constants.previewCharacter)
}
