//
//  MissionView.swift
//  Moonshot_Project8
//
//  Created by Jesse Sheehan on 8/23/24.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember: Hashable {
        let role: String
        let astronaut: Astronaut
    }
        
    let mission: Mission
    let crew: [CrewMember]
    
    //@State private var path = NavigationPath()
    
    var body: some View {
      //  NavigationStack {
            ScrollView {
                
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal) { width, axis in
                            width * 0.6
                        }
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.lightBackground)
                        .padding(.vertical)
                    
                    VStack(alignment: .leading) {
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        //Challenge pt 1
                        Text("Launch Date: \(mission.longerFormattedLaunchDate)")
                            .font(.title3.bold())
                        Spacer()
                        
                        
                        Text(mission.description)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            
                            ForEach(crew, id:  \.role) { crewMember in
                                NavigationLink(value: crewMember) {
                                    HStack {
                                        Image(crewMember.astronaut.id)
                                            .resizable()
                                            .frame(width: 104, height: 72)
                                            .clipShape(.capsule)
                                            .overlay(
                                                Capsule()
                                                    .strokeBorder(.white, lineWidth: 1)
                                            )
                                        VStack(alignment: .leading) {
                                            Text(crewMember.astronaut.name)
                                                .foregroundStyle(.white)
                                                .font(.headline)
                                                .accessibilityLabel(crewMember.astronaut.name.replacingOccurrences(of: ".", with: ""))
                                            
                                            Text(crewMember.role)
                                                .foregroundStyle(.white.opacity(0.5))
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                                .navigationDestination(for: CrewMember.self ) { crewMember in
                                    AstronautView(astronaut: crewMember.astronaut)
                                }
                            
                                
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
            .navigationTitle(String(mission.displayName))
            .navigationBarTitleDisplayMode(.large)
            .background(.darkBackground)
   //     }
    }
    
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}


#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[1], astronauts: astronauts)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
