//
//  ContentView.swift
//  SwiftUIText
//
//  Created by 이경후 on 2021/08/18.
//

import SwiftUI

struct ContentView: View {
    // DateFomatter 타입으로 변수 선언
    // 원하는 데이트 출력형태로 만들 수 있음.
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        // 자체적으로 변환해서
        formatter.dateFormat = "YYYY년 M월 d일"
        // 기본적인 값으로 .long , .medium ...
        formatter.dateStyle = .long
        
        return formatter
    }()
    //Date 객체
    var today = Date()
    
    var trueOrFalse: Bool = false
    
    var numbers: Int = 22
    
    var body: some View {
        VStack{
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ")
                // 텍스트 바로 아래적어야 한다. 글자간격!
                .tracking(0)
                //.system을 활용해서 fontStyle & design
                .font(.system(.body, design: .rounded))
                .fontWeight(.black)
                //여러 줄의 글들을 정렬하는 메소드
                .multilineTextAlignment(.center)
                // 멀티라인 - nil 값을 주면 라인 제한 없음
                .lineLimit(nil)
                // 라인간격
                .lineSpacing(1)
                // ... 글 줄임표시 위치를 정할 수 있다.
                .truncationMode(.tail)
                //그림자효과 , 색/둥근정도/x,y축으로 이동정도
                .shadow(color: Color.red, radius: 1.5, x: 5, y: 5)
                //패딩의 위치가 중요하다. 쌓아가는 방식.
                .padding(20)
                .background(Color.yellow)
                // 모서리의 둥근정도를 조정할 수 있음.
                .cornerRadius(30)
                .padding()
                .background(Color.green)
                .cornerRadius(30)
            Text("Lorem Ipsum")
                .padding(8)
                .background(Color.gray)
                .font(.system(.body, design: .rounded))
                .foregroundColor(.white)
            // 위에서 정의한 DateFormatter를 사용
            // 변수, ContentView.formatter
            Text("\(today,formatter: ContentView.dateFormat)")
                .font(.system(size: 15))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            //Bool타입은 항상 String으로 형변환 후에 반환
            Text("[ \(String(trueOrFalse)) ]")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.top,10)
            
            Text("\(numbers)")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.top,10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
