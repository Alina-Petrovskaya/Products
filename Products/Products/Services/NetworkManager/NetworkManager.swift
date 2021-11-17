//
//  NetworkManager.swift
//  Products
//
//  Created by Alina Petrovskaya on 09.11.2021.
//

import Foundation
import Apollo
import Network

// MARK: - NetworkManager
class NetworkManager  {

    // MARK: - Static properties

    // MARK: - Private properties
    private var apollo: ApolloClient?
    private var apolloCancellable: Cancellable?
    private let queue = DispatchQueue.global(qos: .userInitiated)
    private var connectionState: NWPath.Status = .unsatisfied
    private let monitor = NWPathMonitor()

    // MARK: - Public properties

    // MARK: - Life cycle
    init() {
        guard let url = URL(string: GraphQlConstants.url.rawValue) else { return }
        let cache         = InMemoryNormalizedCache()
        let store         = ApolloStore(cache: cache)
        let configuration = URLSessionConfiguration.default
        let client        = URLSessionClient(sessionConfiguration: configuration,
                                             callbackQueue: nil)
        let provider      = NetworkInterceptorProvider(client: client,
                                                       shouldInvalidateClientOnDeinit: true,
                                                       store: store)
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url)
        apollo = ApolloClient(networkTransport: requestChainTransport, store: store)
        monitorInternetConnection()
    }

    // MARK: - Private methods
    private func monitorInternetConnection() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.connectionState = path.status
        }
        monitor.start(queue: queue)
    }

    private func decodeData<T: Codable>(from jsonObject: JSONObject,
                                        with model: T.Type) throws -> T {
        do {
            let data = try JSONSerialization.data(withJSONObject: jsonObject, options: .sortedKeys)

            let decodableData = try JSONDecoder().decode(model, from: data)
            return decodableData
        } catch {
            throw error
        }
    }

    // MARK: - Public methods
    func requestData<T: Codable, Q: GraphQLQuery>(query: Q, model: T.Type,
                                                  completion: @escaping (Result<T, Error>) -> Void) {
        guard let apollo = apollo else { completion(.failure(GraphQlDefaultError.nilUrl)); return }
        guard connectionState == .satisfied else { completion(.failure(GraphQlDefaultError.noInternetConnection)); return }

        apolloCancellable = apollo.fetch(query: query,
                                         cachePolicy: .returnCacheDataElseFetch,
                                         queue: queue) { [weak self] result in
            DispatchQueue.main.async {
                if let errors = try? result.get().errors, let error = errors.first {
                    completion(.failure(GraphQlCustomError(graphQlError: error)))

                } else {
                    switch result {
                    case .success(let graphData):
                        guard let jsonObject = graphData.data?.resultMap.jsonObject else {
                            completion(.failure(GraphQlDefaultError.cantGetJsonObjectFromData))
                            return
                        }
                        
                        do {
                            if let decodableData = try self?.decodeData(from: jsonObject, with: model) {
                                completion(.success(decodableData))
                            }
                            
                        } catch {
                            completion(.failure(error))
                        }
                        
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            }
        }
    }

    func mutateData<M: GraphQLMutation>(query: M,
                                        completion: @escaping (Result<Bool, Error>) -> Void) {
        guard let apollo = apollo else { completion(.failure(GraphQlDefaultError.nilUrl)); return }
        guard connectionState == .satisfied else { completion(.failure(GraphQlDefaultError.noInternetConnection)); return }

        apollo.perform(mutation: query,
                       publishResultToStore: true,
                       queue: queue) { result in
            DispatchQueue.main.async {
                if let errors = try? result.get().errors, let error = errors.first {
                    completion(.failure(GraphQlCustomError(graphQlError: error)))
                    
                } else {
                    switch result {
                    case .success:
                        completion(.success(true))
                        
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            }
        }
    }

    func mutateData<M: GraphQLMutation,
                    T: Codable>(query: M,
                                model: T.Type,
                                completion: @escaping (Result<T, Error>) -> Void) {
        guard let apollo = apollo else { completion(.failure(GraphQlDefaultError.nilUrl)); return }
        guard connectionState == .satisfied else { completion(.failure(GraphQlDefaultError.noInternetConnection)); return }

        apollo.perform(mutation: query,
                       publishResultToStore: true,
                       queue: queue) { [weak self] result in
            DispatchQueue.main.async {
                if let errors = try? result.get().errors, let error = errors.first {
                    completion(.failure(GraphQlCustomError(graphQlError: error)))
                    
                } else {
                    switch result {
                    case .success(let graphData):
                        guard let jsonObject = graphData.data?.resultMap.jsonObject else {
                            completion(.failure(GraphQlDefaultError.cantGetJsonObjectFromData))
                            return
                        }
                        do {
                            if let decodableData = try self?.decodeData(from: jsonObject,
                                                                        with: model) {
                                completion(.success(decodableData))
                            }
                            
                        } catch {
                            print("Found Error")
                            completion(.failure(error))
                        }

                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            }
        }
    }
}
