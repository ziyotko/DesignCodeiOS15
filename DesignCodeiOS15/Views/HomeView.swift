//
//  HomeView.swift
//  DesignCodeiOS15
//
//  Created by 支天白 on 2022/6/26.
//

import SwiftUI
import Alamofire
struct HomeView: View {
    @State var hasScrolled = false
    
    
    init() {
        
        loadMoarData()
    }
    
    func loadMoarData(){
            let urlString = "https://www.megawise.cn/mw/api/industry/information/informationList"
//            let parameters:[String : Any] = [:]
            
            SwiftNetWorkManager.sharedInstance.getRequest(urlString, params: nil, success: { (dictResponse) in
                let loaclData = dictResponse as Data
                do {
                     let  dataModel1 = try JSONDecoder().decode(Welcome.self, from: loaclData)
                    
                    print(dataModel1.data[0].information.inforTitle)
                } catch {
                    print("error")
                    debugPrint(error)
                }
            }) { (error) in
                if error._code == NSURLErrorTimedOut {
                } else {
                }
            }
        }

    
   
    var body: some View {
        ScrollView {
            GeometryReader{ proxy in
                //                Text("\(proxy.frame(in: .named("scroll")).minY)")
                Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
            }
            .frame(height: 0)
            FeaturedItem()
        }
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                if value < 0{
                    hasScrolled = true
                }else{
                    hasScrolled = false
                }
            }
            
        })
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 70)
        })
        .overlay(
            NavigationBar(title: "Featured")
                .opacity(hasScrolled ? 1 : 0)
            
        )
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
