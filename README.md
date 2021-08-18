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
