//
//  ContentView.swift
//  Moonshot_Project8
//
//  Created by Jesse Sheehan on 8/22/24.
//

import SwiftUI



struct ContentView: View {
    
    //type notation needed because it otherwise doesn't know what "T" is
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
       
        NavigationStack {
            ScrollView {
                
                Text("Missions")
                    .font(.largeTitle.bold())
                    
                
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                        
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.7))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                                
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
                
                
                Text("Astronauts")
                    .font(.largeTitle.bold())
                
                LazyVGrid(columns: columns) {
                    ForEach(Array(astronauts.keys), id: \.self) { key in
                        if let astronaut = astronauts[key] {
                         
                        NavigationLink {
                            AstronautView(astronaut: astronaut)
                        } label: {
                            VStack {
                                Image(astronaut.id)
                                    .resizable()
                                    .scaledToFit()
                                    //.frame(width: 100, height: 100)
                                    //.padding()
                                    .clipShape(.rect(cornerRadius: 10))
                                
                                VStack {
                                    Text(astronaut.name)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                                
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )}
                        }
                    }
                }
                .padding([.horizontal, .bottom])
                
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .toolbar {
                NavigationLink() {
                        ContentListView()
                    } label: {
                        Image(systemName:"list.dash")
                            .foregroundStyle(.white)
                            .font(.title2.bold())
                    }.padding()
            }
        }
        
    }
    
//    init(astronauts: [String: Astronaut]) {
//        self.mission = mission
//        
//        self.crew = mission.crew.map { member in
//            if let astronaut = astronauts[member.name] {
//                return CrewMember(role: member.role, astronaut: astronaut)
//            } else {
//                fatalError("Missing \(member.name)")
//            }
//        }
//    }
}

// //FOR: Scrollview/LazyVStack EXPLAINATION

//struct CustomeText: View {
//    let text: String
//    
//    var body: some View {
//        Text(text)
//    }
//    
//    init(text: String) {
//        print("Creating a new custom text")
//        self.text = text
//    }
//}

// //JSON INTERPRETATION EXAMPLES
//struct User: Codable {
//    let name: String
//    let address: Address
//}
//struct Address: Codable {
//    let street: String
//    let city: String
//}


//struct ContentView: View {
    
    
    
//    //LAYING OUT VIEWS IN A SCROLLING GRID W/ lazy v/h stacks
//    let layout = [
// //        GridItem(.fixed(80)),
// //        GridItem(.fixed(80)),
// //        GridItem(.fixed(80))
//        //ORRRRRR - this is better and will work on diff screen sizes!
//        GridItem(.adaptive(minimum: 80, maximum:150))
//    ]
//    
//    var body: some View {
//        
//        
//        //LAYING OUT VIEWS IN A SCROLLING GRID W/ lazy v/h stacks
//        //ScrollView(.horizontal) {
//        ScrollView {
//          //  LazyHGrid(rows: layout) {
//            LazyVGrid(columns: layout) {
//                ForEach(0..<1000) {
//                    Text("Item \($0)")
//                }
//            }
//        }
        
        
        // JSON CODABLE; HIERARCHICAL DATA
        //USE THE USER AND ADDRESS STRUCTS ABOVE
        //JSON DATA REQUIRES YOU DEFINE YOUR STRUCTS TO MATCH IT
//        Button("Decode JSON") {
//            let input = """   // THIS IS THE INPUT FOR THE JSON
                                //FYI - YOU WOULDN'T NORMALLY TYPE IT OUT LIKE THIS
//            {
//               "name": "Jesse Sheehan",
//                "address": {
//                    "street": "1122 Boogie Woogie Avenue",
//                    "city": "Cheshire"
//                    }
//                }
//            """
//            
//            let data = Data(input.utf8)
//            let decoder = JSONDecoder()
//            
//            if let user =  try? decoder.decode(User.self, from: data) {
        
//                print(user.address.street)
//            }
//        }
        
        //NAVIGATION LINK TO PRESENT NEW VIEWS
//        NavigationStack {
//            List(0..<100) { row in
//                NavigationLink("Row \(row)") {
//                    Text("Detail \(row)")
//                }
//            }
//        }
//        NavigationStack {
//            NavigationLink /*("Tap Me") */ {
//                Text("Detail View")
//            } label: {
//                VStack {
//                    Text("This is the label")
//                    Text("So is this")
//                    Image(systemName: "face.smiling")
//                }
//                .font(.largeTitle)
//            }
//                .navigationTitle("SwiftUI")
//        }
        
//        //SCROLLVIEW AND CREATING SIMPLER VIEWS
//        ScrollView {
//            //VStack(spacing: 10) {// this ends up creating 100 different views!!
//            //LazyVStacks always uses the most available space
//            LazyVStack(spacing: 10) {
//                ForEach(0..<100) {
//                    CustomeText(text: "Item \($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
//        }
        
        
        
        //FRAMING IMAGES PROPERLY
//        VStack {
//            Image(.example)
//                //.clipped()
//                .resizable()
//                .scaledToFit()
//                //.frame(width: 300, height: 300)
//                .containerRelativeFrame(.horizontal) { size, axis in
//                    size * 0.8 //that's 0.8 of the horizontal axis, in this scenario
//                }
//            //^^This says we want to make a frame RELATIVE to the size of its parent (the whole view, right now)
//            //axis is .horizontal because that's what we're working with right now. The size is the size of our container, which right now, is the full screen.
//            //we return in the enclosures the size we want - so 0.8 or 80% of the full size of the screen.
//            
//
//        }
    
//    }
//}

#Preview {
    ContentView()
}
