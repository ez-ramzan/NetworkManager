//
//  MappableProtocol.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/17/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Protocol for implementation models which can try transfer data to this object type.

public protocol Mappable: Decodable {
    
    init?(jsonDict: [String: Any])
}

//MARK: - Public (Implementation base init)

extension Mappable {
    
    ///Init Mappable object through dictionary.
    public init?(jsonDict: [String: Any]) {
        guard let data = try? JSONSerialization.data(withJSONObject: jsonDict, options: []) else {
            return nil
        }
        
        guard let decodedData = try? JSONDecoder().decode(Self.self, from: data) else {
            return nil
        }
        
        self = decodedData
    }
}
