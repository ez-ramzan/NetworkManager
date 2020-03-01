//
//  SessionConfiguratorProtocol.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/18/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Protocol for implementation session configuration builder.

public protocol SessionConfiguratorProtocol {
    
    ///Methode for build URLSession configuration.
    func buildURLSessionConfiguration() -> URLSessionConfiguration
}
