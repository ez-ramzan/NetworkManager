//
//  HTTPResponseError.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/15/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Types of http response errors.

public enum HTTPResponseError: Error {
    
    case empty
    case redirection
    case client
    case server
    case other
}
