//
//  PhotoAnswerView.swift
//  GuessWho
//
//  Created by gary on 24/10/2020.
//

import SwiftUI

struct PhotoAnswerView: View {
    @EnvironmentObject var coordinator: Coordinator
    @ObservedObject var viewModel: PhotoAnswerViewModel
    @Binding var isAnswered: Bool

    var body: some View {
        ZStack {
            VStack {
                Text(viewModel.name)
                    .font(.appFont(size: 40))

                Image(systemName: viewModel.imageName)
                    .foregroundColor(viewModel.imageColour)
                    .font(.appFont(size: 60))
                    .padding([.top, .bottom], 20)

                Button(action: next) {
                    Text("Next")
                        .font(.appFont(size: 30))
                        .foregroundColor(.appButtonText)
                }
                .padding()
                .background(Color.appButtonBackground)
                .cornerRadius(16)
            }
            .frame(width: 350, height: 280)
            .background(Color.appPhotoBackground)
            .cornerRadius(20)
            .rotation3DEffect(
                .degrees(viewModel.angle2),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )

            viewModel.photo
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 280)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .opacity(viewModel.opacity)
                .rotation3DEffect(
                    .degrees(viewModel.angle1),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
        }
        .onChange(of: isAnswered, perform: { value in
            viewModel.showAnswer()
        })
    }


    private func next() {
        print("next")
        coordinator.nextQuestion()
    }
}


// MARK: - Preview

#if DEBUG
struct PhotoAnswerView_Previews: PreviewProvider {
    static let question = Question(
        number: 3,
        answers: [.morven, .caoimhe, .saoirse],
        photo: Photo(path: "m04", girl: .morven)
    )
    static let vm1 = PhotoAnswerViewModel(question: question)
    static let vm2 = PhotoAnswerViewModel(question: question)

    static var previews: some View {
        Group {
            PhotoAnswerView(viewModel: vm1, isAnswered: .constant(false))
            PhotoAnswerView(viewModel: vm2, isAnswered: .constant(true))
        }
        .previewLayout(.sizeThatFits)
    }
}
#endif
