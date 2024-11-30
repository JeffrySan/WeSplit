//
//  ContentView.swift
//  WeSplit
//
//  Created by Jeffry Sandy Purnomo on 30/11/24.
//

import SwiftUI

struct ContentView: View {
	
	@State private var tapCount: Int = 0
	@State private var name: String = ""
	
	var body: some View {
		NavigationStack {
			Form {
				Section {
					TextField("Enter your Name", text: $name)
					Text("Your Name is \(name)")
					Text("Hello, world!")
					Text("Hello, world!")
				}
				Section {
					Text("Hello, world!")
					Text("Hello, world!")
					Text("Hello, world!")
				}
				Button("Tap Count \(tapCount)") {
					tapCount += 1
				}
			}
			.navigationTitle("Swift UI")
			.navigationBarTitleDisplayMode(.inline)
		}
	}
}

#Preview {
	ContentView()
}
