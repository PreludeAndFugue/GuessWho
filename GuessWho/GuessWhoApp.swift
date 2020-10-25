//
//  GuessWhoApp.swift
//  GuessWho
//
//  Created by gary on 23/10/2020.
//

import SwiftUI

@main
struct GuessWhoApp: App {
    private let coordinator: Coordinator
    private let services: Services


    init() {
        let services = Services()
        self.services = services
        self.coordinator = Coordinator(services: services)
    }


    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(coordinator)
        }
    }
}
