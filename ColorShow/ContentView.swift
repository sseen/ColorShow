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
    let sp = CGFloat(1)
    let gsp = CGFloat(0.5)
    private var columns: [GridItem] {Array(repeating: GridItem(spacing:0), count: 3)}
    
    let colorPa:[UInt] = [0x000000,0x111111,0x222222,0x333333,
                          0x444444,0x555555,0x666666,0x777777,
                          0x888888,0x999999,0xaaaaaa,0xbbbbbb,
                          0xcccccc,0xdddddd,0xeeeeee,0xffffff
    ]
    
    var body: some View {
        GeometryReader { gp in
            ScrollView {
                LazyVGrid(
                    columns: columns,
                    alignment: .center,
                    spacing: 1,
                    pinnedViews: [.sectionHeaders, .sectionFooters]
                ) {
                    ForEach(0...15, id: \.self) { indexj in
                        
                        Section(header: Text("Section \(String(format:"%02X", colorPa[indexj]))").font(.title)) {
                            ForEach(0...15, id: \.self) { index in
                                ZStack {
                                    Text("昨日出风的你的很好的哈\(String(format:"%02X", colorPa[index]))")
                                        .foregroundColor(Color(hex: colorPa[index]))
                                        .padding()
                                }
                                .id(UUID())
                                .frame(width:(gp.size.width - 2*sp) / 3,
                                       height: (gp.size.width - 2*sp) / 3)
                                .background(Color(hex: colorPa[15-indexj]))
                            }
                        }.id(UUID())
                    }
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
