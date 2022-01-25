//
//  TruckLocationRowView.swift
//  garbage_truck_ntpc
//
//  Created by 廖晨維 on 2021/12/27.
//

import SwiftUI

struct TruckLocationRowView: View {
    let truckLocation:TruckLocationResponse
    var body: some View {
        HStack(alignment: .center){
            VStack(alignment: .leading) {
                Text(truckLocation.location)
                Text(truckLocation.lineId)
                Text(truckLocation.cityName)
            }
            Spacer()
            Text(truckLocation.car)
        }
    }
}

//struct TruckLocationRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TruckLocationRowView()
//    }
//}
