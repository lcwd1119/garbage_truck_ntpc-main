//
//  TruckLocationView.swift
//  garbage_truck_ntpc
//
//  Created by 廖晨維 on 2021/12/27.
//

import SwiftUI

struct TruckLocationView: View {
    @StateObject var truckLocationListViewModel =  TruckLocationListViewModel()
    var body: some View {
        List
        {
            if(!truckLocationListViewModel.truckLocationList.isEmpty) {
                ForEach(truckLocationListViewModel.truckLocationList) {
                    item in
                    TruckLocationRowView(truckLocation: item)
                }
            }
        }.overlay{
            if(truckLocationListViewModel.truckLocationList.isEmpty){
                ProgressView()
            }
        }.refreshable {
            truckLocationListViewModel.fetchItems()
        }
    }
}

struct TruckLocationView_Previews: PreviewProvider {
    static var previews: some View {
        TruckLocationView()
    }
}

