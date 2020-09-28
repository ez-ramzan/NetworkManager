//
//  HTTPHeader.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/15/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Object for create http header.

public struct HTTPHeader {
    
    
    ///Header field name.
    public let field: String
    
    ///Header field value.
    public let value: String
    
    ///Init HTTPHeader
    public init(field: String, value: String) {
        self.field = field
        self.value = value
    }
}
