//
//  ContentView.swift
//  ColorShow
//
//  Created by solo on 2021/4/3.
//

import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

struct ContentView: View {
    private var columns: [GridItem] = [
        GridItem(.fixed(100), spacing: 16),
        GridItem(.fixed(100), spacing: 16),
        GridItem(.fixed(100), spacing: 16)
    ]
    let colorPa:[UInt] = [0x000000,0x111111,0x222222,0x333333,
                          0x444444,0x555555,0x666666,0x777777,
                          0x888888,0x999999,0xaaaaaa,0xbbbbbb,
                          0xcccccc,0xdddddd,0xeeeeee,0xffffff
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 16,
                pinnedViews: [.sectionHeaders, .sectionFooters]
            ) {
                ForEach(0...15, id: \.self) { index in
                
                    Section(header: Text("Section \(colorPa[index])").font(.title)) {
                        ForEach(0...15, id: \.self) { index in
                            ZStack {
                                Text("昨日出风的你的很好的哈")
                                    .foregroundColor(Color(hex: colorPa[index]))
                                    .padding()
                            }
                            .id(UUID())
                            .background(Color.black)
                        }
                    }.id(UUID())
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
