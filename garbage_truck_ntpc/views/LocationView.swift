//
//  LocationView.swift
//  garbage_truck_ntpc
//
//  Created by 廖晨維 on 2021/12/28.
//

import SwiftUI
import CoreLocationUI

struct LocationView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Route.id, ascending: true)],
        animation: .default)
    private var savedRoute: FetchedResults<Route>
    @StateObject var locationViewModel =  LocationViewModel()
    @EnvironmentObject var  locationManager:LocationManager
    private var idiom : UIUserInterfaceIdiom { UIDevice.current.userInterfaceIdiom }
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            List {
                Section{
                    Text(locationViewModel.city)
                    Text(locationViewModel.suburb)
                    Text(locationViewModel.road)
                    if(idiom != .pad){
                        Button{
                            let sendStr = "我在" + locationViewModel.city+locationViewModel.suburb+locationViewModel.road
                            
                            let activityController = UIActivityViewController(activityItems: [sendStr], applicationActivities: nil)
                            
                            UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
                            
                        }label: {
                            Label("分享", systemImage: "square.and.arrow.up")
                        }
                    }
                    
                }
                if(savedRoute.isEmpty){
                    Text("目前沒有任何資料")
                }
                ForEach(locationViewModel.city.isEmpty ?savedRoute.filter({
                    $0.id! == $0.id!
                }):savedRoute.filter({
                    ($0.city!+$0.name!).contains(locationViewModel.suburb+locationViewModel.road)
                })){item in
                    VStack{
                        Text(item.city!)
                        Text(item.lineName!)
                        Text(item.name!)
                        Text("到達順序：\(item.rank!)")
                    }.frame(width: UIScreen.main.bounds.size.width*0.8,height: 100)
                        .background(.cyan)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .foregroundColor(.white)
                }
            }.refreshable {
                if let location = locationManager.lastLocation{
                    locationViewModel.fetchItems(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
                }
            }
        }.onAppear {
            if let location = locationManager.lastLocation{
                locationViewModel.fetchItems(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
