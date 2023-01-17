## ScrollPage ( ScrollView )
  - Button : 액션에 해당하는 부분과 버튼의 모양을 만들어 주는 부분이 있다. alertSign은 Bool 타입으로 값의 변화를 이용해 .alert 메소드에 인자를 전달하고 메세지를 뛰울 수 있게 한다.  
  - Scroll View : iOS의 여러가지 뷰들 중에서 스크롤이 가능한 뷰로 원하는 부분에 ScrollView를 이용해 사용할 수 있다.

## ScrollPage ( List )
  - List : 리스트 형식의 뷰를 만들 수 있다.
  - Section : List, Picker, Form 에서 구역을 나눌 수 있다.

## ScrollPage ( NavigationBar )
  - navigationBarItems + navigationLink를 이용하면 이전 뷰로 돌아오는 기능에 충돌이 발생하고 rootView(content View)로 돌아오게 된다. 따라서, 수정 이전까지는 nav Bar를 따로 만들어 Link를 줘야한다.
  - 오류 출처 : https://developer.apple.com/forums/thread/124757?page=3 
