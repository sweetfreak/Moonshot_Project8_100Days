//
//  AstronautView.swift
//  Moonshot_Project8
//
//  Created by Jesse Sheehan on 8/23/24.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    @State private var missionList: [Mission] = []
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image(astronaut.id)
                        .resizable()
                        .scaledToFit()
                        
                        .containerRelativeFrame(.horizontal) { size, axis in
                            size * 0.8 //that's 0.8 of the horizontal axis, in this scenario
                        }
                    Text(astronaut.description)
                        .padding()
                }
                
                HStack {
                    ForEach(missionList) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                            //NOTE ^^ THIS COULD LEAD TO A FOREVER LOOP where the user never goes back to the main menu
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
                
            }
            .background(.darkBackground)
            .navigationTitle(astronaut.name)
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(perform: findMissions)

        
    }
        
    
    func findMissions() {
            
        for mission in missions {
            for member in mission.crew {
                if member.name == astronaut.id {
                    missionList.append(mission)
                }
                
            }
            
        }
    }
    
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return AstronautView(astronaut: astronauts["aldrin"]!)
        .preferredColorScheme(.dark)
}
