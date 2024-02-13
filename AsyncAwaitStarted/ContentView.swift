//
//  ContentView.swift
//  AsyncAwaitStarted
//
//  Created by joe on 2/8/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var currentDateListVM = CurrentDateListViewModel()
    
    var body: some View {
        NavigationView {
            List(currentDateListVM.currentDates, id: \.id) { currentDate in
                Text(currentDate.date)
            }.listStyle(.plain)
            
            .navigationTitle("Dates")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        async {
                            await currentDateListVM.populateDates()
                        }
                    }, label: {
                        Image(systemName: "arrow.clockwise.circle")
                    })
                }
            }
            .task {
                await currentDateListVM.populateDates()
            }
        }
    }
}

#Preview {
    ContentView()
}
