//
//  ContentView.swift
//  WeSplit
//
//  Created by Jeffry Sandy Purnomo on 30/11/24.
//

import SwiftUI

struct ContentView: View {
	
	@State private var checkAmount: Double = 0
	@State private var numberOfPeople: Int = 2
	@State private var tipPercentage: Int = 20
	@FocusState private var amountIsFocused: Bool
	
	let tipPercentages: [Int] = Array(0 ... 100)
	
	var totalPerPerson: Double {
		let tipSelection = Double(tipPercentage)
		
		let tipValue = checkAmount / 100 * tipSelection
		let grandTotal = checkAmount + tipValue
		let amountPerPerson = grandTotal / Double(numberOfPeople)
		
		return amountPerPerson
	}
	
	var grandTotal: Double {
		return checkAmount * (100 + Double(tipPercentage)) / 100
	}
	
	var body: some View {
		NavigationStack {
			Form {
				Section {
					TextField(
						"Amount",
						value: $checkAmount,
						format: .currency(code: Locale.current.currency?.identifier ?? "USD")
					)
					.focused($amountIsFocused)
					.keyboardType(.decimalPad)
				}
				
				Section("How much tip do you want to leave?") {
					Picker("Tip percentage", selection: $tipPercentage) {
						ForEach(tipPercentages, id: \.self) {
							Text($0, format: .percent)
						}
					}
					.pickerStyle(.navigationLink)
				}
				
				Section("Total Amount Check") {
					Text(
						grandTotal,
						format: .currency(code:Locale.current.currency?.identifier ?? "USD"))
				}
				
				Section("Amount per Person") {
					Text(
						totalPerPerson,
						format: .currency(code:Locale.current.currency?.identifier ?? "USD"))
				}
				
				Section {
					Picker("Number of People", selection: $numberOfPeople) {
						ForEach(2 ..< 100, id: \.self) {
							Text("\($0) people")
						}
					}
					.pickerStyle(.navigationLink)
				}
			}
			.navigationTitle("WeSplit")
			.toolbar {
				if amountIsFocused {
					Button("Done") {
						amountIsFocused = false
					}
				}
			}
		}
	}
}

#Preview {
	ContentView()
}
