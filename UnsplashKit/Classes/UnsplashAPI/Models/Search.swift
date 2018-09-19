import Foundation
import Unbox

/// Resources
public struct Search {
  
  /// Resource for searching photos.
  ///
  /// - Parameters:
  /// - orientation: squarish OR portrait OR landscape
  ///   - query: search query.
  ///   - page: page to be fetched.
  ///   - perPage: number of items per page.
  /// - Returns: resource for searching photos.
  public static func photos(query: String, orientation: String? = nil,
                            page: Int = 1,
                            perPage: Int = 10) -> Resource<[Photo]> {
    var queryItems: [URLQueryItem] = []
    queryItems.append(URLQueryItem(name: "query", value: query))
    queryItems.append(URLQueryItem(name: "orientation", value: orientation))

    queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
    queryItems.append(URLQueryItem(name: "per_page", value: "\(perPage)"))
    return Resource(request: { (components) -> URLRequest in
      var mutable: URLComponents = components
      mutable.path = "/search/photos"
      mutable.queryItems = queryItems
      var request = URLRequest(url: mutable.url!)
      request.httpMethod = "GET"
      return request
    }, parse: { (data, _) -> [Photo] in
      return try Unboxer(data: data).unbox(key: "results")
    })
  }
    
    
    /// Resource for searching photos.
    ///
    /// - Parameters:
    ///   - query: search query.
    ///   - page: page to be fetched.
    ///   - perPage: number of items per page.
    /// - Returns: resource for searching photos.
    public static func photos(query: String,
                              page: Int = 1,
                              perPage: Int = 10) -> Resource<[Photo]> {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "query", value: query))
        queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        queryItems.append(URLQueryItem(name: "per_page", value: "\(perPage)"))
        return Resource(request: { (components) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/search/photos"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }, parse: { (data, _) -> [Photo] in
            return try Unboxer(data: data).unbox(key: "results")
        })
    }

    /// Resource for searching collections.
    ///
    /// - Parameters:
    ///   - query: search query.
    ///   - page: page to be fetched.
    ///   - perPage: number of items per page.
    /// - Returns: resource for searching collections.
    public static func collections(query: String,
                                   page: Int = 1,
                                   perPage: Int = 10) -> Resource<[Collection]> {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "query", value: query))
        queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        queryItems.append(URLQueryItem(name: "per_page", value: "\(perPage)"))
        return Resource(request: { (components) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/search/collections"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }, parse: { (data, _) -> [Collection] in
            return try Unboxer(data: data).unbox(key: "results")
        })
    }

    /// Resource for searching users.
    ///
    /// - Parameters:
    ///   - query: search query.
    ///   - page: page to be fetched.
    ///   - perPage: number of items per page.
    /// - Returns: resource for searching users.
    public static func users(query: String,
                             page: Int = 1,
                             perPage: Int = 10) -> Resource<[User]> {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "query", value: query))
        queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        queryItems.append(URLQueryItem(name: "per_page", value: "\(perPage)"))
        return Resource(request: { (components) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/search/users"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }, parse: { (data, _) -> [User] in
            return try Unboxer(data: data).unbox(key: "results")
        })
    }

}
