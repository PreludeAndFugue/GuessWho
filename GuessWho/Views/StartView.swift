//
//  StartView.swift
//  GuessWho
//
//  Created by gary on 24/10/2020.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var gameFactory: GameFactory
    let start: () -> Void


    var body: some View {
        ZStack {
            Color.appBackground

            VStack {
                Spacer()

                Text("Guess Who?")
                    .foregroundColor(.appText)
                    .font(.appFont(size: 50))

                Image("collage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding([.leading, .trailing], 50)
                    .shadow(color: .black, radius: 20, x: 0, y: 0)

                Spacer()

                Button(action: newGame) {
                    Text("NEW GAME")
                }
                .modifier(AppButton())

                Spacer()
            }
        }
    }


    private func newGame() {
        start()
    }
}


// MARK: - Preview

#if DEBUG
struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(start: {})
    }
}
#endif
