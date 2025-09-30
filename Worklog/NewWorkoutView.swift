//
//  NewWorkoutView.swift
//  Worklog
//
//  Created by Jinseok Heo on 9/29/25.
//
import SwiftUI

struct NewWorkoutView: View {
    @State private var name: String = ""
    @State private var sets: String = ""
    @State private var prs: String = ""
    @State private var date: String = ""
    
    let saveWorkout: (Workout) -> Void
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 0.1, green: 0.1, blue: 0.1))
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
                VStack(alignment: .leading) {
                    Button {
                        print("Back")
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title3)
                            .foregroundStyle(Color.blue)
                    }
                    .padding()
                    
                    Text("Enter New Workout")
                        .font(Font.title)
                        .foregroundStyle(Color.white)
                        .frame(width: geometry.size.width)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.black))
                            .frame(height: 200)
                        
                        VStack(alignment: .center) {
                            TextField("", text: $name, prompt: Text("enter name")
                                .foregroundColor(.gray))
                                .textFieldStyle(.plain)
                                .background(.black)
                                .foregroundColor(.white)
                            Divider()
                                .background(.white)
                            TextField("", text: $sets, prompt: Text("number of sets")
                                .foregroundColor(.gray))
                                .textFieldStyle(.plain)
                                .background(.black)
                                .foregroundColor(.white)
                            Divider()
                                .background(.white)
                            TextField("", text: $prs, prompt: Text("number of PRs")
                                .foregroundColor(.gray))
                                .textFieldStyle(.plain)
                                .background(.black)
                                .foregroundColor(.white)
                            Divider()
                                .background(.white)
                            TextField("", text: $date, prompt: Text("Weekday Date")
                                .foregroundColor(.gray))
                                .textFieldStyle(.plain)
                                .background(.black)
                                .foregroundColor(.white)
                        }
                        .foregroundStyle(Color.white)
                        .padding(25)
                    }
                    .padding([.horizontal, .bottom])
                    Button {
                        saveWorkout(
                            Workout(id: UUID(), name: name, date: date, numberOfSets: Int(sets) ?? 0, numOfMusHits: 0, numOfPRs: Int(prs) ?? 0)
                        )
                        dismiss()
                    } label: {
                        Text("Finish")
                            .font(Font.title3)
                            .foregroundStyle(Color.blue)
                            .frame(width: geometry.size.width)
                    }
                }
                
            }
            .padding(10)
            .frame(width: geometry.size.width, height: geometry.size.height)
                .background(.black)
        }
        .navigationTitle("New Workout")
    }
}

#Preview {
    NewWorkoutView(saveWorkout: { _ in })
}
