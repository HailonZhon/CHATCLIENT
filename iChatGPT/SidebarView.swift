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
    @StateObject private var inputModel = AIChatInputModel() // 输入模型，管理用户输入
    @StateObject private var chatModel = AIChatModel(roomID: ChatRoomStore.shared.lastRoomId()) // 聊天模型，管理聊天数据
    // 侧边栏固定宽度
    let sidebarWidth: CGFloat = 300
    
    var body: some View {
        NavigationView{
            VStack{
                // 嵌入聊天历史列表视图
                ChatHistoryListView(isKeyPresented: $inputModel.isShowAllChatRoom, chatModel: chatModel, onComplete: { roomID in
                    if roomID != chatModel.roomID {
                        chatModel.resetRoom(roomID)
                        chatModel.isScrollListBottom.toggle()
                    }
                })
                Spacer()
                HStack{
                    Image(systemName: "person.crop.square.fill")
                        .resizable()
                        .frame(width: 20,height: 20)
                        .foregroundColor(.blue)
                    // 个人信息按钮
                    Button(action: {
                        isSettingsPresented.toggle()
                    }) {
                        Text("个人信息")
                            .background(Color.clear)
                            .cornerRadius(10)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black) // 根据主题变色
                    }
                    .sheet(isPresented: $isSettingsPresented) {
                        ChatAPISettingView(isKeyPresented: $isSettingsPresented, chatModel: chatModel)
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
