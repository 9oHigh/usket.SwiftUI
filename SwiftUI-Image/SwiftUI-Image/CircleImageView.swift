//
//  CircleImageView.swift
//  SwfitUIImage
//
//  Created by 이경후 on 2021/08/18.
//

import SwiftUI

struct CircleImageView: View {
    var body: some View{
        /*
         systemName은 sf symbol인 애플에서 제공하는 이미지를 사용할 수 있다.
        Image(systemName: "flame.fill")
            .font(.system(size: 200))
            .foregroundColor(.red)
            .shadow(color: .yellow, radius: 2, x: 2, y: 10)
         */
        //이미지 메소드 선언
        Image("myImage")
            //화면에 맞게 사이즈를 조정하는 메소드
            .resizable()
            // .aspectRatio(contentMode: .fill)와 같이
            // 비율을 일정하게 해주는 메소드
            .scaledToFill()
            // 해당 프레임의 폭과 높이를 정할 수 있는 메소드
            .frame(width: 300, height: 300)
            // 해당되는 이미지의 모양을 결정할 수 있는 메소드
            // Clipped() 메소드도 존재한다.
            .clipShape(Circle())
            //그림자효과
            .shadow(color: .gray, radius: 20, x: 5, y: 10)
            /*
             뷰위에 뷰를 쌓을 수 있는 메소드
             stroke는 도넛형태로 만들수있게 해주는 메소드다.
             순서대로 이미지 -> 가장 안쪽의 원부터 바깥 쪽의 원 -> 텍스트
             
            */
            .overlay(Circle()
                        .foregroundColor(.black)
                        .opacity(0.2))
            .overlay(Circle().stroke(Color.red,lineWidth: 12))
            .padding()
            .overlay(Circle().stroke(Color.orange,lineWidth: 8))
            .padding()
            .overlay(Circle().stroke(Color.yellow,lineWidth: 4))
            .overlay(
                Text("9oHigh")
                    .foregroundColor(.white)
                    .font(.system(size: 45))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            )
        
        //비율
        // aspectRatio -> fill 이면 실제 채워진
        // 공간보다 작은 부분이 이미지가 차지하게 되고
        // 해당되는 부분을 잘라내는 기능이 clipped에 있다.
        //.clipped()
        // 가장자리까지 채우기 위한 메소드 (상,하,좌우 모두 가능하다)
        //.edgesIgnoringSafeArea(.all)
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView()
    }
}
