//
//  ContentView.swift
//  BucketList
//
//  Created by Orlando Moraes Martins on 29/12/22.
//

import SwiftUI

struct User: Identifiable, Comparable{
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {
    let users = [
        User(firstName: "Orlando Gabriel", lastName: "Costa"),
        User(firstName: "Carlos Eduardo", lastName: "Costa"),
        User(firstName: "Fernanda Cristina", lastName: "Costa")
    ].sorted()
    var body: some View {
        List(users) { user in
            Text("\(user.firstName) \(user.lastName)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
