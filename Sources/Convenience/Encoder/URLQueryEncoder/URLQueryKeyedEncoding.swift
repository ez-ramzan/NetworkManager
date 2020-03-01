//
//  URLQueryKeyedEncoding.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/26/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

internal struct URLQueryKeyedEncoding<Key: CodingKey>: KeyedEncodingContainerProtocol {
    
    private var data: URLQueryEncoding.Data
    
    var codingPath: [CodingKey] = []
    
    init(data: URLQueryEncoding.Data) {
        self.data = data
    }
    
    mutating func encodeNil(forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: nil)
    }
    
    mutating func encode(_ value: Bool, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: String, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value)
    }
    
    mutating func encode(_ value: Double, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: Float, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: Int, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: Int8, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: Int16, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: Int32, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: Int64, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: UInt, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: UInt8, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: UInt16, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: UInt32, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: UInt64, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode<T>(_ value: T, forKey key: Key) throws where T : Encodable {
        var encoding = URLQueryEncoding(data: data)
        encoding.codingPath.append(key)
        try value.encode(to: encoding)
    }
    
    mutating func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type, forKey key: Key) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        var container = URLQueryKeyedEncoding<NestedKey>(data: data)
        container.codingPath = codingPath + [key]
        return KeyedEncodingContainer(container)
    }
    
    mutating func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
        var container = URLQueryUnkeyedEncoding(data: data)
        container.codingPath = codingPath + [key]
        return container
    }
    
    mutating func superEncoder() -> Encoder {
        guard let key = Key(stringValue: "super") else {
            fatalError("Not valid key")
        }
        
        return superEncoder(forKey: key)
    }
    
    mutating func superEncoder(forKey key: Key) -> Encoder {
        var encoding = URLQueryEncoding(data: data)
        encoding.codingPath = codingPath + [key]
        return encoding
    }
}
