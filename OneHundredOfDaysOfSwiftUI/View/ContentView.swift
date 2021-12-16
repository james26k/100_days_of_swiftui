//
//  ContentView.swift
//  OneHundredOfDaysOfSwiftUI
//
//  Created by Kohei Hayashi on 2021/12/16.
//

import SwiftUI

struct ContentView: View {
    private let projects = Project.allCases

    var body: some View {
        NavigationView {
            List(projects.indices, id: \.self) { index in
                Text("\(index + 1): \(projects[index].name)")
            }
            .navigationTitle("Project list")
        }
        .navigationViewStyle(StackNavigationViewStyle()) // for breaking constraint
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
