# iOS App Development using SwfitUI🧑🏻‍💻
##### 👉 Learn the basics of app development using SwiftUI
#
##### 👉 The curriculum will be conducted in the order of uploaded videos of YouTube by  "개발하는 정대리"
#
###### 1. SwiftUIBasicState - @State
- 구조체 내부에서 변경이 불가능하기 때문에 @State 속성을 이용하여 특정한 값을 저장하는데 사용한다.
- 재할당하여 값을 바꿀 수 없다.
- 재할당을 하기 위해서는 @Binding 속성을 사용해야한다.

###### 2. SwiftUIBasicBinding - @Binding
- @State 속성으로 선언된 프로퍼티와 연결되어 있다고 생각하면 된다.
- 다른 뷰에서 이 프로퍼티를 사용하기 위해 @Binding을 사용한다.
- 사용시에는 $를 앞에 붙여주어 @Binding 속성이 부여된 프로퍼티임을 나타낸다. 다만, 그 값 자체를 출력하여 뷰에 보여줄때는 붙이지 않아도 된다.

###### 3. SwiftUI-WebView - UIViewRepresentable
- UIViewRepresentable를 이용하여 사용.
- SwiftUI와 WebKit를 활용 (기존의 UIKit을 SwiftUI에 맞게 Wrapping).
- 초기 설정으로는 AppTransSecuritySetting 파일에 있는 이미지와 같이 info.plist에서 설정하면 된다.

###### 4. SwiftUI-Text
- Text( )의 메소드를 이용하는 방법

###### 5. SwiftUI-Image
- sf symbol을 활용하는 방법
- Image( )의 메소드를 이용하여 원하는 모양과 색, 오버레이 등을 활용하는 방법

###### 6. SwiftUI-Stack
- HStack / VStack / ZStack의 원리와 사용법

###### 7. SwiftUI-ScrollPage ( ScrollView )
- Button : 액션에 해당하는 부분과 버튼의 모양을 만들어 주는 부분이 있다. alertSign은 Bool 타입으로 값의 변화를 이용해 .alert 메소드에 인자를 전달하고 메세지를 뛰울 수 있게 한다.  
- Scroll View : iOS의 여러가지 뷰들 중에서 스크롤이 가능한 뷰로 원하는 부분에 ScrollView를 이용해 사용할 수 있다.

###### 8. SwiftUI-ScrollPage ( List )
- List : 리스트 형식의 뷰를 만들 수 있다.
- Section : List, Picker, Form 에서 구역을 나눌 수 있다.

###### 9. SwiftUI-ScrollPage ( NavigationBar )
- navigationBarItems + navigationLink를 이용하면 이전 뷰로 돌아오는 기능에 충돌이 발생하고 rootView(content View)로 돌아오게 된다. 따라서, 수정 이전까지는 nav Bar를 따로 만들어 Link를 줘야한다.
- 오류 출처 : https://developer.apple.com/forums/thread/124757?page=3 

###### 10. SwiftUI-GeometryReader 
- 고정된 값을 가지는 것이 아닌 화변의 비율에 맞게 조정할 수 있게 해주는 함수다.
- geometryReader{ (변수) in (code)} 여기서 변수는 내부에서 지속적으로 사용된다.
- Xcode 12 부터는 GR을 사용할 때 디폴트 값이 정해지지 않게 되어 해당 뷰 아래에 속성 메소드를 다음과 같이 붙여야 한다. ( .frame(width: display.size.width, height: display.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) )
- enum : 열거형으로 SwiftUI에서는 그 자체로 고유값을 가지므로 값을 줄 필요는 없다. 이를 이용하여 각각의 버튼의 클릭을 활용 할 수도 있다.

###### 11. SwiftUI-ScrollView( TabView / Custom TabView)
- 하단의 탭을 만들 수 있는 뷰이다.
- .tabItem을 이용하여 Icon을 사용하거나 변경이 가능하고 .tag(N)는 식별자(구분) 역할을 할 수 있게 해준다.
- 함수 + enum을 활용해서 각각의 뷰를 변경할 수 있다.
- 탭뷰의 아이콘을 scaleEffect( )를 이용해 클릭시 사이즈의 변화를 줄 수 있다.

###### 11. SwiftUI-QRScanner
- github에 있는 QRCode Scanner 오픈소스를 활용하여 QRCode Scanner를 만들어보는 프로젝트
- 시뮬레이터로는 카메라 기능을 활성화 할 수 없어 실제 아이폰을 활용하여 확인 할 수 있다.
- 참고 : https://github.com/twostraws/CodeScanner
