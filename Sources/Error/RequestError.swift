//
//  RequestError.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/18/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Types of request errors.

public enum RequestError: Error {
    
    case baseURLToComponents
    case buildURL
}
