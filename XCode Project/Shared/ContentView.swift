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
            newMetricScreen()
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
    
    fileprivate func allCategoriesScreen() -> some View
    {
        return VStack
        {
            VStack
            {
                // Create a button for each category from the FetchRequest
                button(text: "Category 1")
                button(text: "Category 2")
                button(text: "Category 3")
            }
            .padding()
            
            Spacer()
            
            button(text: "New Category")
        }
    }
    
    fileprivate func newCategoryScreen() -> some View
    {
        @State var categoryName: String = ""
        
        return VStack
        {
            VStack
            {
                Text("New Category")
                    .font(.system(size:20, weight: .bold))
                    .padding()
                HStack
                {
                    Text("Name:")
                        .padding()
                    TextField("", text: $categoryName)
                        .background(.white)
                }
            }
            .padding()
            
            Spacer()
            
            button(text: "Create Category")
        }
    }
    
    fileprivate func oneCategoryScreen() -> some View
    {
        //@State var category: Category
        
        return VStack
        {
            VStack
            {
                // Name of this Category
                Text("Category N")
                    .font(.system(size:20, weight: .bold))
                    .padding()
                
                // Create a button for each metric from the chosen Category
                button(text: "Metric 1")
                button(text: "Metric 2")
                button(text: "Metric 3")
            }
            .padding()
            
            Spacer()
            
            button(text: "New Metric")
        }
    }
    
    fileprivate func newMetricScreen() -> some View
    {
        @State var metricName: String = ""
        @State var isWeightExercise: Bool = false
        
        return VStack
        {
            VStack
            {
                Text("New Metric")
                    .font(.system(size:20, weight: .bold))
                    .padding()
                
                HStack
                {
                    Text("Name:")
                        .padding()
                    TextField("", text: $metricName)
                        .background(.white)
                }
                .padding()
                
                HStack
                {
                    Text("Weight Exercise?")
                        .padding()
                    
                    Picker("Weight Exercise?", selection: $isWeightExercise, content:
                        {
                            Text("Yes").tag(true)
                            Text("No").tag(false)
                        })
                }
            }
            .padding()
            
            Spacer()
            
            button(text: "Create Metric")
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
