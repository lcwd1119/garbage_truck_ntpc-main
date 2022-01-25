//
//  LocationViewModel.swift
//  garbage_truck_ntpc
//
//  Created by 廖晨維 on 2021/12/27.
//

import Foundation
class LocationViewModel: ObservableObject {
    @Published var city:String = ""
    @Published var suburb:String = ""
    @Published var road:String = ""

//    init() {
//        fetchItems()
//    }
    //25.00191023,121.52730273
    func fetchItems(lat:Double,lon:Double) {
        let urlStr = "https://nominatim.openstreetmap.org/reverse?lat=\(lat)&lon=\(lon)&format=json&accept-language=zh-TW"
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { data, response , error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        //decoder.dateDecodingStrategy = .iso8601
                        let searchResponse = try decoder.decode(LocationResponse.self, from:data)
                        DispatchQueue.main.async {
                            self.city = searchResponse.address.state
                            self.suburb = searchResponse.address.suburb
                            self.road = searchResponse.address.road
                            print(searchResponse)
                        }
                    } catch {
                        print("Location error",error)
                    }
                }
            }.resume()
        }
    }
}
