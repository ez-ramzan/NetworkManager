//
//  StubProvider.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 12/17/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

/// Base stub provider for register child providers and getting stub data.

public final class StubProvider {
    
    private var providers: [String: StubProviderProtocol] = [:]
}

// MARK: - Public (StubProviderProtocol)

extension StubProvider: StubProviderProtocol {
    
    /// Method for gettings stub data.
    public func getStub(for request: URLRequest) -> StubResponseData? {
        guard let path = request.url?.path, let provider = providers[path] else {
            return nil
        }
        return provider.getStub(for: request)
    }
}

// MARK: - Public (Register child providers)

extension StubProvider {
    
    ///Method for register child providers.
    public func register(provider: StubProviderProtocol, for path: String) {
        providers[path] = provider
    }
}
