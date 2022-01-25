//
//  TruckRouteInfListViewModel.swift
//  garbage_truck_ntpc
//
//  Created by 廖晨維 on 2021/12/25.
//

import Foundation
import SwiftUI

class TruckRouteInfListViewModel: ObservableObject {
    var array2DD = Array(repeating: Array(repeating: 0, count: 8), count: 8)
    @Published var truckRouteInfListCheck = [[TruckRouteInfResponse]]()
    var truckRouteInfList = [TruckRouteInfResponse]()
    init() {
        //fetchItems(term: 0)
        //fetch_all()
        truckRouteInfList = []
        for _ in 0...30{
            truckRouteInfListCheck.append([])
        }
    }
    
    func reset(){
        truckRouteInfList = []
        for i in 0...truckRouteInfListCheck.count-1{
            truckRouteInfListCheck[i] = []
        }
    }
    
    func fetchItems(term: Int) {
        let urlStr = "https://data.ntpc.gov.tw/api/datasets/EDC3AD26-8AE7-4916-A00B-BC6048D19BF8/json?page=\(term)&size=1000"
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { data, response , error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let searchResponse = try decoder.decode([TruckRouteInfResponse].self, from:data)
                        DispatchQueue.main.async {
                            self.truckRouteInfListCheck[term] = searchResponse
                            self.truckRouteInfList += searchResponse
                            print(searchResponse)
                        }
                    } catch {
                        print("TruckRouteInf error",error)
                    }
                }
            }.resume()
        }
    }
    
    func fetch_all(){
        truckRouteInfList = []
        for i in 0...30{
            fetchItems(term: i)
        }
    }
}
