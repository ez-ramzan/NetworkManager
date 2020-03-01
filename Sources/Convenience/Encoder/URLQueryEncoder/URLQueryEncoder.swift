//
//  URLQueryEncoder.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/26/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation
import Combine

/// Encoder for encode model to array of URLQueryItem.

public class URLQueryEncoder: TopLevelEncoder {
    
    
    ///Method for encode object to array of URLQueryItem.
    public func encode<Model: Encodable>(_ value: Model) throws -> [URLQueryItem] {
        let encoding = URLQueryEncoding()
        try value.encode(to: encoding)
        return encoding.data.queryItems
    }
}
