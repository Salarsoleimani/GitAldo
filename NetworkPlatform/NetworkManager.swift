//
//  NetworkManager.swift
//  NetworkPlatform
//
//  Created by Salar Soleimani on 2020-04-25.
//  Copyright © 2020 BeKSaS. All rights reserved.
//

import Alamofire

public enum AlamofireErrors: String {
  case decodeErr, noNet, serverErr, ok
}
public struct NetworkManager {
  
  public static let shared = NetworkManager()
  
  public func fetchGenericDatas<T: Decodable>(urlString: String, completion: @escaping ([T]?, AlamofireErrors) -> ()) {
    print("fetchin data from url: \(urlString)")
    guard let url = URL(string: urlString.replacingOccurrences(of: " ", with: "%20")) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, resp, err) in
      if let err = err {
        print("Failed to fetch data with url(\(urlString)):", err)
        completion(nil, .serverErr)
        return
      }
      
      guard let data = data else {
        completion(nil, .noNet)
        return
      }
      
      do {
        let decoder = JSONDecoder()
        
        let obj = try decoder.decode([T].self, from: data)
        DispatchQueue.main.async {
          completion(obj, .ok)
        }
      } catch let jsonErr {
        print("Failed to decode json with url(\(urlString)):", jsonErr)
        completion(nil, .decodeErr)
      }
    }.resume()
  }
  
  public func fetchGenericDataWithURL<T: Decodable>(url: URL, completion: @escaping (T?, AlamofireErrors) -> ()) {
    
    URLSession.shared.dataTask(with: url) { (data, resp, err) in
      if let err = err {
        print("Failed to fetch data with url(\(url)):", err)
        completion(nil, .serverErr)
        return
      }
      
      guard let data = data else {
        completion(nil, .noNet)
        return
      }
      
      do {
        let decoder = JSONDecoder()
        let obj = try decoder.decode(T.self, from: data)
        DispatchQueue.main.async {
          completion(obj, .ok)
        }
      } catch let jsonErr {
        print("Failed to decode json with url(\(url)):", jsonErr)
        completion(nil, .decodeErr)
      }
    }.resume()
  }
}
