//
//  MyCardView.swift
//  SwiftUI-ScrollPage
//
//  Created by 이경후 on 2021/08/18.
//

import SwiftUI

struct MySubCardView : View {
    
    var cardColor : Color
    var cardName : String
    var cardImage : String
    var startPoint : String
    var endPoint : String
    
    init(_cardColor:Color,_cardName:String,_cardImage:String,_startPoint:String,_endPoint:String ) {
        cardColor = _cardColor
        cardName = _cardName
        cardImage = _cardImage
        startPoint = _startPoint
        endPoint = _endPoint
    }
    
    var body: some View{
        HStack{
            Spacer()
            Image(systemName: cardImage)
                .font(.system(size: 40))
                .foregroundColor(.white)
                .padding(10)
            
            VStack(alignment: .leading,spacing: 10){
                Divider().opacity(0)
                Text(cardName)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                
                Text("\(startPoint) ~ \(endPoint)")
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(cardColor)
        .cornerRadius(20)
    }
}

struct MySubCardView_Previews: PreviewProvider {
    static var previews: some View {
        MySubCardView(_cardColor: Color.purple,_cardName: "Burnning Study",_cardImage: "flame.fill",_startPoint: "8AM",_endPoint: "9AM")
    }
}
