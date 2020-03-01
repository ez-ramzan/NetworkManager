//
//  WebRequestProtocol.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/18/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Protocol for implementation web request. Contains basic properties for request assembly and and type of handler response.

public protocol WebRequestProtocol {
    
    associatedtype Mapper: MapperProtocol
    associatedtype ParamsType: Requestable
    
    ///Path of request.
    var path: String { get }
    
    ///HTTP request method.
    var httpMethod: HTTPMethod { get }
    
    ///HTTP headers for request.
    var headers: [HTTPHeader]? { get }
    
    ///Data for request.
    var params: ParamsType? { get }
    
    ///Type of request data.
    var encodingType: WebRequestDataEncodingType { get }
    
    ///Type of mapper withc can process data to Mappable object.
    var mapperType: Mapper.Type { get }
}
