//
//  Home.swift
//  KNN-App
//
//  Created by Erkebulan Massainov on 27.01.2024.
//

import Foundation
import SwiftUI

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
