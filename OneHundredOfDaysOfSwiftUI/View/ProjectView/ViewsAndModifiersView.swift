//
//  ViewsAndModifiersView.swift
//  OneHundredOfDaysOfSwiftUI
//
//  Created by Kohei Hayashi on 2022/01/04.
//

import SwiftUI

struct ViewsAndModifiersView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello World")
                .modifier(Title(color: .yellow))

            Text("Hello")
                .titleStyle(color: .red)

            Color.blue
                .frame(width: 300, height: 200)
                .watermarked(with: "Hacking with Swift")
        }
        .navigationTitle(Project.viewsAndModifiers.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
// MARK: - custom modifier
private struct Title: ViewModifier {
    var color: Color

    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(color)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

private struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}
// MARK: - extension
private extension View {
    func titleStyle(color: Color) -> some View {
        modifier(Title(color: color))
    }
}

private extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}
// MARK: - preview
struct ViewsAndModifiersView_Previews: PreviewProvider {
    static var previews: some View {
        ViewsAndModifiersView()
    }
}
