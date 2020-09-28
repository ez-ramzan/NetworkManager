//
//  JSONMapper.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/27/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Object witch can transform json data to object type of mappable  model.

open class JSONMapper<Model>: MapperProtocol where Model: Mappable {
    
    ///Specific type of Mappable object.
    public typealias ObjectType = Model
    
    ///Methode for transformations data to result with Mappable object or WebError.
    open class func map(_ data: Data) -> Result<Model, WebError> {
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] else {
            return .failure(WebError(serviceError: .jsonСonversion, systemError: nil))
        }

        guard let model = ObjectType(jsonDict: json) else {
            return .failure(WebError(serviceError: .parsing, systemError: nil))
        }
               
        return .success(model)
    }
}
