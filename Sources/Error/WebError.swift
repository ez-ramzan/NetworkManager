//
//  WebError.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/15/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Web error description object.

public struct WebError: Error {
    
    ///Service error getting during request and response processing.
    let serviceError: WebServiceError
    
    ///Error witch getting url response.
    let systemError: Error?
    
    
    ///Errror description.
    var localizedDescription: String {
        return "failed with \(serviceError)"
    }
}
