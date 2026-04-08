//
//  shadowApp.swift
//  shadow
//
//  Created by Joshue Mosqueda on 4/8/26.
//

import SwiftUI

@main
struct shadowApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 220, minHeight: 220)
        }
        .defaultSize(width: 360, height: 360)
        .windowResizability(.contentSize)
        .commands {
            CommandGroup(replacing: .newItem) { }
        }
    }
}
