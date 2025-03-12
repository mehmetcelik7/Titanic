//
//  ContentView.swift
//  Titanic
//
//  Created by mehmet Çelik on 12.03.2025.
//

import SwiftUI

struct MainView: View {
    @State private var tm: TitanicModel = .init(
        passengerClass: "Second Class",
        sex: "Male",
        age: 18,
        siblingsSpouses: 2,
        parentsChildren: 4,
        fare: 5,
        port: "Cherbourg"
    )
    
    @State private var survival: Bool? = nil
    @State private var showAlert = false
    @State private var survivalRate: Double = -1
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Form {
                    
                    SegmentSectionView(
                        selected: $tm.passengerClass,
                        options: TitanicModel.passengerClasses,
                        sectionTitle: "Passenger Class",
                        prompt: "What passenger class are you ?"
                    )
                    
                  
                    SegmentSectionView(
                        selected: $tm.sex,
                        options: TitanicModel.genders,
                        sectionTitle: "Gender",
                        prompt: "What is your gender"
                    )
                  
                    
                    SliderSectionView(
                        value: $tm.age,
                        sectionTitle: "Age",
                        prompt: "Age: \(tm.age.formatted())",
                        min: 0,
                        max: 120,
                        step: 0.5
                    )
                    
                    
                    SliderSectionView(
                        value: $tm.siblingsSpouses,
                        sectionTitle: "Siblings and Spouses",
                        prompt: "Number of siblings: \(tm.siblingsSpouses.formatted())",
                        min: 0,
                        max: 10,
                        step: 1
                    )
                   
                    SliderSectionView(
                        value: $tm.parentsChildren,
                        sectionTitle: "Parents and Children",
                        prompt: "Number of parents and children \(tm.parentsChildren.formatted())",
                        min: 0,
                        max: 10,
                        step: 1
                    )
                    
                    SliderSectionView(
                        value: $tm.fare,
                        sectionTitle: "Ticket price",
                        prompt: "Ticket and price $\(tm.fare.formatted())",
                        min: 0,
                        max: 600,
                        step: 1
                    )
                    SegmentSectionView(
                        selected: $tm.port,
                        options: TitanicModel.ports,
                        sectionTitle: "Port",
                        prompt: "What port did you embark from?"
                    )
                    
                    
                    
                }
                
                if showAlert {
                    Text("TODO: Sow result about survival")
                }
            }
            .navigationTitle("Surviving the Titanic")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        //TODO:
                        
                    }) {
                        Text("Compute")
                            .bold()
                            .foregroundStyle(.red)
                            .opacity(showAlert ? 0 : 1)
                    }
                }
            }
        }
        
    }
}

#Preview {
    MainView()
}
