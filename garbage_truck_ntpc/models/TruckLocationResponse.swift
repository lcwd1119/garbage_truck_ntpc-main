//
//  TruckLocationResponse.swift
//  garbage_truck_ntpc
//
//  Created by 廖晨維 on 2021/12/25.
//

import Foundation


struct TruckLocationResponse:Codable,Identifiable{
    var id:String{lineId}
    let lineId:String//清運路線編號
    let car:String//車牌號碼
    let time:String//回報時間
    let location:String//所在位址
    let longitude:String//經度
    let latitude:String//緯度
    let cityId:String//行政區代號
    let cityName:String//行政區名稱
}
