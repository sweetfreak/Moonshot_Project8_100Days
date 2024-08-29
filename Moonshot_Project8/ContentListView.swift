
import SwiftUI



struct ContentListView: View {
    
    //type notation needed because it otherwise doesn't know what "T" is
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    
    var body: some View {
        VStack {
            VStack {
            VStack {
                Text("Missions")
                    .font(.title.bold())
                List {
                    ForEach(missions) { mission in
                        NavigationLink(value: mission) {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.7))
                        }
                        //                            .navigationDestination(for: Mission.self ) { mission in
                        //                                MissionView(mission: mission, astronauts: astronauts)
                        //                            }
                        .padding(4)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .scrollContentBackground(.hidden)
                        .background(.lightBackground)
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .listRowBackground(Color.darkBackground)
                }
            }
            
            Rectangle()
                .frame(height: 2)
                .foregroundColor(.lightBackground)
                .padding(.vertical)
            
            VStack {
                Spacer()
                Text("Astronauts")
                    .font(.title.bold())
                List {
                    ForEach(Array(astronauts.keys), id: \.self) { key in
                        if let astronaut = astronauts[key] {
                            NavigationLink(value: astronaut) {
                                Image(astronaut.id)
                                    .resizable()
                                    .scaledToFit()
                                    .containerRelativeFrame(.vertical) {size, axis in
                                        size * 0.8
                                    }
                                Text(astronaut.name)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.lightBackground)
                            .scrollContentBackground(.hidden)
                            //                                .navigationDestination(for: Astronaut.self ) { astronaut in
                            //                                    AstronautView(astronaut: astronaut)
                            //                                }
                            
                        }
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .scrollContentBackground(.hidden)
                    .listRowBackground(Color.darkBackground)
                    
                }
                
                
                .padding(.bottom)
            }
                
            
        }
        //.navigationTitle("Moonshot List")
        .background(.darkBackground)
        .preferredColorScheme(.dark)
        .scrollContentBackground(.hidden)
        .navigationDestination(for: Mission.self ) { mission in
            MissionView(mission: mission, astronauts: astronauts)
        }
        .navigationDestination(for: Astronaut.self ) { astronaut in
            AstronautView(astronaut: astronaut)
        }
    }
        
        
        
        
       
        //        .toolbar("Grid") {
        //
        //        } label: {
        //            Text("Grid View")
        //        }
    }
    
}

#Preview {
    ContentListView()
}
