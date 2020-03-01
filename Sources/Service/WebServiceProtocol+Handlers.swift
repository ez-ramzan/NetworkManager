//
//  WebServiceProtocol+Handlers.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/18/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

//MARK: - Internal (Handling network response)

internal extension WebServiceProtocol {
    
    func handleNetworkResponse(data: Data?, response: URLResponse?, error: Error?) -> Result<Data, WebError> {
        
        guard error == nil else {
            return .failure(WebError(serviceError: .load, systemError: error))
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            return .failure(WebError(serviceError: .httpResponse(.empty), systemError: nil))
        }
        
        switch handleHTTPResponse(httpResponse) {
        case .success:
            guard let data = data else {
                return .failure(WebError(serviceError: .emptyData, systemError: nil))
            }
            
            return .success(data)
        case .failure(let error):
            return .failure(WebError(serviceError: .httpResponse(error), systemError: nil))
        }
    }
}


//MARK: - Private (Handling http response)

private extension WebServiceProtocol {
    
    func handleHTTPResponse(_ httpResponse: HTTPURLResponse) -> Result<Void, HTTPResponseError> {
        switch httpResponse.statusCode {
        case 200...299:
            return .success(())
        case 300...399:
            return .failure(.redirection)
        case 400...499:
            return .failure(.client)
        case 500...599:
            return .failure(.server)
        default:
            return .failure(.other)
        }
    }
}
