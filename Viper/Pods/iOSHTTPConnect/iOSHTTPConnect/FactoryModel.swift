//
//  FactoryModel.swift
//  NTS
//
//  Created by Ashish Awasthi on 20/03/19.
//  Copyright © 2019 NTS. All rights reserved.
//

import Foundation

public enum RequestServiceModuleType: Int {
     case eBase
     case ePhotos
     case ePlaces
     case eMyAccount
     case eMovieInfo
}
extension RequestServiceModuleType: CaseIterable { }

extension RequestServiceModuleType {
    
    static var muduleList: [BaseModule] = []
    
    var classObject: BaseModule {
        switch self {
        case .eBase: return BaseModule()
        case .ePhotos: return PhotoModule()
        case .ePlaces: return PlaceModule()
        case .eMyAccount: return MyAccountModule()
        case .eMovieInfo: return MovieInfoModule()
        }
    }
    var moduleBaseURL: String {
        switch self {
        case .eBase: return RequestInviromentBaseURL.requestInvBaseURL.prettyURL(module: .eBase)
        case .ePhotos: return RequestInviromentBaseURL.requestInvBaseURL.prettyURL(module: .ePhotos)
        case .ePlaces: return RequestInviromentBaseURL.requestInvBaseURL.prettyURL(module: .ePlaces)
        case .eMyAccount: return RequestInviromentBaseURL.requestInvBaseURL.prettyURL(module: .eMyAccount)
        case .eMovieInfo: return RequestInviromentBaseURL.requestInvBaseURL.prettyURL(module: .eMovieInfo)
            }
        }
}

 

