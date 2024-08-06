//
// FactsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class FactsAPI {

    /**
     Get a list of facts
     
     - parameter maxLength: (query) maximum length of returned fact (optional)
     - parameter limit: (query) limit the amount of results returned (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getFacts(maxLength: Int64? = nil, limit: Int64? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: [CatFact]?, _ error: Error?) -> Void)) -> RequestTask {
        return getFactsWithRequestBuilder(maxLength: maxLength, limit: limit).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get a list of facts
     - GET /facts/
     - Returns a a list of facts
     - parameter maxLength: (query) maximum length of returned fact (optional)
     - parameter limit: (query) limit the amount of results returned (optional)
     - returns: RequestBuilder<[CatFact]> 
     */
    open class func getFactsWithRequestBuilder(maxLength: Int64? = nil, limit: Int64? = nil) -> RequestBuilder<[CatFact]> {
        let localVariablePath = "/facts/"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "max_length": (wrappedValue: maxLength?.encodeToJSON(), isExplode: true),
            "limit": (wrappedValue: limit?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[CatFact]>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Get Random Fact
     
     - parameter maxLength: (query) maximum length of returned fact (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getRandomFact(maxLength: Int64? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: CatFact?, _ error: Error?) -> Void)) -> RequestTask {
        return getRandomFactWithRequestBuilder(maxLength: maxLength).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Random Fact
     - GET /fact/
     - Returns a random fact
     - parameter maxLength: (query) maximum length of returned fact (optional)
     - returns: RequestBuilder<CatFact> 
     */
    open class func getRandomFactWithRequestBuilder(maxLength: Int64? = nil) -> RequestBuilder<CatFact> {
        let localVariablePath = "/fact/"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "max_length": (wrappedValue: maxLength?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<CatFact>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }
}