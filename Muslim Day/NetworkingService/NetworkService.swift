//
//  NetworkService.swift
//  Taswak
//
//  Created by omar  on 09/03/2022.
//

import Foundation
struct NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func getAzkarData(url:String, completion: @escaping(Result<MorningEveningAzkar,Error>)->Void){
        request(url: url, method: .get, completion: completion)
    }
    
    func getAzanData(url:String,parameters:[String:Any]?,completion:@escaping(Result<PrayerTiming,Error>)->Void){
        request(url:url, method: .get, headers: nil, parameters: parameters, completion: completion)
        
    }
    
    func getMp3QuranLinks(url:String,completion: @escaping(Result<ReciterMp3Model,Error>)->Void){
        request(url:url, method: .get, headers: nil, parameters:nil , completion: completion)
    }
    
     private func request <T:Decodable>(url: String,
                                      method: ApiMethod,
                                      headers:[String:String]? = nil,
                                      parameters: [String: Any]? = nil,
                                      completion: @escaping(Result <T,Error>) -> Void ){
        guard let urlRequest = createRequest(url: url, method: method, headers: headers, parameters: parameters) else {
            completion(.failure(AppError.unknownError))
            return
        }
        URLSession.shared.dataTask(with: urlRequest){(data,response,error) in
            var result: Result <Data, Error >?
            if let data = data{
                result = .success(data)
                let dataString = String(data: data, encoding: .utf8)
//                print("Data String is \(dataString)")
            }else if let error = error{
                result = .failure(error)
            }
            
            DispatchQueue.main.async {
                self.handleRequest(result: result, completion: completion)
            }
            
        }.resume()
    }
    
    private func handleRequest<T:Decodable>(result: Result<Data, Error>?,
                                         completion: (Result<T,Error>)-> Void){
        guard let result = result else {
            completion(.failure(AppError.unknownError))
            return
        }
        switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(T.self, from: data)
                    completion(.success(response))
                } catch let error {
//                    print(error)
                    completion(.failure(error))
                }
        case .failure(let error):
        completion(.failure(error))
        }
        
    }
    /// Func To make URL Request
    /// - Parameters:
    ///   - route: to define the complete path of the APi Url
    ///   - method: to determine wich method api is like . post .GET ....
    ///   - parameters: parametes to be sent with the API end point if there
    /// - Returns: return is expected to urlRequest
    
    func createRequest(url: String,
                       method: ApiMethod,
                       headers:[String:String]?,
                       parameters: [String: Any]?) -> URLRequest? {
        let urlString = url
        guard let url = URL(string: urlString) else { return nil }
//        print(url)
        var urlRequest = URLRequest(url: url)
        
//        Adding Headers to request if exsist
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("en", forHTTPHeaderField: "lang")
        if let headers = headers{
            urlRequest.allHTTPHeaderFields = headers
        }

        urlRequest.httpMethod = method.rawValue
        if let params = parameters{
            switch method{
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map {
                    URLQueryItem(name: $0, value: "\($1)")
                }
                    urlRequest.url = urlComponent?.url
                
            case .post, .delete, .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
}
