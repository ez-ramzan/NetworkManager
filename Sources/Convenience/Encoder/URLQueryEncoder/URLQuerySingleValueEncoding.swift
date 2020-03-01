//
//  URLQuerySingleValueEncoding.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/26/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

internal struct URLQuerySingleValueEncoding: SingleValueEncodingContainer {
    
    private let data: URLQueryEncoding.Data

    var codingPath: [CodingKey] = []
    
    init(data: URLQueryEncoding.Data) {
        self.data = data
    }
    
    mutating func encodeNil() throws {
        data.encode(key: codingPath, value: nil)
    }
    
    mutating func encode(_ value: Bool) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: String) throws {
        data.encode(key: codingPath, value: value)
    }
    
    mutating func encode(_ value: Double) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: Float) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: Int) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: Int8) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: Int16) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: Int32) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: Int64) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: UInt) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: UInt8) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: UInt16) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: UInt32) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: UInt64) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode<T>(_ value: T) throws where T : Encodable {
        var encoding = URLQueryEncoding(data: data)
        encoding.codingPath = codingPath
        try value.encode(to: encoding)
    }
}
