
import Foundation
import SwiftUI

final class FilterViewModel : ObservableObject {
    @Published var items = [TaskModel]()
    @Published var showingFavs = false
    //    var todoFiltered : [TaskModel] {
    //        if showingFavs {
    //            return items.filter {savedItems.contains($0.id)}
    //        } else {
    //            return items
    //        }
    //    }
    @Published var savedItems: Set<Int> = [1]
//    var filteredItems: [TaskModel] {
//        if showingFavs {
//            return items.filter{savedItems.contains($0.id)}
//        } else {
//            return items
//        }
//    }

    func sortFavs() {
        withAnimation {
            showingFavs.toggle()
        }
    }

}

//{savedItems.contains($0.id)}
