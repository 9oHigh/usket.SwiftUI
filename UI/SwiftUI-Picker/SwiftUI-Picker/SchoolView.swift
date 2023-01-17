//
//  SchoolView.swift
//  SwiftUI-Picker
//
//  Created by 이경후 on 2021/09/13.
//

import SwiftUI

// for / forEach 등에서 순환하여 사용할 수 있게 해주는 프로토콜
enum School : String,CaseIterable {
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
}

// 식별, 해시 가능하게 해주는 프로토콜
struct MyFriend : Identifiable,Hashable {
    var id = UUID()
    var name : String
    var school : School
}

struct SchoolView : View {
    
    @State private var filteredValue = School.elementary
    @State private var myFriendsList = [MyFriend]()
    
    //생성자 메소드
    init() {
        var newList = [MyFriend]()
        
        for i in 0...20 {
            let newFirend = MyFriend(name: "내 친구\(i)", school: School.allCases.randomElement()!)
            newList.append(newFirend)
        }
        _myFriendsList = State(initialValue : newList)
    }
    
    var body: some View{
        VStack{
            Text("filltered Value: \(filteredValue.rawValue)")
            
            
            Section(header: Text("학교 선택"),
                    content: {
                        Picker("", selection: $filteredValue , content:{
                            Text("초등학교").tag(School.elementary)
                            Text("중학교").tag(School.middle)
                            Text("고등학교").tag(School.high)
                        })
                        .pickerStyle(SegmentedPickerStyle())
                    })
            List{
                ForEach(myFriendsList.filter{
                    $0.school == filteredValue
                }){
                    friendItem in
                    GeometryReader{ display in
                        HStack{
                            Text("name : \(friendItem.name)")
                                .frame(width: display.size.width / 2)
                            Divider()
                            Text("school: \(friendItem.school.rawValue)")
                                .frame(width: display.size.width / 2)
                        }
                    }
                }
                
            }
        }
    }
}

struct SchoolView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolView()
    }
}
