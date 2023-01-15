//
//  ContentView.swift
//  Calculate
//
//  Created by 이선영 on 2023/01/15.
//

import SwiftUI

enum ButtonType {
    case first, second, third, forth, fifth, sixth, seventh, eighth, nineth, zero
    case comma, equal, plus, minus, multiple, devide
    case percent, opposite, clear
}

struct ContentView: View {
    
    @State private var totalNumber : String = "0"
    
    private let buttonData: [[String]] =
    [["7", "8", "9", "x"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", "0", ".", "="]]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(totalNumber)
                        .padding()
                        .font(.system(size: 73))
                        .foregroundColor(.white)
                }
                HStack {
                    Button {
                        totalNumber = "0"
                    } label: {
                        Text("C")
                            .frame(width: 80, height: 80)
                            .background(.gray)
                            .cornerRadius(40)
                            .foregroundColor(.black)
                            .font(.system(size: 33))
                    }
                    Text("+/-")
                        .frame(width: 80, height: 80)
                        .background(.gray)
                        .cornerRadius(40)
                        .foregroundColor(.black)
                        .font(.system(size: 33))
                    Text("%")
                        .frame(width: 80, height: 80)
                        .background(.gray)
                        .cornerRadius(40)
                        .foregroundColor(.black)
                        .font(.system(size: 33))
                    Text("/")
                        .frame(width: 80, height: 80)
                        .background(.orange)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .font(.system(size: 33))
                }
                ForEach(buttonData, id: \.self) {line in
                    HStack {
                        ForEach(line, id : \.self) { row in
                            Button {
                                if totalNumber == "0" {
                                    totalNumber = "7"
                                } else {
                                    totalNumber += "7"
                                }
                            } label: {
                                Text(row)
                                    .frame(width: 80, height: 80)
                                    .background(Color("NumberButton"))
                                    .cornerRadius((40))
                                    .foregroundColor(.white)
                                    .font(.system(size: 33))
                            
                        }
                    }
                }
            }
        
//                HStack {
//                    Text("0")
//                        .frame(width: 80, height: 80)
//                        .background(.gray)
//                        .cornerRadius(40)
//                        .foregroundColor(.white)
//                        .font(.system(size: 33))
//                    Text("0")
//                        .frame(width: 80, height: 80)
//                        .background(.gray)
//                        .cornerRadius(40)
//                        .foregroundColor(.white)
//                        .font(.system(size: 33))
//                    Text(".")
//                        .frame(width: 80, height: 80)
//                        .background(.gray)
//                        .cornerRadius(40)
//                        .foregroundColor(.white)
//                        .font(.system(size: 33))
//                    Text("=")
//                        .frame(width: 80, height: 80)
//                        .background(.orange)
//                        .cornerRadius(40)
//                        .foregroundColor(.white)
//                        .font(.system(size: 33))
//
//                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
