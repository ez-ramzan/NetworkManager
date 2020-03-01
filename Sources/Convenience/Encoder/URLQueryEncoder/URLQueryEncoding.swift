//
//  URLQueryEncoding.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/26/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

internal struct URLQueryEncoding: Encoder {
    
    var data: Data
    var codingPath: [CodingKey] = []
    var userInfo: [CodingUserInfoKey : Any] = [:]
    
    init(data: Data = Data()) {
        self.data = data
    }
    
    func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key : CodingKey {
        var container = URLQueryKeyedEncoding<Key>(data: data)
        container.codingPath = codingPath
        return KeyedEncodingContainer(container)
    }
    
    func unkeyedContainer() -> UnkeyedEncodingContainer {
        var container = URLQueryUnkeyedEncoding(data: data)
        container.codingPath = codingPath
        return container
    }
    
    func singleValueContainer() -> SingleValueEncodingContainer {
        var container = URLQuerySingleValueEncoding(data: data)
        container.codingPath = codingPath
        return container
    }
}

internal extension URLQueryEncoding {
    
    class Data {
        
        private(set) var queryItems: [URLQueryItem] = []
        
        func encode(key codingKeys: [CodingKey], value: String?) {
            let key = codingKeys.map { $0.stringValue }.joined(separator: ".")
            queryItems.append(URLQueryItem(name: key, value: value))
        }
    }
}
