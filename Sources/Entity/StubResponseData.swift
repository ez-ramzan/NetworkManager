//
//  StubResponseData.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 12/1/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Object for create stub response data.

public struct StubResponseData {
    
    
    ///Response data witch supposedly received from request.
    public let data: Stubable?
    
    ///Response status code.
    public let statusCode: Int
    
    ///Version http.
    public let httpVersion: String?
    
    ///Getting error witch supposedly received from request.
    public let error: Error?
    
    ///Response timeout.
    public let delay: Double
}
