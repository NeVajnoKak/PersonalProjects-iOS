//
//  ResultPage.swift
//  KNN-App
//
//  Created by Erkebulan Massainov on 27.01.2024.
//

import Foundation
import SwiftUI

struct ResultPage: View{
    
    @Binding var isShowingResultView: Bool
    @Binding var isShowingSecondView: Bool
    
    @Binding var isCircleSelectedOrange: Bool
    @Binding  var isCircleSelectedPurple: Bool
    @Binding var isCircleSelectedBlue: Bool
    
    
    @Binding var k : Int
    
    @State private var features: [Double] = [0.0, 0.0]
    
    @State private var result: String = ""
    
    var trainingData: [TrainingData] = [
        TrainingData(features: [1.0, 2.0], label: "Label 1"),
        TrainingData(features: [2.0, 3.0], label: "Label 2"),
        TrainingData(features: [3.0, 4.0], label: "Label 3")
    ]
    
    var body: some View {
        VStack {
            ZStack{
                Button("Previous"){
                    isShowingSecondView = true
                    isShowingResultView = false
                }
                .background(.orange)
                .foregroundColor(.black)
                .blur(radius: 30)
                
                Button("Previous"){
                    isShowingSecondView = true
                    isShowingResultView = false
                }
                .background(.orange)
                .foregroundColor(.black)
            }
            .padding(.trailing,200)
            HStack {
                Text("value of K: \(k)")
                
            }
            HStack {
                Text("Enter two number:")
                TextField("Feature 1", value: $features[0], formatter: NumberFormatter())
                TextField("Feature 2", value: $features[1], formatter: NumberFormatter())
            }.font(Font.custom("system", size: 20))
            
            Button("Run KNN") {
                let normalizedFeatures = normalize(features: features)
                let distancesEuclidean = trainingData.map { euclideanDistance(x: normalizedFeatures, y: $0.features) }
                let distancesManhattan = trainingData.map { manhattanDistance(x: normalizedFeatures, y: $0.features) }
                let distancesChebyshev = trainingData.map { chebyshevDistance(x: normalizedFeatures, y: $0.features) }
                
                if isCircleSelectedOrange == true{
                    result += "\nEuclidean distances: \(distancesEuclidean)"
                }
                if isCircleSelectedPurple == true{
                    result += "\nManhattan distances: \(distancesManhattan)"
                }
                if isCircleSelectedBlue == true{
                    result += "\nChebyshev distances: \(distancesChebyshev)"
                }
//                result = "Euclidean distances: \(distancesEuclidean)\n===========\nManhattan distances: \(distancesManhattan)\n=========== \nChebyshev distances: \(distancesChebyshev)"
            }
            .foregroundColor(.blue)
            
            Text("\(result)")
                .foregroundColor(.red)
        }
        .font(Font.custom("LondrinaSketch-Regular", size: 40))
        .foregroundStyle(Color.white)
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .padding()
        .background(Color.black)
    }
}
