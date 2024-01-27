//
//  SecondView.swift
//  KNN-App
//
//  Created by Erkebulan Massainov on 27.01.2024.
//

import Foundation
import SwiftUI

struct SecondView: View {
    @Binding var isCircleSelectedOrange: Bool
    @Binding var isCircleSelectedPurple: Bool
    @Binding var isCircleSelectedBlue: Bool
    
    @Binding var isShowingSecondView: Bool
    @Binding var isShowingResultView: Bool
    @Binding var k: Int
    var body: some View {
        VStack {
            if showSecondView(isShowingSecondView) {
                Home(k: $k, isShowingSecondView: $isShowingSecondView, isShowingResultView: $isShowingResultView,isCircleSelectedOrange: $isCircleSelectedOrange, isCircleSelectedPurple: $isCircleSelectedPurple,isCircleSelectedBlue:$isCircleSelectedBlue)

            }
            else if(showResultView(isShowingResultView)){
                ResultPage(isShowingResultView: $isShowingResultView, isShowingSecondView: $isShowingSecondView,isCircleSelectedOrange:$isCircleSelectedOrange,isCircleSelectedPurple: $isCircleSelectedPurple, isCircleSelectedBlue: $isCircleSelectedBlue, k: $k)
            }
            else {
                ContentView()
            }
        }
    }
}
