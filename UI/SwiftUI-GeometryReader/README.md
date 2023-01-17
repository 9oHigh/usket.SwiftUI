## GeometryReader 
  - 고정된 값을 가지는 것이 아닌 화변의 비율에 맞게 조정할 수 있게 해주는 함수다.
  - geometryReader{ (변수) in (code)} 여기서 변수는 내부에서 지속적으로 사용된다.
  - Xcode 12 부터는 GR을 사용할 때 디폴트 값이 정해지지 않게 되어 해당 뷰 아래에 속성 메소드를 다음과 같이 붙여야 한다. ( .frame(width: display.size.width, height: display.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) )
  - enum : 열거형으로 SwiftUI에서는 그 자체로 고유값을 가지므로 값을 줄 필요는 없다. 이를 이용하여 각각의 버튼의 클릭을 활용 할 수도 있다.
