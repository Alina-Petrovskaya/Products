//
//  NetworkInterceptorProvider.swift
//  Products
//
//  Created by Alina Petrovskaya on 09.11.2021.
//

import Foundation
import Apollo

// MARK: - NetworkInterceptorProvider
class NetworkInterceptorProvider: DefaultInterceptorProvider {
    
    // MARK: - Private properties
    
    // MARK: - Public properties
    
    // MARK: - Life cycle
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(CustomInterceptor(), at: 0)
        return interceptors
    }
}
