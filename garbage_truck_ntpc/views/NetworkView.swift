//
//  NetworkView.swift
//  garbage_truck_ntpc
//
//  Created by 廖晨維 on 2021/12/27.
//

import SwiftUI

struct NetworkView: View {
    @ObservedObject var networkMonitor:NetworkMonitor
    var body: some View {
        VStack(alignment: .center) {
            Text("你想要的內容")
            Text("只有連上網路才看得到了")
            Text("😢😢😢")
        }.font(.largeTitle)
            .refreshable {}
    }
}
struct NetworkView_Previews: PreviewProvider {
    static var networkMonitorTemp = NetworkMonitor()
    static var previews: some View {
        NetworkView(networkMonitor: networkMonitorTemp)
    }
}
