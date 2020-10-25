//
//  EndView.swift
//  GuessWho
//
//  Created by gary on 23/10/2020.
//

import SwiftUI

struct EndView: View {
    @EnvironmentObject var coordinator: Coordinator
    @State var showResults = false

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

                Button(action: results) {
                    Text("RESULTS")
                        .foregroundColor(.appButtonText)
                        .font(.appFont(size: 30))
                }
                .padding()
                .background(Color.appButtonBackground)
                .cornerRadius(16)
                .padding(.bottom, 20)

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
        .sheet(isPresented: $showResults) {
            ResultsView(questions: coordinator.questions)
        }
    }


    private func results() {
        showResults = true
    }


    private func home() {
        coordinator.home()
    }
}


// MARK: - Preview

#if DEBUG
struct EndView_Previews: PreviewProvider {
    static let services = Services()
    static let coordinator = Coordinator(services: services)

    static var previews: some View {
        EndView()
            .environmentObject(coordinator)
    }
}
#endif
