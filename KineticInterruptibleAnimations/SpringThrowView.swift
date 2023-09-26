//
//  SpringThrowView.swift
//  KineticInterruptibleAnimations
//
//  Created by Ramill Ibragimov on 9/26/23.
//

import SwiftUI
import Wave

struct SpringThrowView: View {

    @State var offset: CGSize = .zero
    @State var offsetAnimator = SpringAnimator<CGSize>(spring: .defaultAnimated)

    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(.blue)
            .frame(width: 100, height: 100)
            .offset(offset)
            .gesture(dragGesture)
            .onAppear() {
                offsetAnimator.value = offset
                offsetAnimator.valueChanged = { value in
                    offset = value
                }
            }
    }
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                offsetAnimator.target = value.translation
                offsetAnimator.mode = .nonAnimated
                offsetAnimator.start()
            }
            .onEnded { value in
                offsetAnimator.target = .zero
                offsetAnimator.mode = .animated
                offsetAnimator.start()
            }
    }
}

#Preview {
    SpringThrowView()
}
