//
//  ProjetoAppleApp.swift
//  ProjetoApple
//
//  Created by found on 04/07/25.
//

import SwiftUI
import SwiftData


@main
struct ProjetoAppleApp: App {
    var body: some Scene {
        WindowGroup {
            MenuView()
            .modelContainer(for: [Problems.self])
        }
    }
}
