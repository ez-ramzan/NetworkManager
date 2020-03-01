//
//  WebServiceError.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/24/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Types of web service errors.

public enum WebServiceError: Error {
    
    case buildRequest(RequestError)
    case load
    case httpResponse(HTTPResponseError)
    case emptyData
    case jsonСonversion
    case parsing
    case other
}
