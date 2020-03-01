//
//  Mapper.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/18/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Protocol for implementation object witch can transform data to object type of  Mappable

public protocol MapperProtocol {
    
    ///Specific type of Mappable object.
    associatedtype ObjectType: Mappable
    
    ///Method for transformations data to result with Mappable object or WebError.
    static func map(_ data: Data) -> Result<ObjectType, WebError>
}
