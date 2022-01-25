//
//  UpdateDBView.swift
//  garbage_truck_ntpc
//
//  Created by 廖晨維 on 2022/1/23.
//

import SwiftUI
import CoreData

struct UpdateDBView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Route.id, ascending: true)],
        animation: .default)
    private var savedRoute: FetchedResults<Route>
    @ObservedObject var truckRouteInfListViewModel:TruckRouteInfListViewModel
    @State private var progress: Double = 0
    @State var showProgress = false
    @State var showAlert = false
    private let queue = DispatchQueue(label: "upDB")
    func fetchdata(){
        truckRouteInfListViewModel.reset()
        resetDC()
        queue.async {
            for i in 0...26{
                truckRouteInfListViewModel.fetchItems(term: i)
                while(truckRouteInfListViewModel.truckRouteInfListCheck[i].isEmpty){}
                DispatchQueue.main.async {
                    for item in truckRouteInfListViewModel.truckRouteInfListCheck[i]{
                        withAnimation {
                            let newItem = Route(context: viewContext)
                            newItem.id = item.id
                            newItem.city = item.city
                            newItem.lineId = item.lineId
                            newItem.lineName = item.lineName
                            newItem.rank = item.rank
                            newItem.name = item.name
                            newItem.village = item.village
                            newItem.longitude = item.longitude
                            newItem.latitude = item.latitude
                            newItem.time = item.time
                            if let tmp = item.memo{
                                newItem.memo = tmp
                            }else{
                                newItem.memo = "null"
                            }
                            
                            if let tmp = item.garbageSunday{
                                newItem.garbageSunday = tmp
                            }else{
                                newItem.garbageSunday = "null"
                            }
                            
                            if let tmp = item.garbageMonday{
                                newItem.garbageMonday = tmp
                            }else{
                                newItem.garbageMonday = "null"
                            }
                            
                            if let tmp = item.garbageTuesday{
                                newItem.garbageTuesday = tmp
                            }else{
                                newItem.garbageTuesday = "null"
                            }
                            
                            if let tmp = item.garbageWednesday{
                                newItem.garbageWednesday = tmp
                            }else{
                                newItem.garbageWednesday = "null"
                            }
                            if let tmp = item.garbageThursday{
                                newItem.garbageThursday = tmp
                            }else{
                                newItem.garbageThursday = "null"
                            }
                            if let tmp = item.garbageFriday{
                                newItem.garbageFriday = tmp
                            }else{
                                newItem.garbageFriday = "null"
                            }
                            if let tmp = item.garbageSaturday{
                                newItem.garbageSaturday = tmp
                            }else{
                                newItem.garbageSaturday = "null"
                            }
                            
                            if let tmp = item.recyclingSunday{
                                newItem.recyclingSunday = tmp
                            }else{
                                newItem.recyclingSunday = "null"
                            }
                            if let tmp = item.recyclingMonday{
                                newItem.recyclingMonday = tmp
                            }else{
                                newItem.recyclingMonday = "null"
                            }
                            if let tmp = item.recyclingTuesday{
                                newItem.recyclingTuesday = tmp
                            }else{
                                newItem.recyclingTuesday = "null"
                            }
                            if let tmp = item.recyclingWednesday{
                                newItem.recyclingWednesday = tmp
                            }else{
                                newItem.recyclingWednesday = "null"
                            }
                            if let tmp = item.recyclingThursday{
                                newItem.recyclingThursday = tmp
                            }else{
                                newItem.recyclingThursday = "null"
                            }
                            if let tmp = item.recyclingFriday{
                                newItem.recyclingFriday = tmp
                            }else{
                                newItem.recyclingFriday = "null"
                            }
                            if let tmp = item.recyclingSaturday{
                                newItem.recyclingSaturday = tmp
                            }else{
                                newItem.recyclingSaturday = "null"
                            }
                            
                            if let tmp = item.foodScrapsSunday{
                                newItem.foodScrapsSunday = tmp
                            }else{
                                newItem.foodScrapsSunday = "null"
                            }
                            if let tmp = item.foodScrapsMonday{
                                newItem.foodScrapsMonday = tmp
                            }else{
                                newItem.foodScrapsMonday = "null"
                            }
                            if let tmp = item.foodScrapsTuesday{
                                newItem.foodScrapsTuesday = tmp
                            }else{
                                newItem.foodScrapsTuesday = "null"
                            }
                            if let tmp = item.foodScrapsWednesday{
                                newItem.foodScrapsWednesday = tmp
                            }else{
                                newItem.foodScrapsWednesday = "null"
                            }
                            if let tmp = item.foodScrapsThursday{
                                newItem.foodScrapsThursday = tmp
                            }else{
                                newItem.foodScrapsThursday = "null"
                            }
                            if let tmp = item.foodScrapsFriday{
                                newItem.foodScrapsFriday = tmp
                            }else{
                                newItem.foodScrapsFriday = "null"
                            }
                            if let tmp = item.foodScrapsSaturday{
                                newItem.foodScrapsSaturday = tmp
                            }else{
                                newItem.foodScrapsSaturday = "null"
                            }
                            do{
                                try viewContext.save()
                            } catch {
                                // Replace this implementation with code to handle the error appropriately.
                                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                                let nsError = error as NSError
                                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                            }
                        }
                        
                    }
                }
                progress = Double(i)
            }
        }
    }
    
    func test(){
        for i in 0 ... 30{progress = Double(i)}
    }
    
    func resetDC(){
        // Specify a batch to delete with a fetch request
        let fetchRequest: NSFetchRequest<NSFetchRequestResult>
        fetchRequest = NSFetchRequest(entityName: "Route")
        
        // Create a batch delete request for the
        // fetch request
        let deleteRequest = NSBatchDeleteRequest(
            fetchRequest: fetchRequest
        )
        
        // Specify the result of the NSBatchDeleteRequest
        // should be the NSManagedObject IDs for the
        // deleted objects
        deleteRequest.resultType = .resultTypeObjectIDs
        
        // Get a reference to a managed object context
        let context = viewContext
        
        // Perform the batch delete
        let batchDelete = try? context.execute(deleteRequest)
        as? NSBatchDeleteResult
        
        guard let deleteResult = batchDelete?.result
                as? [NSManagedObjectID]
        else { return }
        
        let deletedObjects: [AnyHashable: Any] = [
            NSDeletedObjectsKey: deleteResult
        ]
        
        // Merge the delete changes into the managed
        // object context
        NSManagedObjectContext.mergeChanges(
            fromRemoteContextSave: deletedObjects,
            into: [context]
        )
    }
    
    var body: some View {
        if(showProgress){
            ProgressView(value: progress, total: 26)
                .progressViewStyle(CustomCircularProgressViewStyle())
        }
        else{
            VStack {
                Text("目前資料庫有\(savedRoute.count)筆資料")
                
                HStack{
                    Button("更新資料庫") {
                        progress = 0
                        showProgress = true
                        
                        fetchdata()
                        //test()
                    }
                    Button("清空資料庫") {
                        resetDC()
                    }
                }.buttonStyle(.borderedProminent)
                    .font(.largeTitle)
            }
        }
    }
    
}

struct CustomCircularProgressViewStyle: ProgressViewStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: CGFloat(configuration.fractionCompleted ?? 0))
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 3, dash: [10, 5]))
                .rotationEffect(.degrees(-90))
                .frame(width: 200)
            if let fractionCompleted = configuration.fractionCompleted {
                Text(fractionCompleted < 1 ?
                     "下載中... \(Int((configuration.fractionCompleted ?? 0) * 100))%"
                     : "下載完成!"
                )
                    .fontWeight(.bold)
                    .foregroundColor(fractionCompleted < 1 ? .orange : .green)
                    .frame(width: 180)
            }
        }
    }
}

//struct UpdateDBView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdateDBView()
//    }
//}
