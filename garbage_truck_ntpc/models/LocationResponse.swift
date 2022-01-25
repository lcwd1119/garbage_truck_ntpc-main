//
//  LocationResponse.swift
//  garbage_truck_ntpc
//
//  Created by 廖晨維 on 2021/12/27.
//

import Foundation

struct LocationResponse:Codable{
    let address:Address
}

struct Address:Codable{
    let suburb:String
    let state:String
    let road:String
}
