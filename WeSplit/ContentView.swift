//
//  ContentView.swift
//  WeSplit
//
//  Created by Jeffry Sandy Purnomo on 30/11/24.
//

import SwiftUI

struct ContentView: View {
	
	let students: [String] = ["Harry", "Hermonie", "Ron"]
	@State private var selectedStudent: String = "Harry"
	
	var body: some View {
		NavigationStack {
			Form {
				Picker("Select your student", selection: $selectedStudent) {
					ForEach(students, id: \.self) {
						Text($0)
					}
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
