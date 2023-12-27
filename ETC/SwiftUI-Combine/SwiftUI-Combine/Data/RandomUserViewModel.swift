//
//  RandomUserViewModel.swift
//  SwiftUI-combine
//
//  Created by 이경후 on 12/27/23.
//

import Foundation
import Combine
import Alamofire

final class RandomUserViewModel: ObservableObject {
    
    //MARK: properties
    var subscription = Set<AnyCancellable>()
    @Published var randomUsers = [RandomUser]()
    var baseUrl = "https://randomuser.me/api/?results=50"
    
    init() {
        fetchRandomUsers()
    }
    
    func fetchRandomUsers() {
        AF.request(baseUrl)
            .publishDecodable(type: RandomUserResponseData.self)
            .compactMap{ $0.value }
            .map { $0.results }
            .sink(receiveCompletion: { completion in
                print("데이터 스트림 완료")
            }, receiveValue: { receiveValue in
                print("받은 값 : \(receiveValue.count)")
                self.randomUsers = receiveValue
            }).store(in: &subscription)

    }
}
