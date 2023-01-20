//
//  ContentView.swift
//  Calculate
//
//  Created by 이선영 on 2023/01/15.
//

import SwiftUI

enum ButtonType:String {
    case first, second, third, forth, fifth, sixth, seventh, eighth, nineth, zero
    case comma, equal, plus, minus, multiple, devide
    case percent, opposite, clear
    var buttonDisplayName:String {
        switch self {
        case .first :
            return "1"
        case .second :
            return "2"
        case .third :
            return "3"
        case .forth :
            return "4"
        case .fifth :
            return "5"
        case .sixth:
            return "6"
        case .seventh:
            return "7"
        case .eighth:
            return "8"
        case .nineth:
            return "9"
        case .zero:
            return "0"
        case .comma:
            return "."
        case .equal:
            return "="
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .multiple:
            return "x"
        case .devide:
            return "÷"
        case .percent:
            return "%"
        case .opposite:
            return "+/-"
        case .clear:
            return "C"
        }
    }
    var backgroundColor: Color {
        switch self {
        case .first,.second,.third,.forth,.fifth,.sixth,.seventh,.eighth,.nineth,.zero,.comma:
            return Color("Pink")
        case .equal,.plus,.minus,.multiple,.devide:
            return Color("DarkGray")
        case .percent,.opposite,.clear:
            return Color("Gray")
        }
    }
    var forgroundColor: Color {
        switch self {
        case .first,.second,.third,.forth,.fifth,.sixth,.seventh,.eighth,.nineth,.zero,.comma,.equal,.plus,.minus,.multiple,.devide:
            return Color .white
        case .percent,.opposite,.clear:
            return Color .black
        }
    }
}

struct ContentView: View {
    
    @State private var totalNumber : String = "0"
    @State var tempNumber: Int = 0
    @State var Percent: Double = 0.01
    @State var operatorType: ButtonType = .clear
    @State var isNotEditing: Bool = true
    
    private let buttonData: [[ButtonType]] =
    [[.clear, .opposite, .percent, .devide],
     [.seventh, .eighth, .nineth, .multiple],
     [.forth, .fifth, .sixth, .minus],
     [.first, .second, .third, .plus],
     [.zero, .comma, .equal]]
    
    var body: some View {
        ZStack {
            Color("LightPink").ignoresSafeArea()
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(totalNumber)
                        .padding()
                        .font(.system(size: 70))
                        .foregroundColor(.black)
                }
//                HStack {
//                    Button {
//                        totalNumber = "0"
//                    } label: {
//                        Text("C")
//                            .frame(width: 80, height: 80)
//                            .background(.gray)
//                            .cornerRadius(40)
//                            .foregroundColor(.black)
//                            .font(.system(size: 33))
//                    }
//                    Text("+/-")
//                        .frame(width: 80, height: 80)
//                        .background(.gray)
//                        .cornerRadius(40)
//                        .foregroundColor(.black)
//                        .font(.system(size: 33))
//                    Text("%")
//                        .frame(width: 80, height: 80)
//                        .background(.gray)
//                        .cornerRadius(40)
//                        .foregroundColor(.black)
//                        .font(.system(size: 33))
//                    Text("/")
//                        .frame(width: 80, height: 80)
//                        .background(.orange)
//                        .cornerRadius(40)
//                        .foregroundColor(.white)
//                        .font(.system(size: 33))
//                }
                ForEach(buttonData, id: \.self) {line in
                    HStack {
                        ForEach(line, id : \.self) { item in
                            Button {
//                                if totalNumber == "0" {
//                                        totalNumber = "0"
                                if isNotEditing {
                                    if item == .clear {
                                        isNotEditing = true
                                        totalNumber = "0"
                                        operatorType = .clear

                                    } else if item == .plus ||
                                                item == .minus ||
                                                item == .multiple ||
                                                item == .devide ||
                                                item == .percent {
                                        totalNumber = "Error" //입력 값 없이 연산 선택 시 에러 메세지
                                    } else if item == .opposite {
                                        operatorType = .opposite
                                        if totalNumber ==  "0" {
                                            totalNumber = "Error"
                                        } else {
                                            tempNumber = Int(totalNumber) ?? 0
                                            if (0 > Int(totalNumber) ?? 0) {
                                                totalNumber = String(+tempNumber)
                                            }
                                            totalNumber = String(-tempNumber)
                                        }
                                    } else {
                                        totalNumber = item.buttonDisplayName
                                        isNotEditing = false
                                    }
                                    
                                } else {
                                    // 첫 번째 숫자 연산자 두 번째 숫자
                                    if item == .clear {
                                        isNotEditing = true
                                        totalNumber = "0"
                                        operatorType = .clear
                                    } else if item == .plus {
                                        tempNumber = Int(totalNumber) ?? 0 //숫자를 저장
                                        operatorType = .plus //더하기를 한다
//                                        totalNumber = "0" // 남은 숫자를 초기화 한다
                                        isNotEditing = true
                                    } else if item == .multiple {
                                        tempNumber = Int(totalNumber) ?? 0
                                        operatorType = .multiple
//                                        totalNumber = "0"
                                        isNotEditing = true
                                    } else if item == .minus {
                                        tempNumber = Int(totalNumber) ?? 0
                                        operatorType = .minus
//                                        totalNumber = "0"
                                        isNotEditing = true
                                    } else if item == .devide {
                                        tempNumber = Int(totalNumber) ?? 0
                                        operatorType = .devide
//                                        totalNumber = "0"
                                        isNotEditing = true
                                    } else if item == .percent {
                                        tempNumber = Int(totalNumber) ?? 0
                                        operatorType = .percent
                                        isNotEditing = true
                                    } else if item == .opposite {
                                        tempNumber = Int(totalNumber) ?? 0
                                        if (0 > Int(totalNumber) ?? 0) {
                                            totalNumber = String(+tempNumber)
                                            isNotEditing = true
                                        }
                                        totalNumber = String(-tempNumber)
                                        isNotEditing = true
                                        
                                    } else if item == .equal { //결과
                                        if operatorType == .plus {
                                            totalNumber = String((Int(totalNumber) ?? 0) + tempNumber)
                                        } else if operatorType == .multiple {
                                            totalNumber = String((Int(totalNumber) ?? 0) * tempNumber)
                                        } else if operatorType == .minus {
                                            totalNumber = String(tempNumber - (Int(totalNumber) ?? 0))
                                        } else if operatorType == .devide {
                                            totalNumber = String(tempNumber / (Int(totalNumber) ?? 0))
                                        } else if operatorType == .percent {
                                            totalNumber = String(tempNumber + ((Int(totalNumber) ?? 0) * Int(Double(Percent))))
                                        }
                                        
                                    } else {
                                        totalNumber += item.buttonDisplayName
                                    }
                                }
                            } label: {
                                Text(item.buttonDisplayName)
//                                    .bold()
                                    .frame(width: item == .some(.zero) ? 160 : 77, height: 77)
//                                    .frame(width: calculatebuttonWidth(button: item), height: calculatebuttonHeight(button: item))
                                    .background(item.backgroundColor)
                                    .cornerRadius((40))
                                    .foregroundColor(item.forgroundColor)
                                    .font(.system(size: 33))
                            
                            }
                        }
                    }
                }
            }
        }
    }
    private func calculatebuttonWidth(button buttonType: ButtonType) -> CGFloat { // (전체 너비 - 5*10)/4
        switch buttonType {
        case .zero:
            return (UIScreen.main.bounds.width - 5*10) / 4 * 2
        default:
            return ((UIScreen.main.bounds.width - 5*10) / 4)
        }
    }
    private func calculatebuttonHeight(button: ButtonType) -> CGFloat {
       return (UIScreen.main.bounds.width - 5*10) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
