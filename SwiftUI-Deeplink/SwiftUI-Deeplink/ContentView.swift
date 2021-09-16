//
//  ContentView.swift
//  SwiftUI-Deeplink
//
//  Created by 이경후 on 2021/09/15.
//

import SwiftUI

//식별자를 가지고 있는 구조체 -> 해당되는 곳으로 딥링크
struct MyTodoList : Identifiable,Hashable{
    var id = UUID()
    var name : String
    var order : Int
}
// 어떤 탭이 선택되었는지 구분
enum TabIdentifier: Hashable {
    case todos
    case profile
}
// 어떤 페이지를 보여주어야 하는지
enum PageIdentifier : Hashable{
    case todoItem(id: UUID)
}

struct ContentView: View {
    //구조체 배열
    @State var myList = [MyTodoList]()
    //탭을 구분하기 위함
    @State var selectedTab = TabIdentifier.todos
    //목록 구분
    @State var activeUUID : UUID?
    
    //생성자를 통해 구조체 배열 초기화
    init() {
        var newList = [MyTodoList]()
        for section in 0...20{
            let newToDo = MyTodoList(id: UUID(),name: "팔굽혀펴기 \(section+1)번",order : section+1)
            newList.append(newToDo)
            print("id : \(newToDo.id)")
        }
        //초기설정방법! State(initialValue: )
        _myList = State(initialValue: newList)
    }
    
    var body: some View {
        //TabView -> Selection : State 변수를 통해 제어
        TabView(selection: $selectedTab,
                content: {
                    //목록
                    VStack(alignment:.leading){
                        NavigationView{
                            List{
                                ForEach(myList){
                                    doing in
                                    NavigationLink(
                                        destination: MyContentsView(contents: doing.name),
                                        tag:doing.id,
                                        selection : $activeUUID,
                                        label: {
                                            Text("해야 할 일 \(doing.order)")
                                                .fontWeight(.medium)
                                        }
                                    )
                                }
                            }
                            .navigationTitle(
                                Text("할 일 목록")
                            )
                            .onOpenURL(perform: { url in
                                if case.todoItem(let id) = url.detailPage{
                                    print("넘어온 id : \(id)")
                                    activeUUID = id
                                }
                            })
                        }
                    }
                    .tabItem {
                        Image(systemName: "list.bullet")
                            .foregroundColor(.black)
                        Text("목록")
                    }
                    .tag(TabIdentifier.todos)
                    
                    //프로필
                    VStack{
                        Rectangle()
                            .frame(width: 150, height: 150, alignment: .center)
                            .foregroundColor(.orange)
                            .cornerRadius(20)
                            .overlay(
                                Text("프로필")
                                    .font(.system(size: 25))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            )
                    }
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(.black)
                        Text("프로필")
                    }
                    .tag(TabIdentifier.profile)
                })
            //TabView
            .onOpenURL(perform: { url in
                // 열리는 URL 처리
                guard let tabId = url.tabIdentifier else { return }
                selectedTab = tabId
                
            })
        
    }
}

extension URL {
    // 딥링크가 들어왔는지 확인 여부
    var isDeeplink : Bool {
        //scheme은 반드시 소문자..
        return scheme == "swiftui-deeplink"
    }
    //  URL이 들어오는 것으로 어떤 타입의 탭을 보여줘야 하는지 가져오기
    var tabIdentifier : TabIdentifier?{ //옵셔널
        
        guard isDeeplink else { return nil }
        
        //Example -> SwiftUI-Deeplink://host
        switch host {
        case "todos":
            return .todos
        case "profile" :
            return .profile
        default:
            return nil
        }
    }
    var detailPage : PageIdentifier? {
        
        //SwiftUI-Deeplink://host/여기서부터
        guard let tabId = tabIdentifier,
              pathComponents.count > 1,
              let uuid = UUID(uuidString: pathComponents[1])
        else { return nil }
        
        switch tabId {
        case .todos:
            return .todoItem(id: uuid)
        default:
            return nil
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
