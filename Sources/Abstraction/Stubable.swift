//
//  Stubable.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 12/17/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Protocol for implementation models which can transform to stub data.

public protocol Stubable: Encodable {
    
    ///Methode for decode Stubable obejct to Data.
    func decode() -> Data?
}

extension Stubable {
    
    ///Base implementation method for getting json data.
    func decode() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
