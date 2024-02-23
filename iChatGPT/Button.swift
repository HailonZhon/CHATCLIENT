//
//  Button.swift
//  iChatGPT
//
//  Created by Midnight Maverick on 2024/1/29.
//  Copyright © 2024 37 Mobile Games. All rights reserved.
//
import SwiftUI
import Foundation
// 顶部导航栏
struct TopBarView: View {
    let action1: () -> Void
    let action2: () -> Void
    let action3: () -> Void
    
    var body: some View {
        HStack {
            Button(action: action1) {
                Image(systemName: "line.horizontal.3")
                    .imageScale(.large)
                    .frame(minWidth: 44, minHeight: 44)
            }
            .padding(.leading, 20)
            
            Spacer()
            
            Button(action: action2) {
                Text("ChatGPT-4")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
            }
            
            Spacer()
            
            Button(action: action3) {
                Image(systemName: "pencil.tip.crop.circle.badge.plus")
                    .imageScale(.large)
                    .frame(minWidth: 44, minHeight: 44)
            }
            .padding(.trailing, 20)
        }
    }
}




// 图标按钮
struct IconButton: View {
    let iconName: String
    var iconWeight: Font.Weight = .regular
    let action: () -> Void
    @Environment(\.colorScheme) var colorScheme // 获取当前的主题模式

    var body: some View {
        Button(action: action) {
            Image(systemName: iconName)
                .font(.system(size: 15, weight: iconWeight))
                .frame(width: 34, height: 34)
                .background(Capsule().fill(colorScheme == .dark ? Color.black : Color.white)) // 根据主题模式设置背景颜色
                .foregroundColor(colorScheme == .dark ? .white : .black) // 根据主题模式设置前景色（图标颜色）
        }
    }
}
// 消息输入框
struct MessageTextField: View {
    @Binding var messageText: String
    let actionAudio: () -> Void
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        HStack {
            TextField("消息", text: $messageText)
                .padding(10)
                .background(Capsule().fill(colorScheme == .dark ? Color.black : Color.white))
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .padding(EdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1))
                .frame(minWidth: 0, maxWidth: .infinity)
            // 当输入框为空时，显示音频按钮
            if messageText.isEmpty {
                Button(action: actionAudio) {
                    Image(systemName: "waveform")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                    
                }.padding(.leading, -25) // 使用负边距将音频按钮向左移动
            }
        }
        .overlay(
            Capsule().stroke(Color.gray, lineWidth: 1)
        )
        .padding(.horizontal, 5)
    }
}
