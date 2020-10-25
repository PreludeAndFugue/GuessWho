//
//  QuestionAnswerView.swift
//  GuessWho
//
//  Created by gary on 23/10/2020.
//

import SwiftUI

struct QuestionAnswerView: View {
    let girl: Girl
    @Binding var isAnswered: Bool
    let action: (Girl) -> Void

    @State private var isSelected = false

    var body: some View {
        Button(action: selectGirl) {
            HStack {
                Text(girl.name)
                    .foregroundColor(.appText)
                    .font(.appFont(size: 30))
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.appText)
                        .font(.appFont(size: 30))
                } else {
                    Image(systemName: "circle")
                        .foregroundColor(.appText)
                        .font(.appFont(size: 30))
                }
            }
        }
        .padding()
    }


    private func selectGirl() {
        if isAnswered { return }
        isSelected = true
        action(girl)
    }
}


// MARK: - Preview

#if DEBUG
struct QuestionAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionAnswerView(
            girl: .caoimhe,
            isAnswered: .constant(false),
            action: { _ in }
        )
        .previewLayout(.sizeThatFits)
    }
}
#endif
