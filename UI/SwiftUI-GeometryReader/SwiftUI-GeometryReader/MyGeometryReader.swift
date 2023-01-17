import SwiftUI

enum Index{
    case one,two,three
}

struct MyGeometryReader : View {
    
    @State var index : Index = .three
    
    var body: some View{
        // geometryReader를 사용할 때는 (변수) in 을 함께
        // 작성하고 해당 변수를 이용하여 접근
        GeometryReader{ display in
            
            VStack(spacing : 0){
                
                Button(action: {
                    print("1번이 커질거에요!")
                    withAnimation{
                        //bool타입이 아닌 enum으로 만든 Index를 이용하여 접근
                        self.index = .one
                    }
                }){
                    Text("1")
                        .fontWeight(.black)
                        .frame(width:display.size.width/8,height: display.size.height/3)
                        //각각의 메소드들 안에도 조건문을 만들 수 있다!
                        
                        .padding(.horizontal,self.index == .one ? 50: 0)
                        .background(Color.blue)
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    print("2번이 커질거에요!")
                    withAnimation{
                        self.index = .two
                    }
                }){
                    Text("2")
                        .fontWeight(.black)
                        .frame(width:display.size.width/8,height: display.size.height/3)
                        .padding(.horizontal,self.index == .two ? 50: 0)
                        .background(Color.green)
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    print("3번이 커질거에요!")
                    withAnimation{
                        self.index = .three
                    }
                }){
                    Text("3")
                        .fontWeight(.black)
                        .frame(width:display.size.width/8,height: display.size.height/3)
                        .padding(.horizontal,self.index == .three ? 50: 0)
                        .background(Color.red)
                        .foregroundColor(.white)
                }
            }
            .frame(width : display.size.width,
                   height : display.size.height,
                   alignment : .center)
        }
        .background(Color.yellow)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MyGeoReaderVstack_Previews: PreviewProvider {
    static var previews: some View {
        MyGeometryReader()
    }
}



