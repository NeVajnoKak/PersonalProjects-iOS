import SwiftUI
import Foundation


struct Result: View {
    @Binding var isShowingResultView: Bool
    var body: some View {
        if(isShowingResultView){
           Text("qwdq")
        }
    }
}
//struct ResultPage1: View {
//    var body: some View {
//        Text("Hello World!")
//    }
//}
struct ResultPage: View {
    
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
            //            ResultPage()
            if !isShowingSecondView && !isShowingResultView{
                //                Log()
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


struct Log : View{
    
    @Binding var isShowingSecondView: Bool
    
    
    
    
    @State private var isExpanded = false
    @State private var selectedOption: Int? = nil
    
    
    let options = ["Hospital", "FootBall", "BaseBall"]
    
    
    
    @State private var isExpanded2 = false
    @State private var selectedOption2: Int? = nil
    
    
    let options2 = ["Blue", "Orange", "White"]
    
    
    var body: some View{
        VStack{
            VStack{
                VStack{
                    HStack{
                        Image("Sun")
                            .padding(.trailing,100)
                            .padding(.bottom,120)
                        VStack{
                            Image("Cloudy")
                                .padding(.bottom,87)
                                .padding(.leading,70)
                            Image("Heart")
                                .padding(.trailing,40)
                                .padding(.bottom,50)
                        }
                        
                    }
                    
                    
                    
                    
                    Text("DataSet")
                        .font(Font.custom("Kanit-Regular", size: 17))
                        .padding(.trailing,150)
                    
                    
                    
                    ZStack{
                        
                        
                        Rectangle()
                            .background(Color.white)
                            .frame(width:300,height: 70)
                            .blur(radius: 30).opacity(0.1)
                        
                        DisclosureGroup(
                            isExpanded: $isExpanded,
                            content: {
                                VStack {
                                    ForEach(0..<options.count) { index in
                                        Button(action: {
                                            self.selectedOption = index
                                            withAnimation {
                                                self.isExpanded.toggle()
                                            }
                                        }) {
                                            Text(options[index])
                                                .padding(.vertical, 8)
                                                .padding(.top,70)
                                                .padding(.bottom,140)
                                                .background(Color.clear)
                                        }
                                    }
                                }
                                .foregroundColor(Color.white)
                                .font(Font.custom("Kanit-Regular", size: 50))
                                .frame(width:600,height:10000)
                                .padding()
                                .background(Color.orange)
                                .ignoresSafeArea()
                                .cornerRadius(8)
                                .onTapGesture {
                                    withAnimation {
                                        self.isExpanded.toggle()
                                    }
                                }
                                .background(Color.clear)
                                .overlay(
                                    Path { path in
                                        
                                        path.move(to: CGPoint(x: 50, y: 50))
                                        path.addLine(to: CGPoint(x: 250, y: 50))
                                        
                                        
                                        path.move(to: CGPoint(x: 50, y: 100))
                                        path.addLine(to: CGPoint(x: 250, y: 100))
                                        
                                        
                                        path.move(to: CGPoint(x: 50, y: 150))
                                        path.addLine(to: CGPoint(x: 250, y: 150))
                                    }
                                        .stroke(Color.white, lineWidth: 2)
                                    
                                )
                                
                            },
                            label: {
                                Text(selectedOption != nil ? options[selectedOption!] : "Преес ми")
                                    .padding(.leading,15)
                                    .font(Font.custom("Kanit-Regular", size: 40))
                                
                            }
                        )
                        .foregroundColor(Color.white)
                        .frame(width:260)
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(Color.white, lineWidth: 1)
                        )
                        .background(Color.clear) // Установите фон для DisclosureGroup как прозрачный
                        
                        
                    }
                    
                }
                
                VStack{
                    Text("Theme")
                        .font(Font.custom("Kanit-Regular", size: 17))
                        .padding(.trailing,150)
                        .padding(.top,35)
                    ZStack{
                        
                        
                        Rectangle()
                            .background(Color.white)
                            .frame(width:300,height: 70)
                            .blur(radius: 30).opacity(0.1)
                        
                        DisclosureGroup(
                            isExpanded: $isExpanded2,
                            content: {
                                VStack {
                                    ForEach(0..<options2.count) { index in
                                        Button(action: {
                                            self.selectedOption2 = index
                                            withAnimation {
                                                self.isExpanded2.toggle()
                                            }
                                        }) {
                                            Text(options2[index])
                                                .padding(.vertical, 8)
                                                .padding(.bottom,250)
                                                .background(Color.clear) // Установите фон текста как прозрачный
                                        }
                                    }
                                }
                                .foregroundColor(Color.white)
                                .font(Font.custom("Kanit-Regular", size: 50))
                                .frame(width:600,height:10000)
                                .padding()
                                .background(Color.orange)
                                .ignoresSafeArea()
                                .cornerRadius(8)
                                .onTapGesture {
                                    withAnimation {
                                        self.isExpanded2.toggle()
                                    }
                                }
                                .background(Color.clear) // Установите фон дочернего представления как прозрачный
                                .overlay(
                                    Path { path in
                                        // Линия для первого элемента
                                        path.move(to: CGPoint(x: 50, y: 50))
                                        path.addLine(to: CGPoint(x: 250, y: 50))
                                        
                                        // Линия для второго элемента
                                        path.move(to: CGPoint(x: 50, y: 100))
                                        path.addLine(to: CGPoint(x: 250, y: 100))
                                        
                                        // Линия для третьего элемента
                                        path.move(to: CGPoint(x: 50, y: 150))
                                        path.addLine(to: CGPoint(x: 250, y: 150))
                                    }
                                        .stroke(Color.white, lineWidth: 2)
                                    
                                )
                                
                            },
                            label: {
                                Text(selectedOption2 != nil ? options2[selectedOption2!] : "Ми ту)")
                                    .padding(.leading,15)
                                    .font(Font.custom("Kanit-Regular", size: 40))
                                
                            }
                        )
                        .foregroundColor(Color.white)
                        .frame(width:260)
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(Color.white, lineWidth: 1)
                        )
                        .background(Color.clear)
                    }
                    
              
                }
            }
            
            HStack{
                VStack{
                    Image("Moon")
                        .padding(.trailing,110)
                }
                VStack{
                    ZStack {
                        
                        Button(action: {
                            isShowingSecondView = true
                        }) {
                            ZStack{
                                Circle()
                                    .frame(width: 81)
                                    .foregroundColor(Color(red:0.25, green: 0.8, blue: 0.88))
                                Circle()
                                    .frame(width: 81)
                                    .foregroundColor(Color(red:0.25, green: 0.8, blue: 0.88))
                                    .blur(radius: 20)
                            }
                        }
                        
                        Image("Arrow 1")
                            .preferredColorScheme(.dark)
                    }
                    .padding(.trailing,50)
                    .padding(.top,100)
                }
            }
            
        }
    }
    
}
    

    
    
    struct Home: View {
        
        // Расстояние
//        @Binding private var isShowingEclideanView: Bool
//        @Binding private var isShowingManhattanView: Bool
//        @Binding private var isShowingChebyshevView: Bool
        
        // Хз какой-то к
        @Binding var k: Int
        
        // Представления
        @Binding var isShowingSecondView: Bool
        @Binding var isShowingResultView: Bool
        
        // Проверка компонентов
        @Binding var isCircleSelectedOrange: Bool
        @Binding  var isCircleSelectedPurple: Bool
        @Binding var isCircleSelectedBlue: Bool
        
        @State var maxHeight: CGFloat = 400
   
        
        @State var sliderProgress: CGFloat = 0
        @State var sliderHeight: CGFloat = 0
        @State var lastDargValue: CGFloat = 0
        
        
        
        
        var body: some View {
            NavigationView {
                
                
                
                VStack{
                    
                    Text("k")
                        .font(Font.custom("LondrinaSketch-Regular", size: 70))
                       
                    // ----------------------
                    ZStack(alignment: .bottom, content: {
                        var cornerRadius: CGFloat = sliderHeight == maxHeight  ? 0: 100
                        Rectangle()
                            .fill(Color(red: 2.17, green: 2.17, blue: 2.17)).opacity(0.3)
                        Rectangle()
                            .fill(Color(red: 0.6, green: 0.29, blue: 1))
                            .frame(height: sliderHeight)
                            .cornerRadius(cornerRadius, corners: [.topLeft,.topRight])
                        
                    })
                    .frame(width: 154,height: maxHeight,alignment: .center)
                    
                    .cornerRadius(35)
                    
                    .overlay(
                        Text("\(Int(sliderProgress * 10))")
                            .font(Font.custom("LondrinaSketch-Regular", size: 70))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                      
                            .cornerRadius(10)
                            .padding(.top,20)
                            
                            

                        )
                    
                    .gesture(DragGesture(minimumDistance: 0)
                        .onChanged({(value) in
                            // getting Drag value
                            
                            let translation = value.translation
                            sliderHeight = -translation.height + lastDargValue
                            // Limiting
                            sliderHeight = sliderHeight > maxHeight ? maxHeight: sliderHeight
                            sliderHeight = sliderHeight >= 0 ? sliderHeight : 0
                            
                            let progress = sliderHeight / maxHeight
                            
                            sliderProgress = progress <= 1.0 ? progress : 1
                            k = Int(sliderProgress * 10)
                            
                        })
                            .onEnded({ (value) in
                                
                                sliderHeight = sliderHeight > maxHeight ? maxHeight: sliderHeight
                                
                                sliderHeight = sliderHeight >= 0 ? sliderHeight : 0
                                
                                lastDargValue = sliderHeight
                                
                                
                                
                                
                            }))
                    
                  
                    
                    HStack{
                        VStack{
                            Button(action: {
                                self.isCircleSelectedOrange.toggle()
                            }) {
                                Circle()
                                    .fill(isCircleSelectedOrange ? Color(red: 1, green: 0.54, blue: 0):Color.white )
                                    .frame(width: 50)
                            }
                            Text("Evklid")
                                .font(Font.custom("LondrinaSketch-Regular",size: 20))
                                
                        }
                        VStack{
                            Button(action: {
                                self.isCircleSelectedPurple.toggle()
                            }) {
                                Circle()
                                    .fill(isCircleSelectedPurple ? Color(red: 0.71, green: 0.49, blue: 1):Color.white )
                                    .frame(width: 50)
                            }
                            
                            Text("Manth")
                                .font(Font.custom("LondrinaSketch-Regular",size: 20))
                        }
                        .padding(.horizontal, 51)
                        VStack{
                            Button(action: {
                                self.isCircleSelectedBlue.toggle()
                            }) {
                                Circle()
                                    .fill(isCircleSelectedBlue ? Color(red: 0, green: 0.87, blue: 1):Color.white )
                                    .frame(width: 50)
                            }
                            Text("Chebis")
                                .font(Font.custom("LondrinaSketch-Regular",size: 20))
                        }
                        
                    }
                    .padding(.top,47)
                    
                }
                
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 0.2, green: 0.2, blue: 0.2).ignoresSafeArea())
                .preferredColorScheme(.dark)
                .navigationBarItems(
                    leading: Button(action: {
                        isShowingSecondView = false
                    }) {
                        
                        ZStack{
                            Text("Previous")
                                .frame(width: 100)
                                .background(Color(red: 0.73, green: 0.4, blue: 0).ignoresSafeArea())
                                .foregroundStyle(.black)
                                .font(Font.custom("LondrinaSketch-Regular",size: 30))
                                .blur(radius: 20)
                            Text("Previous")
                                .frame(width: 100)
                                .background(Color(red: 0.73, green: 0.4, blue: 0).ignoresSafeArea())
                                .foregroundStyle(.black)
                                .font(Font.custom("LondrinaSketch-Regular",size: 30))
                            
                        }
                        
                    },
                    trailing: Button(action: {
                        isShowingResultView = true
                        isShowingSecondView = false
                        
                    }) {
                        ZStack{
                            Text("Next")
                                .frame(width: 100)
                                .background(Color(red: 0, green: 0.68, blue: 0.77).ignoresSafeArea())
                                .foregroundStyle(.black)
                                .font(Font.custom("LondrinaSketch-Regular",size: 30))
                                .blur(radius: 20)
                            
                            Text("Next")
                                .frame(width: 100)
                                .background(Color(red: 0, green: 0.68, blue: 0.77).ignoresSafeArea())
                                .foregroundStyle(.black)
                                .font(Font.custom("LondrinaSketch-Regular",size: 30))
                        }
                        
                    }
                )
                
                
            }
            
        }
        
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

