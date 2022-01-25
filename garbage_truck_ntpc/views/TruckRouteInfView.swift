//
//  TruckRouteInfView.swift
//  garbage_truck_ntpc
//
//  Created by 廖晨維 on 2021/12/27.
//

import SwiftUI
import RefreshableScrollView

struct TruckRouteInfView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Route.id, ascending: true)],
        animation: .default)
    private var savedRoute: FetchedResults<Route>
    @ObservedObject var truckRouteInfListViewModel:TruckRouteInfListViewModel
    @State var refresh = false
    @State var searchText = ""
    @State var selectedRoute: Route?
    @State var showRoute: [Route] = []
    @State var scale: CGFloat = 1
    @State var previousScale: CGFloat = 1
    var column = Array(repeating: GridItem(), count: 1)
    

    var searchResult: [Route] {
        if searchText.isEmpty {
                return savedRoute.map{$0}
        } else {
            return savedRoute.filter {
                ($0.city!+$0.name!).contains(searchText)
            }
        }
    }
    
    var magnificationGesture: some Gesture {
        MagnificationGesture()
            .onChanged { value in
                scale = previousScale * value.magnitude
            }
            .onEnded { value in
                previousScale = scale
            }
    }
    
    
    
    var body: some View {
        RefreshableScrollView(refreshing: $refresh, action: {
            //truckRouteInfListViewModel.fetchItems(term: 0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.refresh = false
            }
        }){
            LazyVGrid(columns: column, content: {
                ForEach(searchResult) {
                    item in
                    Button{
                        selectedRoute = item
                    }label: {
                        TruckRouteInfRowView(truckRouteInf: item)
                    }
                }
            })
        }.searchable(text: $searchText)
            .overlay {
                if(savedRoute.isEmpty){
                    Text("目前沒有任何資料")
                }
            }
            .sheet(item: $selectedRoute) {item in
                TruckRouteInfDetailView(truckRouteInfDetail: item)
                    .onAppear(perform: {
                        scale = 1
                        previousScale = 1
                    })
                    .scaleEffect(scale)
                    .gesture(magnificationGesture)
                    .animation(.default, value: scale)
            }
    }
}

//struct TruckRouteInfView_Previews: PreviewProvider {
//    static var previews: some View {
//        TruckRouteInfView()
//    }
//}
