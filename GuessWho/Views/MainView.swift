//
//  ContentView.swift
//  GuessWho
//
//  Created by gary on 23/10/2020.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var coordinator: Coordinator

    var body: some View {
        ZStack {
            Color.appBackground

            if coordinator.state == .start {
                StartView(start: coordinator.start)
                    .transition(transition)
            } else if coordinator.state == .playing {
                QuestionContainerView(question: coordinator.questions[0])
                    .transition(transition)
            } else if coordinator.state == .end {
                EndView()
                    .transition(transition)
            }
        }
        .ignoresSafeArea()
    }


    private var transition: AnyTransition {
        AnyTransition.scale
            .combined(with: AnyTransition.opacity)
    }
}


// MARK: - Preview

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
