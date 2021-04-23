//
//  SwiftUILandmarksApp.swift
//  SwiftUILandmarks
//
//  Created by Tijmen on 22/04/2021.
//

import SwiftUI

@main
struct SwiftUILandmarksApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(modelData)
        }
    }
}
