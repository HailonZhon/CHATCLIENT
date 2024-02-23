//
//  SidebarView.swift
//  iChatGPT
//
//  Created by hailong on 2024/2/23.
//  Copyright © 2024 37 Mobile Games. All rights reserved.
//

import SwiftUI

struct SidebarView: View {
    @State private var isAlertPresented = false
    @Environment(\.colorScheme) var colorScheme // 获取当前主题模式
    @State private var isSettingsPresented: Bool = false // 控制设置视图是否显示
    // 侧边栏固定宽度
    let sidebarWidth: CGFloat = 300

    var body: some View {
        NavigationView{
            VStack{
                
                Spacer()
                HStack{
                    Image(systemName: "person.crop.square.fill")
                        .resizable()
                        .frame(width: 20,height: 20)
                        .foregroundColor(.blue)
                    // 个人信息按钮
                    Button(action: {
                       // 当按钮被点击时，显示弹窗
//                        self.isAlertPresented = true
                        isSettingsPresented.toggle()
                    }) {
                       Text("个人信息")
                            .background(Color.clear)
                            .cornerRadius(10)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black) // 根据主题变色
                    }
                    Spacer()
                }
                .padding(.horizontal,30)
            }.frame(width: sidebarWidth) // 设置固定宽度
        }.frame(width: sidebarWidth) // 为NavigationView也设置固定宽度
    }
}

#Preview {
    SidebarView()
}
