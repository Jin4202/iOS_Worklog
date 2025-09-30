//
//  Author: Jinseok Heo
//

import SwiftUI

struct ContentView: View {
    @State private var goToAddWorkout = false
    @State var workouts: [Workout] = [
        Workout(name: "Push", date: "Mon 2", numberOfSets: 15, numOfMusHits: 3, numOfPRs: 2)
    ]
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    HStack {
                        Button {
                            print("Clicked edit")
                        } label: {
                            Text("Edit")
                                .foregroundStyle(.cyan)
                        }
                        
                        Spacer()
                        
                        Button {
                            print("Clicked plus")
                            goToAddWorkout = true
                        } label: {
                            Image(systemName: "plus.circle")
                                .foregroundStyle(.cyan)
                        }
                    }
                    Text("June Log")
                        .font(.system(size: 35))
                        .bold()
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 10)
                    
                    HStack {
                        Text("June 2025")
                            .foregroundStyle(.gray)
                        Spacer()
                        Text("1 Workout")
                            .foregroundStyle(.gray)
                    }.padding(.top, 4)
                    ScrollView(.vertical, showsIndicators: true) {
                        VStack {
                            ForEach(workouts) { workout in
                                WorkoutCard(geometry: geometry, workout: workout)
                            }
                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(.black)
                .navigationDestination(isPresented: $goToAddWorkout) {
                    NewWorkoutView{ workout in
                        workouts.append(workout)
                    }
                }
            }
            .navigationTitle("Main")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct WorkoutCard: View {
    let geometry: GeometryProxy
    let workout: Workout
    
    var body: some View {
        let name = workout.name
        let parts = workout.date.split(separator: " ")
        let day = String(parts[0])
        let dateNum = parts.count > 1 ? String(parts[1]) : ""
        let numberOfSets = workout.numberOfSets
        let numOfMusHits = workout.numOfMusHits
        let numOfPRs = workout.numOfPRs
        
        
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(red: 0.1, green: 0.1, blue: 0.1))
                .frame(height: geometry.size.height * 0.2)
            HStack(alignment: .top) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.clear)
                        .stroke(.white)
                        .frame(width: geometry.size.width * 0.125, height: geometry.size.width * 0.125)
                        
                    VStack {
                        Text(day)
                            .foregroundStyle(.white)
                            .padding(.top, 1)
                        Text(dateNum)
                            .foregroundStyle(.white)
                            .padding(.bottom, 1)
                    }
                }.frame(width: geometry.size.width * 0.15, height: geometry.size.width * 0.15)
                    .padding(.trailing, 4)
                VStack(alignment: .leading) {
                    Text(name)
                        .bold()
                        .font(.system(size: 25))
                        .foregroundStyle(.white)
                    Text("\(numberOfSets) total sets")
                        .foregroundStyle(.white)
                    Text("\(numOfMusHits) Muscles Hit")
                        .foregroundStyle(.white)
                    Text("\(numOfPRs) PRs")
                        .foregroundStyle(.white)
                }
                Spacer()
                Text("90 min")
                    .foregroundStyle(.gray)
            }.padding(10)
        }
    }
}

struct Workout: Identifiable {
    var id: UUID = UUID()

    var name: String = ""
    var date: String = ""
    var numberOfSets: Int = 0
    var numOfMusHits: Int = 0
    var numOfPRs: Int = 0
}

#Preview {
    ContentView()
}
