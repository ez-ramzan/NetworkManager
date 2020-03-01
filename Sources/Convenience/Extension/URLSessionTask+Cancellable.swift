//
//  URLSessionTask+Cancellable.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/20/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Every URLSessionTask supports protocol Cancellable.

extension URLSessionTask: Cancellable {}
