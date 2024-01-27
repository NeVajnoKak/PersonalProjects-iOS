//
//  Log.swift
//  KNN-App
//
//  Created by Erkebulan Massainov on 27.01.2024.
//

import Foundation
import SwiftUI

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
