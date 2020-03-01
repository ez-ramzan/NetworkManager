//
//  WebServiceProtocol.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/18/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Protocol for implementation web service for sending requests.

public protocol WebServiceProtocol {
    
    ///Methode for load url request.
    func load<WebRequest: WebRequestProtocol>(_ request: WebRequest, completion: @escaping (Result<WebRequest.Mapper.ObjectType, WebError>) -> ()) -> Cancellable?
}
