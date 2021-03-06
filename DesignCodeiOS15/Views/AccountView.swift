//
//  AccountView.swift
//  DesignCodeiOS15
//
//  Created by 支天白 on 2022/6/22.
//

import SwiftUI

struct AccountView: View {
    @State var isDelete = false
    var body: some View {
        NavigationView {
            List {
                profile
               
                menu
                
                links
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
    
    var profile: some View {
        VStack (spacing: 8){
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    Image(systemName: "hexagon")
                        .symbolVariant(.fill)
                        .foregroundColor(.blue)
                        .font(.system(size :200))
                        .offset(x: -50, y: -100)
                )
            Text("Zhi Tian Bai")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.small)
                    .foregroundColor(.secondary)
                Text("China")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu : some View {
        Section {
            NavigationLink(destination: HomeView()){
                Label("Settings",systemImage: "gear")
                
            }
            NavigationLink { Text("Billing")} label: {
                Label("Billing",systemImage: "creditcard")
            }
            NavigationLink { HomeView()} label: {
                Label("Help",systemImage: "questionmark")
            }
        }
        .accentColor(.primary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
    }
    
    var links: some View {
        Section {
            if !isDelete{
                Link(destination: URL(string: "https://apple.com")! ){
                    HStack {
                        Label("Website",systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true){
                    Button { isDelete = true} label: {
                        Label("Delete",systemImage: "trash")
                    }
                    .tint(.red)
                }
            }
            Link(destination: URL(string: "https://bilibili.com")! ){
                HStack {
                    Label("Bilibili",systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }
            
        }
        .accentColor(.primary)
        .listRowSeparator(.hidden)

    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
