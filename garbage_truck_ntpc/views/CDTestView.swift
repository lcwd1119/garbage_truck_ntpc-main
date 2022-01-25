//
//  CDTestView.swift
//  garbage_truck_ntpc
//
//  Created by 廖晨維 on 2022/1/25.
//

import SwiftUI

struct CDTestView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Route.id, ascending: true)],
        animation: .default)
    private var saved: FetchedResults<Route>
    var body: some View {
//        NavigationView {
//            List {
//                ForEach(saved) { item in
//                    NavigationLink {
//                        Text("Item at \(item.id!)")
//                    } label: {
//                        Text(item.id!)
//                    }
//                }
//            }
//        }
        Text("\(saved.count)")
    }
    
}

struct CDTestView_Previews: PreviewProvider {
    static var previews: some View {
        CDTestView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
