//
//  TruckRouteInfResponse.swift
//  garbage_truck_ntpc
//
//  Created by 廖晨維 on 2021/12/25.
//

import Foundation
import SwiftUI

struct TruckRouteInfResponse:Codable,Identifiable {
    var id:String{lineId+rank}
    let city:String    //(行政區)
    let lineId:String//(清運路線編號)
    let lineName:String//(清運路線名稱)
    let rank:String//(清運序)
    let name:String//(清運點名稱)
    let village:String//(清運點所屬里)
    let longitude:String//(經度)
    let latitude:String//(緯度)
    let time:String//(表定抵達清運時間)
    let memo:String?//(備註)
    let garbageSunday:String?//(一般垃圾清運-星期日)
    let garbageMonday:String?//(一般垃圾清運-星期一)
    let garbageTuesday:String?//(一般垃圾清運-星期二)
    let garbageWednesday:String?//(一般垃圾清運-星期三)
    let garbageThursday:String?//(一般垃圾清運-星期四)
    let garbageFriday:String?//(一般垃圾清運-星期五)
    let garbageSaturday:String?//(一般垃圾清運-星期六)
    let recyclingSunday:String?//(資源回收清運-星期日)
    let recyclingMonday:String?//(資源回收清運-星期一)
    let recyclingTuesday:String?//(資源回收清運-星期二)
    let recyclingWednesday:String?//(資源回收清運-星期三)
    let recyclingThursday:String?//(資源回收清運-星期四)
    let recyclingFriday:String?//(資源回收清運-星期五)
    let recyclingSaturday:String?//(資源回收清運-星期六)
    let foodScrapsSunday:String?//(廚餘清運-星期日)
    let foodScrapsMonday:String?//(廚餘清運-星期一)
    let foodScrapsTuesday:String?//(廚餘清運-星期二)
    let foodScrapsWednesday:String?//(廚餘清運-星期三)
    let foodScrapsThursday:String?//(廚餘清運-星期四)
    let foodScrapsFriday:String?//(廚餘清運-星期五)
    let foodScrapsSaturday:String?//(廚餘清運-星期六)
}
