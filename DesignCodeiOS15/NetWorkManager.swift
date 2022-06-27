import UIKit
import Alamofire

public typealias Success = (_ data : Data)->()
public typealias Failure = (_ error : Error)->()

class SwiftNetWorkManager: NSObject {
    //单例
    static var sharedInstance : SwiftNetWorkManager {
        struct Static {
            static let instance : SwiftNetWorkManager = SwiftNetWorkManager()
        }
        return Static.instance
    }
    
    /// GET请求
    func getRequest(
        _ urlString: String,
        params: Parameters? = nil,
        success: @escaping Success,
        failure: @escaping Failure)
    {
        request(urlString, params: params, method: .get, success, failure)
    }
    
    /// POST请求
    func postRequest(
        _ urlString: String,
        params: Parameters? = nil,
        success: @escaping Success,
        failure: @escaping Failure)
    {
        
        request(urlString, params: params, method: .post, success, failure)
    }
    
    //公共的私有方法
    private func request(
        _ urlString: String,
        params: Parameters? = nil,
        method: HTTPMethod,
        _ success: @escaping Success,
        _ failure: @escaping Failure)
    {
        
        let manager =  Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 10
        manager.request(urlString, method: method, parameters:params).responseData { response in
            switch (response.result) {
            case .success:
                success(response.data! as Data)
                break
            case .failure(let error):
                failure(error)
                break
            }
        }
    }
}

