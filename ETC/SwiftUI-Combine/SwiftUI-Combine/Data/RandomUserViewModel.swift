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
    var fetchMoreSubject = PassthroughSubject<(), Never>()
    
    @Published var randomUsers = [RandomUser]()
    @Published var pageInfo: Info? {
        didSet {
            print("pageInfo: \(String(describing: pageInfo))")
        }
    }
    @Published var isLoading: Bool = false
    
    init() {
        fetchRandomUsers()
        
        fetchMoreSubject.sink { [weak self] _ in
            guard let self = self else { return }
            if !self.isLoading {
                self.fetchMoreUsers()
            }
        }
        .store(in: &subscription)
    }
    
    func fetchRandomUsers() {
        AF.request(RandomUserRouter.getUsers())
            .publishDecodable(type: RandomUserResponseData.self)
            .compactMap{ $0.value }
            .sink(receiveCompletion: { completion in
                print("데이터 스트림 완료")
            }, receiveValue: { receiveValue in
                print("받은 값 : \(receiveValue)")
                self.randomUsers = receiveValue.results
                self.pageInfo = receiveValue.info
            }).store(in: &subscription)
    }
    
    func fetchMoreUsers() {
        guard let currentPage = pageInfo?.page else { 
            return
        }
        
        isLoading = true
        
        AF.request(RandomUserRouter.getUsers(page: currentPage + 1))
            .publishDecodable(type: RandomUserResponseData.self)
            .compactMap{ $0.value }
            .sink(receiveCompletion: { completion in
                print("데이터 스트림 완료")
            }, receiveValue: { receiveValue in
                print("받은 값 : \(receiveValue)")
                self.randomUsers += receiveValue.results
                self.pageInfo = receiveValue.info
                self.isLoading = false
            }).store(in: &subscription)
    }
}
