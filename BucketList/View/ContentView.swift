//
//  ContentView.swift
//  BucketList
//
//  Created by Orlando Moraes Martins on 29/12/22.
//
import MapKit
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        if viewModel.isUnlocked {
            ZStack{
                Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        VStack{
                            Image(systemName: "star.circle")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(width: 44, height: 44)
                                .background(.white)
                                .clipShape(Circle())
                            
                            Text(location.name)
                                .fixedSize()
                        }
                        .onTapGesture {
                            viewModel.selectedPlace = location
                        }
                    }
                }
                .ignoresSafeArea()
                
                Circle()
                    .fill(.blue)
                    .opacity(0.3)
                    .frame(width: 32, height: 32)
                
                VStack {
                    Spacer()
                    
                    HStack{
                        Spacer()
                        
                        Button{
                            viewModel.addLocation()
                        } label: {
                            Image(systemName: "plus")
                                .padding()
                                .background(.black.opacity(0.75))
                                .font(.title)
                                .clipShape(Circle())
                                .padding(.trailing)

                        }
//                        .padding()
//                        .background(.black.opacity(0.75))
//                        .font(.title)
//                        .clipShape(Circle())
//                        .padding(.trailing)
                    }
                }
            }
            .sheet(item: $viewModel.selectedPlace){ place in
                EditView(location: place){ newLocation in
                    viewModel.update(location: newLocation)
                }
            }
        } else {
            Button("Unlock places") {
                viewModel.authenticate()
                
                if !viewModel.isUnlocked {
                    viewModel.showingErrorAlert = true
                }
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .alert("Authentication Failed", isPresented: $viewModel.showingErrorAlert) {
                Button("Retry", role: .cancel) { }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
