//
//  EndView.swift
//  GuessWho
//
//  Created by gary on 23/10/2020.
//

import SwiftUI

struct EndView: View {
    @EnvironmentObject var coordinator: Coordinator

    var body: some View {
        ZStack {
            Color.appBackground

            VStack {
                Spacer()

                Text("\(coordinator.score) / 10")
                    .foregroundColor(.appText)
                    .font(.appFont(size: 60))

                Text(coordinator.feedback)
                    .foregroundColor(.appText)
                    .font(.appFont(size: 40))
                    .multilineTextAlignment(.center)
                    .padding([.top, .bottom], 30)

                Button(action: home) {
                    Text("HOME")
                        .foregroundColor(.appButtonText)
                        .font(.appFont(size: 30))
                }
                .padding()
                .background(Color.appButtonBackground)
                .cornerRadius(16)

                Spacer()
            }
        }
        .ignoresSafeArea()
    }


    private func home() {
        coordinator.home()
    }
}


// MARK: - Preview

#if DEBUG
struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        EndView()
    }
}
#endif
