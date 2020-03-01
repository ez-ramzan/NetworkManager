//
//  StubProviderProtocol.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 12/16/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Protocol for implementation stub provider witch can give StubResponseData.

public protocol StubProviderProtocol {
    
    ///Methode for get StubResponseData by URLREquest.
    func getStub(for request: URLRequest) -> StubResponseData?
}
