//
//  TruckRouteInfRowView.swift
//  garbage_truck_ntpc
//
//  Created by 廖晨維 on 2021/12/28.
//

import SwiftUI

struct TruckRouteInfRowView: View {
    let truckRouteInf:Route
    var body: some View {
        VStack{
            Text(truckRouteInf.city!)
            Text(truckRouteInf.lineName!)
            Text(truckRouteInf.name!)
            Text("到達順序：\(truckRouteInf.rank!)")
            
        }.frame(width: UIScreen.main.bounds.size.width*0.9,height: 100)
            .background(.cyan)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .foregroundColor(.white)
    }
}

//struct TruckRouteInfRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TruckRouteInfRowView()
//    }
//}
