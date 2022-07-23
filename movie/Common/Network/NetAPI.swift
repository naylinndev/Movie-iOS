//
//  NetApi.swift
//  movie
//
//  Created by Nay Linn on 7/20/22.
//

import Foundation
import Moya
import Alamofire
import RxSwift

enum NetAPI{
    case getPopularMovies(page: Int)
    case getTopRatedMovies(page: Int)
    case getSimilarMovies(movieID : Int)
    case getMovieDetail(movieID : Int)
}


extension NetAPI: TargetType{
    var headers: [String : String]? {
        switch self{
        default :
            return [:]
        }
    }
    
    
    var baseURL: URL {
        return URL(string: Consts.BASE_URL)!
    }
    
    var path: String {
        
        switch self{
            
        case .getPopularMovies :
            return "movie/popular"
            
        case .getTopRatedMovies:
            return "movie/top_rated"
            
        case .getSimilarMovies( let movieID):
            return "movie/\(movieID)/similar"
            
        case .getMovieDetail(let movieID):
            return "movie/\(movieID)"
            
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var parameters: [String: Any] {
        switch self{
        case .getPopularMovies(page: let page):
            return ["api_key" : Consts.API_KEY , "page" : page]
            
        case .getTopRatedMovies(page: let page):
            return ["api_key" : Consts.API_KEY , "page" : page]
            
        case .getSimilarMovies(_):
            return ["api_key" : Consts.API_KEY]
            
        case .getMovieDetail(_):
            return ["api_key" : Consts.API_KEY]
            
        }
       // return [:]
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    
    var task: Task {
        return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    }
    
    var validate: Bool {
        return false
    }
    
}

class DefaultAlamofireManager: Alamofire.Session {
    static let sharedManager: DefaultAlamofireManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.Session.default.session.configuration.httpAdditionalHeaders
        configuration.timeoutIntervalForRequest = 20 // as seconds, you can set your request timeout
        configuration.timeoutIntervalForResource = 20 // as seconds, you can set your resource timeout
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return DefaultAlamofireManager(configuration: configuration)
    }()
}

//let netApi = MoyaProvider<NetAPI>(plugins: [NetworkLoggerPlugin()])
let netApi = MoyaProvider<NetAPI>(session: DefaultAlamofireManager.sharedManager,plugins: [NetworkLoggerPlugin()])
