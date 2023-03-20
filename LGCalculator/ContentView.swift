//
//  ContentView.swift
//  LGCalculator
//
//  Created by Muhammad Tafani Rabbani on 02/02/23.
//

import SwiftUI



struct ContentView: View {
    @State var value : Int? = nil
    @State var tempValue : Int? = nil
    @State var ops : String? = nil
    
    var body: some View {
        VStack {
            
            //Value
            HStack{
                Spacer()
                Text("\(tempValue ?? (value ?? 0))")
                    .padding()
                    .font(.system(size: 80))
            }
            Spacer()
            row2
                
            row3
            
            row4
            
            row5
            
            Spacer()
        }
        .padding()
    }
    
    func clear(){
        tempValue = nil
        value = nil
        ops = nil
        
    }
    
    func division() {
        ops = "bagi"
    }
    
    func addition() {
        ops = "tambah"
    }
    
    func subtraction() {
        ops = "kurang"
    }
    func multiply() {
        ops = "kali"
    }
    
    func numBtn(num : Int){
        if ops != nil{
            if tempValue == nil{
                tempValue = num
            }else{
                tempValue = tempValue!*10 + num
            }
        }else{
            if value == nil{
                value = num
            }else{
                value = value!*10 + num
            }
        }
        
        
    }
    
    
    func show(){
        
        if ops == "bagi"{
            value = value! / tempValue!
        }else if ops == "tambah"{
            value = value! + tempValue!
        }else if ops == "kurang"{
            value = value! - tempValue!
        }else if ops == "kali"{
            value = value! * tempValue!
        }
        
        value = value![]
        tempValue = nil
    }
    
    
    
    var row2 : some View{
        //Row2
        HStack(alignment:.center,spacing: 25){
            Button {
                //clear value to nil
                numBtn(num: 7)
            } label: {
                ButtonCalculatorView(text: "7", color: .orange)
            }
            Button {
                //divide value
                numBtn(num: 8)
            } label: {
                ButtonCalculatorView(text: "8", color: .orange)
            }
            Button {
                //divide value
                numBtn(num: 9)
            } label: {
                ButtonCalculatorView(text: "9", color: .orange)
            }
            Button {
                //divide value
                multiply()
            } label: {
                ButtonCalculatorView(image: "multiply", color: .gray)
            }
            
        }
    }
    
    var row3: some View{
        //row3
        HStack(alignment:.center,spacing: 25){
            Button {
                //clear value to nil
                numBtn(num: 4)
            } label: {
                ButtonCalculatorView(text: "4", color: .orange)
            }
            Button {
                //divide value
                numBtn(num: 5)
            } label: {
                ButtonCalculatorView(text: "5", color: .orange)
            }
            Button {
                //divide value
                numBtn(num: 6)
            } label: {
                ButtonCalculatorView(text: "6", color: .orange)
            }
            Button {
                //divide value
                subtraction()
            } label: {
                ButtonCalculatorView(image: "minus", color: .gray)
            }
            
        }
    }
    
    var row4 : some View{
        //row4
        HStack(alignment:.center,spacing: 25){
            Button {
                //clear value to nil
                numBtn(num: 1)
            } label: {
                ButtonCalculatorView(text: "1", color: .orange)
            }
            Button {
                //divide value
                numBtn(num: 2)
            } label: {
                ButtonCalculatorView(text: "2", color: .orange)
            }
            Button {
                //divide value
                numBtn(num: 3)
            } label: {
                ButtonCalculatorView(text: "3", color: .orange)
            }
            Button {
                //divide value
                addition()
            } label: {
                ButtonCalculatorView(image: "plus", color: .gray)
            }
            
        }
    }
    
    var row5 : some View{
        //row5
        HStack(alignment:.center,spacing: 25){
            Button {
                //clear value to nil
                clear()
            } label: {
                ButtonCalculatorView(text: "C", color: .gray)
            }
            Button {
                //clear value to nil
                numBtn(num: 0)
            } label: {
                ButtonCalculatorView(text: "0", color: .orange)
            }
            Button {
                //divide value
                show()
            } label: {
                ButtonCalculatorView(image: "equal", color: .gray)
            }
            Button {
                //divide value
                division()
            } label: {
                ButtonCalculatorView(image: "divide", color: .gray)
            }
            
        }
    }
}

struct ButtonCalculatorView:View{
    var text:String?
    var image:String?
    var color:Color
    var body: some View{
        ZStack{
            Circle()
                .frame(width: 60,height: 60)
                .foregroundColor(color)
            if let img = image{
                Image(systemName: img)
                    .foregroundColor(.white)
                    .font(.system(size: 45))
                    
                
                    
            }else if let txt = text{
                Text(txt)
                    .foregroundColor(.white)
                    .font(.system(size: 45))
                    
                
                    
            }
            
            
        }
        
        
    }
}




extension Int{
    subscript()->Int{
        return self%10
    }
}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
