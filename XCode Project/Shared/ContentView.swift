//
//  ContentView.swift
//  Shared
//
//  Created by Joe Buchoff on 12/1/21.
//

import SwiftUI
import CoreData

struct ContentView: View
{
    @Environment(\.managedObjectContext)    private var context
    @FetchRequest(sortDescriptors: [])      private var categories: FetchedResults<Category>
    
    var body: some View
    {
        ZStack
        {
            bgGradient()
            homeScreen()
        }
    }
    
    // Refactored Views
    fileprivate func bgGradient(_ color1: Color = .red, _ color2: Color = .yellow) -> some View
    {
        return LinearGradient(colors: [.red, .yellow], startPoint: .bottomLeading, endPoint: .topTrailing)
        .ignoresSafeArea()
    }

    fileprivate func button(text: String) -> some View
    {
        return Button
        {
            
        } label: {
            Text(text)
                .frame(width: 280, height: 40, alignment: .center)
                .background(.white)
                .cornerRadius(30)
                .foregroundColor(.black)
        }
    }
    
    // Refactored whole screens
    fileprivate func homeScreen() -> some View
    {
        return VStack
        {
            HStack
            {
                Text("Profile Pic")
                    .frame(width: 200, height: 200, alignment: .center)
                    .background(.white)
                VStack
                {
                    Text("Name")
                        .font(.system(size:20, weight: .black))
                        .padding(1)
                    Text("X Goals Hit")
                }.padding()
            }.padding()
            
            Spacer()
            
            VStack
            {
                Text("Quick Actions:")
                    .font(.system(size:25, weight: .bold))
                    .foregroundColor(.white)
                button(text: "Record Measurement")
                button(text: "Add Metric to Track")
                button(text: "Add Category")
            }
            
            Spacer()
            
            button(text: "My Categories")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider
    {
    static var previews: some View
    {
        ContentView()
    }
}
