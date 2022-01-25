//
//  Mywidget.swift
//  Mywidget
//
//  Created by 廖晨維 on 2022/1/25.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct MywidgetEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Route.id, ascending: true)],
        animation: .default)
    private var savedRoute: FetchedResults<Route>
    var entry: Provider.Entry
    
    var body: some View {
        //Text(entry.date, style: .time)
        switch widgetFamily {
        case .systemSmall:
            VStack {
                Text("目前資料庫有\(savedRoute.count)筆資料").padding()
            }.padding().environment(\.managedObjectContext,viewContext)
        case .systemMedium:
            VStack {
                Text("目前資料庫有\(savedRoute.count)筆資料").padding()
            }.padding().environment(\.managedObjectContext,viewContext)
        case .systemLarge:
            VStack {
                Text("目前資料庫有\(savedRoute.count)筆資料").padding()
            }.padding().environment(\.managedObjectContext,viewContext)
        case .systemExtraLarge:
            VStack {
                Text("目前資料庫有\(savedRoute.count)筆資料").padding()
            }.padding().environment(\.managedObjectContext,viewContext)
        @unknown default:
            VStack {
                Text("目前資料庫有\(savedRoute.count)筆資料").padding()
            }.padding().environment(\.managedObjectContext,viewContext)
        }
    }
}
@main
struct Mywidget: Widget {
    let persistenceController = PersistenceController.shared
    
    let kind: String = "Mywidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MywidgetEntryView(entry: entry)
                .environment(\.managedObjectContext,
                              persistenceController.container.viewContext)
        }
        .configurationDisplayName("My Widget")
        .description("可以顯示CoreData裡有幾筆資料")
    }
}

struct Mywidget_Previews: PreviewProvider {
    static var previews: some View {
        MywidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemExtraLarge))
    }
}
