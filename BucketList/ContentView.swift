//
//  ContentView.swift
//  BucketList
//
//  Created by Orlando Moraes Martins on 29/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onTapGesture {
            let str = "Test message"
            let url = getDocumentsDirectory().appendingPathExtension("message.txt")
            
            do {
                try str.write(to: url, atomically: true, encoding: .utf8)
                
                let input = try String(contentsOf: url)
                
                print(input)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
