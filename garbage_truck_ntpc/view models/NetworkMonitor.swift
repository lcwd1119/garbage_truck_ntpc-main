//
//  NetworkMonitor.swift
//  garbage_truck_ntpc
//
//  Created by 廖晨維 on 2021/12/27.
//

import Foundation
import Network

class NetworkMonitor:ObservableObject{
    private let monitor = NWPathMonitor()
    
    @Published var network_status:Bool = true
    
    init(){
        monitor.pathUpdateHandler = { [self] path in
            
            DispatchQueue.main.async {
                if path.status == .satisfied {
                    print("connected")
                    self.network_status = true
                } else {
                    print("no connection")
                    self.network_status = false
                }
            }
        }
        monitor.start(queue: DispatchQueue.global())
    }
}
