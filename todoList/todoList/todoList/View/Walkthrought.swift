//
//  Walkthrought.swift
//  todoList
//
//  Created by Valentina Krysak on 25.07.22.
//

import SwiftUI

struct Walkthrought: View {
    var body: some View {
        VStack {
            Image("logo")
            Text("todo list")
                .font(.custom("Roboto-ThinItalic", size: 48))

        }

    }
}

struct Walkthrought_Previews: PreviewProvider {
    static var previews: some View {
        Walkthrought()
    }
}
