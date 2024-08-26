
import SwiftUI



struct ContentListView: View {
    
    //type notation needed because it otherwise doesn't know what "T" is
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Text("Missions")
                        .font(.title.bold())
                    List {
                        ForEach(missions) { mission in
                            
                            NavigationLink {
                                MissionView(mission: mission, astronauts: astronauts)
                            } label: {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.7))
                            }
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
                                
                                NavigationLink {
                                    AstronautView(astronaut: astronaut)
                                } label: {
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

                            }
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .scrollContentBackground(.hidden)
                        .listRowBackground(Color.darkBackground)
                            
                    }
                   

                    .padding(.bottom)
                }
            }
            .navigationTitle("Moonshot List")
            
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .scrollContentBackground(.hidden)

        
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
