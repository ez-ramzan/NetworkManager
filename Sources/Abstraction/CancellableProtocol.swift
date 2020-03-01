//
//  CancellableProtocol.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/20/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Protocol for implementation cancel of load request.

public protocol Cancellable {
    
    /// Method for  cancel of load request.
    func cancel()
}
