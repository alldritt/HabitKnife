//
//  SymbolPickerView.swift
//  HabitKnife
//
//  Created by Mark Alldritt on 2025-02-05.
//

import SwiftUI
import SymbolPicker


let DocsGroup = SymbolGroup("Documents", symbols: [
    "doc", "doc.fill", "doc.circle", "doc.circle.fill", "doc.badge.plus", "doc.fill.badge.plus",
    "doc.badge.arrow.up", "doc.badge.arrow.up.fill", "doc.badge.ellipsis", "doc.fill.badge.ellipsis",
    "doc.badge.gearshape", "doc.badge.gearshape.fill", "lock.doc", "lock.doc.fill", "arrow.up.doc",
    "arrow.up.doc.fill", "arrow.down.doc", "arrow.down.doc.fill", "doc.text", "doc.text.fill",
    "doc.zipper", "doc.on.doc", "doc.on.doc.fill", "doc.on.clipboard", "arrow.right.doc.on.clipboard",
    "arrow.up.doc.on.clipboard", "arrow.triangle.2.circlepath.doc.on.clipboard", "doc.on.clipboard.fill",
    "clipboard", "clipboard.fill", "list.bullet.clipboard", "list.bullet.clipboard.fill",
    "list.clipboard", "list.clipboard.fill", "doc.richtext", "doc.richtext.fill", "doc.plaintext",
    "doc.plaintext.fill", "doc.append", "doc.append.fill", "doc.text.below.ecg",
    "doc.text.below.ecg.fill", "chart.bar.doc.horizontal", "chart.bar.doc.horizontal.fill",
    "list.bullet.rectangle.portrait", "list.bullet.rectangle.portrait.fill", "doc.text.magnifyingglass",
])


struct SymbolPickerView: View {
    @State private var icon = "star.fill"
    @State private var isPresented = false
    
    var body: some View {
        Button {
            isPresented.toggle()
        } label: {
            Label("Select symbol", systemImage: icon)
                .font(.title)
        }
        .sheet(isPresented: $isPresented) {
            SymbolPicker(symbol: $icon, symbolGroup: DocsGroup)
        }
    }
}

#Preview {
    SymbolPickerView()
}
