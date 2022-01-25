//
//  TruckLocationListViewModel.swift
//  garbage_truck_ntpc
//
//  Created by 廖晨維 on 2021/12/25.
//

import Foundation
class TruckLocationListViewModel: ObservableObject {
    @Published var truckLocationList = [TruckLocationResponse]()
    init() {
        truckLocationList = []
        fetchItems()
    }
    
    func fetchItems() {
        let urlStr = "https://data.ntpc.gov.tw/api/datasets/28AB4122-60E1-4065-98E5-ABCCB69AACA6/json?page=0&size=100"
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { data, response , error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
//                        let dateFormatter = DateFormatter()
//                        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
//                        decoder.dateDecodingStrategy = .formatted(dateFormatter)
                        let searchResponse = try decoder.decode([TruckLocationResponse].self, from:data)
                        DispatchQueue.main.async {
                            self.truckLocationList = searchResponse
                            print(searchResponse)
                        }
                    } catch {
                        print("TruckLocation error",error)
                    }
                }
            }.resume()
        }
    }
}
