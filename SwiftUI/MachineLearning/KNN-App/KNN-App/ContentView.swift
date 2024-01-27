import SwiftUI
import Foundation


struct ContentView: View {
    
    // Расстояние
    @State private var isCircleSelectedOrange = false
    @State private var isCircleSelectedPurple = false
    @State private var isCircleSelectedBlue = false
    
    // Представления
    @State private var isShowingSecondView = false
    @State private var isShowingResultView = false
    
    // Хз какой-то к
    @State private var k:Int = 0
    
    var body: some View {
        
        VStack {
            if !isShowingSecondView && !isShowingResultView{
                Log(isShowingSecondView: $isShowingSecondView)
                
            } else if(isShowingSecondView) {
                SecondView(isCircleSelectedOrange: $isCircleSelectedOrange, isCircleSelectedPurple: $isCircleSelectedPurple, isCircleSelectedBlue: $isCircleSelectedBlue,isShowingSecondView: $isShowingSecondView, isShowingResultView: $isShowingResultView,k:$k)
            }
            if(isShowingResultView){
                ResultPage(isShowingResultView: $isShowingResultView, isShowingSecondView: $isShowingSecondView,isCircleSelectedOrange:$isCircleSelectedOrange,isCircleSelectedPurple: $isCircleSelectedPurple, isCircleSelectedBlue: $isCircleSelectedBlue, k: $k)
            }
        }
    }
}


func showResultView(_ isShowingResultView: Bool) -> Bool
{
    
    return isShowingResultView
}
func showSecondView(_ isShowingSecondView: Bool) -> Bool
{
    
    return isShowingSecondView
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


#Preview {
    ContentView()
}



    



struct TrainingData {
    var features: [Double]
    var label: String
}

func normalize(features: [Double]) -> [Double] {
    return features
}

func euclideanDistance(x: [Double], y: [Double]) -> Double {
    precondition(x.count == y.count, "Arrays must have equal length")
    var sum = 0.0
    for i in 0..<x.count {
        let diff = x[i] - y[i]
        sum += diff * diff
    }
    return sqrt(sum)
}

func manhattanDistance(x: [Double], y: [Double]) -> Double {
    precondition(x.count == y.count, "Arrays must have equal length")
    var sum = 0.0
    for i in 0..<x.count {
        sum += abs(x[i] - y[i])
    }
    return sum
}

func chebyshevDistance(x: [Double], y: [Double]) -> Double {
    precondition(x.count == y.count, "Arrays must have equal length")
    var maxDiff = 0.0
    for i in 0..<x.count {
        let diff = abs(x[i] - y[i])
        maxDiff = max(maxDiff, diff)
    }
    return maxDiff
}

