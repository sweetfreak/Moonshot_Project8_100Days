////
////  CrewView.swift
////  Moonshot_Project8
////
////  Created by Jesse Sheehan on 8/25/24.
////
//
//import SwiftUI
//
//struct CrewView: View {
//    
//    let mission = Mission
//    let astronauts = [String:Astronaut]
//    let crew = [CrewMember]
//    
//    
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack {
//                ForEach(crew, id:  \.role) { crewMember in
//                    NavigationLink {
//                        AstronautView(astronaut: crewMember.astronaut)
//                    } label: {
//                        HStack {
//                            Image(crewMember.astronaut.id)
//                                .resizable()
//                                .frame(width: 104, height: 72)
//                                .clipShape(.capsule)
//                                .overlay(
//                                    Capsule()
//                                        .strokeBorder(.white, lineWidth: 1)
//                                )
//                            VStack(alignment: .leading) {
//                                Text(crewMember.astronaut.name)
//                                    .foregroundStyle(.white)
//                                    .font(.headline)
//
//                                Text(crewMember.role)
//                                    .foregroundStyle(.white.opacity(0.5))
//                            }
//                        }
//                        .padding(.horizontal)
//                    }
//                }
//            }
//        }
//    }
//    
//    init(mission: Mission, astronauts: [String: Astronaut]) {
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
//}
//
//#Preview {
//    CrewView()
//}
