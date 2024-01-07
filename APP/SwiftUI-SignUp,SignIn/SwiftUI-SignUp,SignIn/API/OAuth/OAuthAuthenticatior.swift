//
//  OAuthAuthenticatior.swift
//  SwiftUI-SignUp,SignIn
//
//  Created by 이경후 on 1/7/24.
//

import Foundation
import Alamofire

class OAuthAuthenticatior: Authenticator {
    
    // 헤더 인증 추가
    func apply(_ credential: OAuthCredential, to urlRequest: inout URLRequest) {
        urlRequest.headers.add(.authorization(bearerToken: credential.accessToken))
    }
    
    // 토큰 리프레시
    func refresh(_ credential: OAuthCredential,
                 for session: Session,
                 completion: @escaping (Result<OAuthCredential, Error>) -> Void) {
        let request = session.request(AuthRouter.tokenRefresh)
        request.responseDecodable(of: TokenResponse.self) { result in
            switch result.result {
            case .success(let value):
                UserDefaultsManager.shared.setTokens(accessToken: value.token.accessToken, refreshToken: value.token.refreshToken)
                let expiration = Date(timeIntervalSinceNow: 60 * 60)
                let newCredential = OAuthCredential(accessToken: value.token.accessToken, refreshToken: value.token.refreshToken, expiration: expiration)
                completion(.success(newCredential))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // api 요청 완료
    func didRequest(_ urlRequest: URLRequest,
                    with response: HTTPURLResponse,
                    failDueToAuthenticationError error: Error) -> Bool {
        // 401 -> 재발행
        switch response.statusCode {
        case 401: return true
        default:
            return false
        }
    }
    
    func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: OAuthCredential) -> Bool {
        
        return true
    }
}
