//
//  TruckRouteInfDetailView.swift
//  garbage_truck_ntpc
//
//  Created by 廖晨維 on 2021/12/28.
//

import SwiftUI

struct TruckRouteInfDetailView: View {
    let truckRouteInfDetail:Route
    
    var body: some View {
        let foodday:[String?] = [truckRouteInfDetail.foodScrapsMonday,
                                 truckRouteInfDetail.foodScrapsTuesday,
                                 truckRouteInfDetail.foodScrapsWednesday,
                                 truckRouteInfDetail.foodScrapsThursday,
                                 truckRouteInfDetail.foodScrapsFriday,
                                 truckRouteInfDetail.foodScrapsSaturday,
                                 truckRouteInfDetail.foodScrapsSunday]
        let garbageday:[String?] = [truckRouteInfDetail.garbageMonday,
                                    truckRouteInfDetail.garbageTuesday,
                                    truckRouteInfDetail.garbageWednesday,
                                    truckRouteInfDetail.garbageThursday,
                                    truckRouteInfDetail.garbageFriday,
                                    truckRouteInfDetail.garbageSaturday,
                                    truckRouteInfDetail.garbageSunday]
        let weekday = ["禮拜一:","禮拜二:","禮拜三:","禮拜四:","禮拜五:","禮拜六:","禮拜天:"]
        VStack(alignment: .center){
            Text(truckRouteInfDetail.city!)
            Text(truckRouteInfDetail.lineName!)
            HStack(spacing: 10){
                VStack(alignment: .leading){
                    Text("收廚餘日")
                    ForEach(weekday.indices){
                        index in
                        if(foodday[index] == nil){
                            Text(weekday[index]+"沒有")
                        }
                        else{
                            Text(weekday[index]+"有")
                        }
                    }
                }
                VStack(alignment: .leading){
                    Text("收垃圾日")
                    ForEach(weekday.indices){
                        index in
                        if(garbageday[index] == nil){
                            Text(weekday[index]+"沒有")
                        }
                        else{
                            Text(weekday[index]+"有")
                        }
                    }
                }
            }
        }
    }
}
//struct TruckRouteInfDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TruckRouteInfDetailView()
//    }
//}
