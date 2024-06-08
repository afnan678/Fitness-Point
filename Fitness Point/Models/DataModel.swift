//
//  DataModel.swift
//  Fitness Point
//
//  Created by Afnan Ahmed on 04/01/2024.
//

import Foundation
import UIKit

var types = "Arm"
var indexs = 0

struct TrainingData {
   
    var title : String
    var TotalExercise: String
    var time: String
    var caleries: String
    var Train : [Training]
    
    init(title: String, TotalExercise: String, time: String, caleries: String, Train: [Training]) {
        self.title = title
        self.TotalExercise = TotalExercise
        self.time = time
        self.caleries = caleries
        self.Train = Train
    }
}

struct Training {
    var titel : String
    var Kcal : String
    var Times : String
    var state: String
    var image: String

    init(titel: String, Kcal: String, Times: String, state: String, image: String) {
        self.titel = titel
        self.Kcal = Kcal
        self.Times = Times
        self.state = state
        self.image = image
    }
}


var appdata: [TrainingData] = [
    
    TrainingData(title: "Arm", TotalExercise: "30", time: "30", caleries: "859", Train: [Training(titel: "Exercises with Jumping Rope", Kcal: "110 kcal", Times: "10 min", state: "Beginner", image: "Arm1"),Training(titel: "Exercises with Dumbbell Workout", Kcal: "110 kcal", Times: "10 min", state: "Beginner", image: "Arm2"),Training(titel: "Exercises For Bye Flabby Arms", Kcal: "110 kcal", Times: "10 min", state: "Beginner", image: "Arm3")]),
    TrainingData(title: "Belly", TotalExercise: "40", time: "30", caleries: "237", Train: [Training(titel: "Exercises with Curtsy Lungs", Kcal: "110 kcal", Times: "10 min", state: "Beginner", image: "Belly1"),Training(titel: "Straight Legs Raise Right", Kcal: "110 kcal", Times: "10 min", state: "Beginner", image: "Belly2"),Training(titel: "Straight Legs Raise Left", Kcal: "110 kcal", Times: "10 min", state: "Beginner", image: "Belly3")]),
    TrainingData(title: "Butt", TotalExercise: "16", time: "35", caleries: "456", Train: [Training(titel: "Exercises kneeling Lunge Stretch Left", Kcal: "110 kcal", Times: "10 min", state: "Beginner", image: "Butt1"),Training(titel: "Exercises Prone Flutter Kicks", Kcal: "110 kcal", Times: "10 min", state: "Beginner", image: "Butt2"),Training(titel: "Exercises kneeling Lunge Stretch Right", Kcal: "110 kcal", Times: "10 min", state: "Beginner", image: "Butt3")]),
    TrainingData(title: "Full Body", TotalExercise: "18", time: "25", caleries: "986", Train: [Training(titel: "Exercises Standing Bicycle Crunches", Kcal: "110 kcal", Times: "10 min", state: "Beginner", image: "Body1"),Training(titel: "Exercises Standing Oblique Crunches Right", Kcal: "110 kcal", Times: "10 min", state: "Beginner", image: "Body2"),Training(titel: "Exercises Standing Oblique Crunches Left", Kcal: "110 kcal", Times: "10 min", state: "Beginner", image: "Body3")])
]
