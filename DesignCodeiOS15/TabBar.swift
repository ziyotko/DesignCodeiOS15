//
//  TabBar.swift
//  DesignCodeiOS15
//
//  Created by 支天白 on 2022/6/24.
//

import SwiftUI

struct TabBar: View {
    @State var selectedTab: Tab = .home
    @State var selectedTabColor: Color = .teal
    @State var tabItemWidth: CGFloat = 0
    var body: some View {
        //默认Tabview
        //        TabView {
        //            ContentView().tabItem{
        //                Image(systemName: "house")
        //                Text("Learn Now")
        //            }
        //            AccountView().tabItem {
        //                Image(systemName: "magnifyingglass")
        //                Text("Explore")
        //            }
        //        }
        ZStack (alignment: .bottom){
            Group{
                switch selectedTab {
                case .home:
                    ContentView()
                case .explore:
                    AccountView()
                case .notifications:
                    AccountView()
                case .library:
                    AccountView()
                }
            }
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            
            HStack{
                
                ForEach(tabItems) { item in
                    Button {
                        withAnimation (.spring(response: 0.3, dampingFraction: 0.7 )){
                            selectedTab = item.tab
                            selectedTabColor = item.color
                        }
                        
                    } label: {
                        VStack (spacing:0) {
                            Image(systemName: item.icon)
                                .symbolVariant(.fill)
                                .font(.body.bold())
                                .frame(width:44,height: 29)
                            Text(item.text)
                                .font(.caption2)
                                .lineLimit(1)
                        }.frame(maxWidth:.infinity)
                    }
                    .foregroundColor(selectedTab == item.tab ? .primary : .secondary)
                    .blendMode(selectedTab == item.tab ? .overlay : .normal)
                    .overlay(
                        GeometryReader { proxy in
                            Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
                        }
                    )
                    .onPreferenceChange(TabPreferenceKey.self) { value in
                        tabItemWidth = value
                    }
                }
                
            }
            .padding(.horizontal,8)
            .padding(.top,14)
            .frame(height:88,alignment: .top)
            .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 34,style: .continuous))
            .background(
                HStack{
                    if selectedTab == .library { Spacer() }
                    if selectedTab == .explore { Spacer() }
                    if selectedTab == .notifications {
                        Spacer()
                        Spacer()
                    }
                    Circle().fill(selectedTabColor).frame(width: tabItemWidth)
                    if selectedTab == .home { Spacer() }
                    if selectedTab == .notifications { Spacer() }
                    if selectedTab == .explore {
                        Spacer()
                        Spacer()
                    }
                }
                    .padding(.horizontal,8)
            )
            .overlay(
                HStack{
                    if selectedTab == .library { Spacer() }
                    if selectedTab == .explore { Spacer() }
                    if selectedTab == .notifications {
                        Spacer()
                        Spacer()
                    }
                    Rectangle()
                        .fill(selectedTabColor)
                        .frame(width: 28, height: 5)
                        .cornerRadius(3)
                        .frame(width: tabItemWidth)
                        .frame(maxHeight: .infinity,alignment: .top)
                    
                    if selectedTab == .home { Spacer() }
                    if selectedTab == .notifications { Spacer() }
                    if selectedTab == .explore {
                        Spacer()
                        Spacer()
                    }
                }.padding(.horizontal,8)
            )
            .strokeStyle(cornerRadius: 34)
            .frame(maxHeight:.infinity,alignment: .bottom)
            .ignoresSafeArea()
            
        }
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar()
.previewInterfaceOrientation(.portrait)
            TabBar()
                .preferredColorScheme(.dark)
        }
    }
}
