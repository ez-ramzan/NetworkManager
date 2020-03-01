//
//  URLQueryUnkeyedEncoding.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/26/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

internal struct URLQueryUnkeyedEncoding: UnkeyedEncodingContainer {
    
    private let data: URLQueryEncoding.Data
    
    var codingPath: [CodingKey] = []
    var count: Int = 0
    
    init(data: URLQueryEncoding.Data) {
        self.data = data
    }
    
    mutating func encodeNil() throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: nil)
    }
    
    mutating func encode(_ value: Bool) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: String) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value)
    }
    
    mutating func encode(_ value: Double) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: Float) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: Int) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: Int8) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: Int16) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: Int32) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: Int64) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: UInt) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: UInt8) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: UInt16) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: UInt32) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: UInt64) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode<T>(_ value: T) throws where T : Encodable {
        var encoding = URLQueryEncoding(data: data)
        encoding.codingPath = codingPath + [nextIndexedKey()]
        try value.encode(to: encoding)
    }
    
    mutating func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        var container = URLQueryKeyedEncoding<NestedKey>(data: data)
        container.codingPath = codingPath + [nextIndexedKey()]
        return KeyedEncodingContainer(container)
    }
    
    mutating func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        var container = URLQueryUnkeyedEncoding(data: data)
        container.codingPath = codingPath + [nextIndexedKey()]
        return container
    }
    
    mutating func superEncoder() -> Encoder {
        var encoding = URLQueryEncoding(data: data)
        encoding.codingPath.append(nextIndexedKey())
        return encoding
    }
}

private extension URLQueryUnkeyedEncoding {
    
    mutating func nextIndexedKey() -> CodingKey {
        guard let nextCodingKey = IndexedCodingKey(intValue: count) else {
            fatalError("Not valid value to use in an integer-indexed collection")
        }
        
        count += 1
        return nextCodingKey
    }

    struct IndexedCodingKey: CodingKey {
        
        let intValue: Int?
        let stringValue: String

        init?(intValue: Int) {
            self.intValue = intValue
            self.stringValue = intValue.description
        }

        init?(stringValue: String) {
            return nil
        }
    }
}
