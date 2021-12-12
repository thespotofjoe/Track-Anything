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
            recordWeightExerciseEntryScreen()
        }
    }
    
    // Refactored Views
    fileprivate func bgGradient(_ color1: Color = .red, _ color2: Color = .yellow) -> some View
    {
        return LinearGradient(colors: [.red, .yellow], startPoint: .bottomLeading, endPoint: .topTrailing)
        .ignoresSafeArea()
    }

    fileprivate func button(text: String, width widthInt: Int = 280) -> some View
    {
        let width = CGFloat(widthInt)
        
        return Button
        {
            
        } label: {
            Text(text)
                .frame(width: width, height: 40, alignment: .center)
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
    
    fileprivate func whatUnitsScreen() -> some View
    {
        @State var unitName: String = ""
        
        return VStack
        {
            VStack
            {
                Text("Specify Units")
                    .font(.system(size:20, weight: .bold))
                    .padding()
                
                HStack
                {
                    Text("Units:")
                        .padding()
                    TextField("", text: $unitName)
                        .background(.white)
                }
            }
            .padding()
            
            Spacer()
            
            button(text: "Create Metric")
        }
    }
    
    fileprivate func recordMeasurementScreen() -> some View
    {
        @State var measurementString: String = ""
        @State var date: Date = .now
        
        return VStack
        {
            VStack
            {
                Text("Metric N"/*"/(Name of currently selected metric)"*/)
                    .font(.system(size:20, weight: .bold))
                    .padding()
                
                HStack
                {
                    Text("Units:"/*"/(Name of units):*/)
                        .padding()
                    TextField("", text: $measurementString)
                        .background(.white)
                        .keyboardType(.decimalPad)
                }
                .padding()
                
                HStack
                {
                    Text("Date:")
                        .padding()
                    DatePicker("", selection: $date, displayedComponents: .date)
                }
                .padding()
                
                HStack
                {
                    button(text: "Yesterday", width: 120) // Make this button change @date to yesterday
                        .padding()
                    button(text: "Today", width: 120) // Make this button change @date to today
                }
            }
            .padding()
            
            Spacer()
            
            /*Make this button also convert measurementString to a Double and save it*/
            button(text: "Record")
        }
    }
    
    fileprivate func recordWeightExerciseEntryScreen() -> some View
    {
        @State var reps: Int = 0
        @State var sets: Int = 0
        @State var lbsString: String = ""
        @State var date: Date = .now
        
        return VStack
        {
            VStack
            {
                Text("Metric N"/*"/(Name of currently selected metric)"*/)
                    .font(.system(size:20, weight: .bold))
                    .padding()
                
                HStack
                {
                    Text("Reps:")
                        .padding()
                    Picker("", selection: $sets) {
                        ForEach(1...50, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
                
                HStack
                {
                    Text("Sets:")
                        .padding()
                    Picker("", selection: $sets) {
                        ForEach(1...30, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
                
                HStack
                {
                    Text("Lbs:")
                        .padding()
                    TextField("", text: $lbsString)
                        .background(.white)
                        .keyboardType(.decimalPad)
                }
                
                HStack
                {
                    Text("Date:")
                        .padding()
                    DatePicker("", selection: $date, displayedComponents: .date)
                }
                
                HStack
                {
                    button(text: "Yesterday", width: 120) // Make this button change @date to yesterday
                        .padding()
                    button(text: "Today", width: 120) // Make this button change @date to today
                }
            }
            .padding()
            
            Spacer()
            
            /*Make this button also convert measurementString to a Double and save it*/
            button(text: "Record")
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
