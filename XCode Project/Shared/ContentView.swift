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
    //@FetchRequest(sortDescriptors: [])      private var categories: FetchedResults<Category>
    
    @State var categories: [TestCategory] = []
    
    @State var currentScreen: Screen = .homeScreen
    @State var currentCategory: TestCategory? = nil
    @State var currentMetric: TestMetric? = nil
    @State var currentExercise: TestWeightExercise? = nil
    @State var categoryName: String = ""
    @State var metricName: String = ""
    @State var isWeightExercise: Bool = false
    @State var measurementString: String = ""
    @State var date: Date = .now
    @State var unitName: String = ""
    @State var temporaryMetricName: String = ""
    @State var newMetricFlag: Bool = false
    @State var reps: Int = 0
    @State var sets: Int = 0
    @State var lbsString: String = ""
    
    var body: some View
    {
        ZStack
        {
            bgGradient()
            displayCurrentScreen()
        }
    }
    
    // Function to return the current screen and flip between them all
    fileprivate func displayCurrentScreen() -> some View
    {
        switch currentScreen
        {
        case .homeScreen:
            return AnyView(homeScreen())
        case .allCategoriesScreen:
            return AnyView(allCategoriesScreen())
        case .newCategoryScreen:
            return AnyView(newCategoryScreen())
        case .oneCategoryScreen:
            return AnyView(oneCategoryScreen())
        case .newMetricScreen:
            return AnyView(newMetricScreen())
        case .whatUnitsScreen:
            return AnyView(whatUnitsScreen())
        case .recordMeasurementScreen:
            return AnyView(recordMeasurementScreen())
        case . recordWeightExerciseEntryScreen:
            return AnyView(recordWeightExerciseEntryScreen())
        }
    
    }
    
    // Utility functions
    func resetVariables()
    {
        currentCategory = nil
        currentMetric = nil
        currentExercise = nil
        categoryName = ""
        metricName = ""
        isWeightExercise = false
        measurementString = ""
        date = .now
        temporaryMetricName = ""
        newMetricFlag = false
        reps = 0
        sets = 0
        lbsString = ""
    }
    
    // Refactored Views
    fileprivate func bgGradient(_ color1: Color = .red, _ color2: Color = .yellow) -> some View
    {
        return LinearGradient(colors: [.red, .yellow], startPoint: .bottomLeading, endPoint: .topTrailing)
        .ignoresSafeArea()
    }

    fileprivate func button(text: String, width widthInt: Int = 280, newScreen: Screen? = nil, _ action: @escaping ()->() = {}) -> some View
    {
        let width = CGFloat(widthInt)
        
        // If a new screen to go to was passed, add that functionality to the button
        if newScreen != nil
        {
            return Button
            {
                action()
                self.currentScreen = newScreen!
            } label: {
                Text(text)
                    .frame(width: width, height: 40, alignment: .center)
                    .background(.white)
                    .cornerRadius(30)
                    .foregroundColor(.black)
            }
        }
        
        return Button
        {
            action()
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
                button(text: "Record Measurement", newScreen: .allCategoriesScreen)
                button(text: "Add Metric to Track", newScreen: .allCategoriesScreen, {self.newMetricFlag = true})
                button(text: "Add Category", newScreen: .newCategoryScreen)
            }
            
            Spacer()
            
            button(text: "My Categories", newScreen: .allCategoriesScreen)
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
                if self.newMetricFlag
                {
                    ForEach(categories, id: \.self)
                    { category in
                        button(text: category.unwrappedName, newScreen: .newMetricScreen, {self.currentCategory = category})
                    }
                } else {
                    ForEach(categories, id: \.self)
                    { category in
                        button(text: category.unwrappedName, newScreen: .oneCategoryScreen, {self.currentCategory = category})
                    }
                }
            }
            .padding()
            
            Spacer()
            
            button(text: "New Category", newScreen: .newCategoryScreen)
        }
    }
    
    fileprivate func newCategoryScreen() -> some View
    {
        let binding = Binding(
                    get: { self.categoryName },
                    set: { self.categoryName = $0 }
                )
        
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
                    TextField("", text: binding)
                        .background(.white)
                }
            }
            .padding()
            
            Spacer()
            
            if self.newMetricFlag
            {
                button(text: "Create Category", newScreen: .newMetricScreen,
                {
                    self.categories.append(TestCategory(name: self.categoryName));
                    self.categoryName = "";
                    self.currentCategory = TestCategory(name: categoryName)
                })
            } else {
                button(text: "Create Category", newScreen: .allCategoriesScreen,
                {
                    self.categories.append(TestCategory(name: self.categoryName));
                    self.categoryName = ""
                })
            }
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
                Text(self.currentCategory!.unwrappedName)
                    .font(.system(size:20, weight: .bold))
                    .padding()
                
                // Create a button for each metric from the chosen Category
                ForEach(currentCategory!.metricArray, id: \.self)
                { metric in
                    button(text: metric.unwrappedName, newScreen: .recordMeasurementScreen, {self.currentMetric = metric})
                }
                
                ForEach(currentCategory!.exerciseArray, id: \.self)
                { exercise in
                    button(text: exercise.unwrappedName, newScreen: .recordWeightExerciseEntryScreen, {self.currentExercise = exercise})
                }
            }
            .padding()
            
            Spacer()
            
            button(text: "New Metric", newScreen: .newMetricScreen)
        }
    }
    
    fileprivate func newMetricScreen() -> some View
    {
        let bindingMetricName = Binding(
                    get: { self.metricName },
                    set: { self.metricName = $0 }
                )
        
        let bindingIsWeightExercise = Binding(
                    get: { self.isWeightExercise },
                    set: { self.isWeightExercise = $0 }
                )
        
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
                    TextField("", text: bindingMetricName)
                        .background(.white)
                }
                .padding()
                
                HStack
                {
                    Text("Weight Exercise?")
                        .padding()
                    
                    Picker("Weight Exercise?", selection: bindingIsWeightExercise, content:
                        {
                            Text("Yes").tag(true)
                            Text("No").tag(false)
                        })
                }
            }
            .padding()
            
            Spacer()
            
            if self.isWeightExercise
            {
                button(text: "Create Metric", newScreen: .oneCategoryScreen, {self.newMetricFlag = false; self.currentCategory!.addWeightExercise(name: self.metricName)})
            } else {
                button(text: "Create Metric", newScreen: .whatUnitsScreen, {self.temporaryMetricName = self.metricName})
            }
        }
    }
    
    fileprivate func whatUnitsScreen() -> some View
    {
        let bindingUnitName = Binding(
                    get: { self.unitName },
                    set: { self.unitName = $0 }
                )
        
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
                    TextField("", text: bindingUnitName)
                        .background(.white)
                }
            }
            .padding()
            
            Spacer()
            
            button(text: "Create Metric", newScreen: .oneCategoryScreen, {self.newMetricFlag = false; self.currentCategory!.addMetric(name: self.temporaryMetricName, unit: unitName)})
        }
    }
    
    fileprivate func recordMeasurementScreen() -> some View
    {
        let bindingMeasurementString = Binding(
                    get: { self.measurementString },
                    set: { self.measurementString = $0 }
                )
        
        let bindingDate = Binding(
                    get: { self.date },
                    set: { self.date = $0 }
                )
        
        return VStack
        {
            VStack
            {
                Text(self.currentMetric!.unwrappedName)
                    .font(.system(size:20, weight: .bold))
                    .padding()
                
                HStack
                {
                    Text(self.currentMetric!.unwrappedUnit)
                        .padding()
                    TextField("", text: bindingMeasurementString)
                        .background(.white)
                        .keyboardType(.decimalPad)
                }
                .padding()
                
                HStack
                {
                    Text("Date:")
                        .padding()
                    DatePicker("", selection: bindingDate, displayedComponents: .date)
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
            button(text: "Record", newScreen: .homeScreen,
            {
                self.currentMetric!.addLog(number: Double(self.measurementString)!, date: self.date)
                resetVariables()
            })
        }
    }
    
    fileprivate func recordWeightExerciseEntryScreen() -> some View
    {
        let bindingReps = Binding(
                    get: { self.reps },
                    set: { self.reps = $0 }
                )
        
        let bindingSets = Binding(
                    get: { self.sets },
                    set: { self.sets = $0 }
                )
        
        let bindingLbsString = Binding(
                    get: { self.lbsString },
                    set: { self.lbsString = $0 }
                )
        
        let bindingDate = Binding(
                    get: { self.date },
                    set: { self.date = $0 }
                )
        
        return VStack
        {
            VStack
            {
                Text(self.currentExercise!.unwrappedName/*"/(Name of currently selected metric)"*/)
                    .font(.system(size:20, weight: .bold))
                    .padding()
                
                HStack
                {
                    Text("Reps:")
                        .padding()
                    Picker("", selection: bindingReps) {
                        ForEach(1...50, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
                
                HStack
                {
                    Text("Sets:")
                        .padding()
                    Picker("", selection: bindingSets) {
                        ForEach(1...30, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
                
                HStack
                {
                    Text("Lbs:")
                        .padding()
                    TextField("", text: bindingLbsString)
                        .background(.white)
                        .keyboardType(.decimalPad)
                }
                
                HStack
                {
                    Text("Date:")
                        .padding()
                    DatePicker("", selection: bindingDate, displayedComponents: .date)
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
            button(text: "Record", newScreen: .homeScreen,
            {
                self.currentExercise!.addLog(lbs: Double(self.lbsString)!, sets: Int16(self.sets), reps: Int16(self.reps), date: self.date)
                self.resetVariables()
            })
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
