//
//  CustomInterceptor.swift
//  Products
//
//  Created by Alina Petrovskaya on 09.11.2021.
//

import Foundation
import Apollo

// MARK: - CustomInterceptor
class CustomInterceptor: ApolloInterceptor {

    // MARK: - Private properties
    private var token: String? {
        KeychainManager().getData(for: .token)
    }

    // MARK: - Public properties

    // MARK: - Life cycle

    // MARK: - Private methods

    // MARK: - Public methods
    func interceptAsync<Operation: GraphQLOperation>(chain: RequestChain,
                                                     request: HTTPRequest<Operation>,
                                                     response: HTTPResponse<Operation>?,
                                                     completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
        request.addHeader(name: "APOLLO_USER",
                          value: GraphQlConstants.apolloUser.rawValue)
        request.addHeader(name: "APOLLO_KEY",
                          value: GraphQlConstants.apolloKey.rawValue)
        if let safeToken = token {
            request.addHeader(name: "Authorization", value: safeToken)
        }

        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
    
}
