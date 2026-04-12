//
//  ContentView.swift
//  shadow
//
//  Created by Joshue Mosqueda on 4/8/26.
//

import SwiftUI

struct ContentView: View {
    // Change this to set the cat's display name.
    private let catName = "Shadow"

    @State private var isHovering = false
    @State private var isNameVisible = false
    @StateObject private var motionProxy        = WindowMotionProxy()
    @StateObject private var behaviorController = CatBehaviorController()

    var body: some View {
        ZStack {
            Color.clear
            CatView(controller: behaviorController)
                .contextMenu {
                    Button(action: { isHovering.toggle() }) {
                        HStack {
                            Text("Hover")
                            if isHovering { Image(systemName: "checkmark") }
                        }
                    }
                }
            // Name label overlaid in the transparent zone at the top of the sprite,
            // just above the cat's head. Adjust nameBarHeight to nudge up or down.
            VStack {
                Text(catName)
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(.black.opacity(0.55), in: Capsule())
                    .padding(.top, CatAnimationConfig.Render.nameBarHeight)
                    .opacity(isNameVisible ? 1 : 0)
                    .animation(.easeInOut(duration: 0.15), value: isNameVisible)
                Spacer()
            }
        }
        .onHover { isNameVisible = $0 }
        .background(WindowAccessor(isHovering: isHovering, motionProxy: motionProxy))
        .onAppear {
            behaviorController.start(motionProxy: motionProxy)
        }
    }
}
