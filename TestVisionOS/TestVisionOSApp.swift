//
//  TestVisionOSApp.swift
//  TestVisionOS
//
//  Created by Alexandru Jilavu on 04.02.2024.
//

import SwiftUI

@main
struct TestVisionOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
