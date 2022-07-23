//
//  MovieItem.swift
//  movie
//
//  Created by Nay Linn on 7/16/22.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct MovieItem: View {
    let movie : Movie!
    
    var body: some View {
        ZStack(alignment: .bottom){
            WebImage(url: URL(string: Consts.POSTER_PATH+movie.poster_path!))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5)) // Fade Transition with duration
                .scaledToFit()
                .frame(alignment: .center)
                .cornerRadius(5)
                .overlay(TextOverlay(movie: movie))
                .shadow(color: Color.gray, radius: 5, x: 1, y: 2)
            
        }
    }
}


struct TextOverlay: View {
    let movie : Movie

    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(1), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient.cornerRadius(5)
            VStack(alignment: .leading) {
                
                Text(movie.title!).lineLimit(2).font(.system(size: 20).bold())
                HStack{
                    Image(systemName: "star.fill").font(.system(size: 12))
                    Text(String(format: "%.1f", movie.vote_average!)).font(.system(size: 15))

                }
                

            }
            .padding()
        }
        .foregroundColor(.white)
    }
}


struct MovieItem_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Movie(forPreview: true)
        MovieItem(movie: movie)
    }
}
