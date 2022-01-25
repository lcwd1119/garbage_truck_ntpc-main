//
//  ContentView.swift
//  garbage_truck_ntpc
//
//  Created by 廖晨維 on 2021/12/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var truckRouteInfListViewModel = TruckRouteInfListViewModel()
    @StateObject var locationManager = LocationManager()
    @StateObject var networkMonitor = NetworkMonitor()
    @State var showalert = false
    @State var showUpdate = false
    var body: some View {
        if(networkMonitor.network_status){
            TabView{
                NavigationView{
                    VStack(spacing:70){
                        NavigationLink {
                            TruckRouteInfView(truckRouteInfListViewModel:truckRouteInfListViewModel)
                        } label: {
                            Text("路線查詢")
                                .font(.largeTitle)
                        }
                        NavigationLink {
                            TruckLocationView()
                        } label: {
                            Text("查詢出勤\n車輛")
                                .font(.largeTitle)
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                //truckRouteInfListViewModel.fetch_all()
                                showUpdate = true
                            }) {
                                Label("updata coredata", systemImage: "arrow.triangle.2.circlepath")
                            }.sheet(isPresented: $showUpdate) {
                                UpdateDBView(truckRouteInfListViewModel: truckRouteInfListViewModel)
                            }
                        }
                    }.buttonStyle(.borderedProminent)
                }.tabItem({
                    Label("首頁",systemImage: "house.fill")})
                
                LocationView()
                    .environmentObject(locationManager)
                //CDTestView()
                    .tabItem{Label("位置",systemImage: "location.fill")}
            }
        }
        else{
            NetworkView(networkMonitor: networkMonitor)
                .onAppear {
                    showalert = true
                }.alert("斷網了GG", isPresented: $showalert) {
                    Button("confirm"){}
                }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
