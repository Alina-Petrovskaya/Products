// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct InputFindUser: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - id
  ///   - email
  public init(id: Swift.Optional<GraphQLID?> = nil, email: Swift.Optional<String?> = nil) {
    graphQLMap = ["id": id, "email": email]
  }

  public var id: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["id"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var email: Swift.Optional<String?> {
    get {
      return graphQLMap["email"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }
}

public struct InputLogin: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - email
  ///   - password
  public init(email: String, password: String) {
    graphQLMap = ["email": email, "password": password]
  }

  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }
}

public struct InputID: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - id
  ///   - filter
  public init(id: String, filter: Swift.Optional<InputFilter?> = nil) {
    graphQLMap = ["id": id, "filter": filter]
  }

  public var id: String {
    get {
      return graphQLMap["id"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var filter: Swift.Optional<InputFilter?> {
    get {
      return graphQLMap["filter"] as? Swift.Optional<InputFilter?> ?? Swift.Optional<InputFilter?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "filter")
    }
  }
}

public struct InputFilter: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - skip
  ///   - limit
  public init(skip: Swift.Optional<Double?> = nil, limit: Swift.Optional<Double?> = nil) {
    graphQLMap = ["skip": skip, "limit": limit]
  }

  public var skip: Swift.Optional<Double?> {
    get {
      return graphQLMap["skip"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "skip")
    }
  }

  public var limit: Swift.Optional<Double?> {
    get {
      return graphQLMap["limit"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "limit")
    }
  }
}

public struct InputOrderId: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - id
  ///   - filter
  public init(id: GraphQLID, filter: Swift.Optional<InputFilter?> = nil) {
    graphQLMap = ["id": id, "filter": filter]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var filter: Swift.Optional<InputFilter?> {
    get {
      return graphQLMap["filter"] as? Swift.Optional<InputFilter?> ?? Swift.Optional<InputFilter?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "filter")
    }
  }
}

public struct InputCreateUser: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - name
  ///   - email
  ///   - password
  public init(name: String, email: String, password: String) {
    graphQLMap = ["name": name, "email": email, "password": password]
  }

  public var name: String {
    get {
      return graphQLMap["name"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }
}

public struct InputCreateProduct: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - price
  ///   - title
  ///   - content
  ///   - amount
  ///   - creator
  public init(price: Double, title: String, content: String, amount: Double, creator: String) {
    graphQLMap = ["price": price, "title": title, "content": content, "amount": amount, "creator": creator]
  }

  public var price: Double {
    get {
      return graphQLMap["price"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "price")
    }
  }

  public var title: String {
    get {
      return graphQLMap["title"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var content: String {
    get {
      return graphQLMap["content"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "content")
    }
  }

  public var amount: Double {
    get {
      return graphQLMap["amount"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "amount")
    }
  }

  public var creator: String {
    get {
      return graphQLMap["creator"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "creator")
    }
  }
}

public struct InputCreateOrder: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - customer
  ///   - products
  ///   - price
  public init(customer: GraphQLID, products: [GraphQLID], price: Double) {
    graphQLMap = ["customer": customer, "products": products, "price": price]
  }

  public var customer: GraphQLID {
    get {
      return graphQLMap["customer"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "customer")
    }
  }

  public var products: [GraphQLID] {
    get {
      return graphQLMap["products"] as! [GraphQLID]
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "products")
    }
  }

  public var price: Double {
    get {
      return graphQLMap["price"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "price")
    }
  }
}

public struct InputUpdateProduct: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - id
  ///   - price
  ///   - title
  ///   - content
  ///   - amount
  ///   - isRemove
  public init(id: GraphQLID, price: Swift.Optional<Double?> = nil, title: Swift.Optional<String?> = nil, content: Swift.Optional<String?> = nil, amount: Swift.Optional<Double?> = nil, isRemove: Bool) {
    graphQLMap = ["id": id, "price": price, "title": title, "content": content, "amount": amount, "isRemove": isRemove]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var price: Swift.Optional<Double?> {
    get {
      return graphQLMap["price"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "price")
    }
  }

  public var title: Swift.Optional<String?> {
    get {
      return graphQLMap["title"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var content: Swift.Optional<String?> {
    get {
      return graphQLMap["content"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "content")
    }
  }

  public var amount: Swift.Optional<Double?> {
    get {
      return graphQLMap["amount"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "amount")
    }
  }

  public var isRemove: Bool {
    get {
      return graphQLMap["isRemove"] as! Bool
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "isRemove")
    }
  }
}

public final class FindUserQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FindUser($findUserData2: InputFindUser!) {
      findUser(data: $findUserData2) {
        __typename
        id
        name
        access_token
      }
    }
    """

  public let operationName: String = "FindUser"

  public var findUserData2: InputFindUser

  public init(findUserData2: InputFindUser) {
    self.findUserData2 = findUserData2
  }

  public var variables: GraphQLMap? {
    return ["findUserData2": findUserData2]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("findUser", arguments: ["data": GraphQLVariable("findUserData2")], type: .nonNull(.object(FindUser.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(findUser: FindUser) {
      self.init(unsafeResultMap: ["__typename": "Query", "findUser": findUser.resultMap])
    }

    public var findUser: FindUser {
      get {
        return FindUser(unsafeResultMap: resultMap["findUser"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "findUser")
      }
    }

    public struct FindUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FindUser"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("access_token", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, accessToken: String) {
        self.init(unsafeResultMap: ["__typename": "FindUser", "id": id, "name": name, "access_token": accessToken])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var accessToken: String {
        get {
          return resultMap["access_token"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "access_token")
        }
      }
    }
  }
}

public final class LoginQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Login($loginData: InputLogin!) {
      login(data: $loginData) {
        __typename
        id
        name
        access_token
      }
    }
    """

  public let operationName: String = "Login"

  public var loginData: InputLogin

  public init(loginData: InputLogin) {
    self.loginData = loginData
  }

  public var variables: GraphQLMap? {
    return ["loginData": loginData]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("login", arguments: ["data": GraphQLVariable("loginData")], type: .nonNull(.object(Login.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login) {
      self.init(unsafeResultMap: ["__typename": "Query", "login": login.resultMap])
    }

    public var login: Login {
      get {
        return Login(unsafeResultMap: resultMap["login"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("access_token", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, accessToken: String) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "access_token": accessToken])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var accessToken: String {
        get {
          return resultMap["access_token"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "access_token")
        }
      }
    }
  }
}

public final class GetProductsUserIdQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetProductsUserId($data: InputID!) {
      getProductsUserId(data: $data) {
        __typename
        _id
        content
        amount
        create_at
        isRemove
        price
        title
      }
    }
    """

  public let operationName: String = "GetProductsUserId"

  public var data: InputID

  public init(data: InputID) {
    self.data = data
  }

  public var variables: GraphQLMap? {
    return ["data": data]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getProductsUserId", arguments: ["data": GraphQLVariable("data")], type: .nonNull(.list(.nonNull(.object(GetProductsUserId.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getProductsUserId: [GetProductsUserId]) {
      self.init(unsafeResultMap: ["__typename": "Query", "getProductsUserId": getProductsUserId.map { (value: GetProductsUserId) -> ResultMap in value.resultMap }])
    }

    public var getProductsUserId: [GetProductsUserId] {
      get {
        return (resultMap["getProductsUserId"] as! [ResultMap]).map { (value: ResultMap) -> GetProductsUserId in GetProductsUserId(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: GetProductsUserId) -> ResultMap in value.resultMap }, forKey: "getProductsUserId")
      }
    }

    public struct GetProductsUserId: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Products"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .scalar(String.self)),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
          GraphQLField("create_at", type: .scalar(String.self)),
          GraphQLField("isRemove", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("price", type: .nonNull(.scalar(Double.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(_id: String? = nil, content: String, amount: Double, createAt: String? = nil, isRemove: Bool, price: Double, title: String) {
        self.init(unsafeResultMap: ["__typename": "Products", "_id": _id, "content": content, "amount": amount, "create_at": createAt, "isRemove": isRemove, "price": price, "title": title])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var _id: String? {
        get {
          return resultMap["_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "_id")
        }
      }

      public var content: String {
        get {
          return resultMap["content"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "content")
        }
      }

      public var amount: Double {
        get {
          return resultMap["amount"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "amount")
        }
      }

      public var createAt: String? {
        get {
          return resultMap["create_at"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "create_at")
        }
      }

      public var isRemove: Bool {
        get {
          return resultMap["isRemove"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isRemove")
        }
      }

      public var price: Double {
        get {
          return resultMap["price"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "price")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }
    }
  }
}

public final class GetOrdersUserIdQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetOrdersUserId($data: InputOrderId!, $findUserData2: InputFindUser!) {
      getOrdersUserId(data: $data) {
        __typename
        create_at
        price
        _id
      }
      findUser(data: $findUserData2) {
        __typename
        _id
        access_token
        id
        email
        name
      }
    }
    """

  public let operationName: String = "GetOrdersUserId"

  public var data: InputOrderId
  public var findUserData2: InputFindUser

  public init(data: InputOrderId, findUserData2: InputFindUser) {
    self.data = data
    self.findUserData2 = findUserData2
  }

  public var variables: GraphQLMap? {
    return ["data": data, "findUserData2": findUserData2]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getOrdersUserId", arguments: ["data": GraphQLVariable("data")], type: .nonNull(.list(.nonNull(.object(GetOrdersUserId.selections))))),
        GraphQLField("findUser", arguments: ["data": GraphQLVariable("findUserData2")], type: .nonNull(.object(FindUser.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getOrdersUserId: [GetOrdersUserId], findUser: FindUser) {
      self.init(unsafeResultMap: ["__typename": "Query", "getOrdersUserId": getOrdersUserId.map { (value: GetOrdersUserId) -> ResultMap in value.resultMap }, "findUser": findUser.resultMap])
    }

    public var getOrdersUserId: [GetOrdersUserId] {
      get {
        return (resultMap["getOrdersUserId"] as! [ResultMap]).map { (value: ResultMap) -> GetOrdersUserId in GetOrdersUserId(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: GetOrdersUserId) -> ResultMap in value.resultMap }, forKey: "getOrdersUserId")
      }
    }

    public var findUser: FindUser {
      get {
        return FindUser(unsafeResultMap: resultMap["findUser"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "findUser")
      }
    }

    public struct GetOrdersUserId: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Order"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("create_at", type: .scalar(String.self)),
          GraphQLField("price", type: .nonNull(.scalar(Double.self))),
          GraphQLField("_id", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(createAt: String? = nil, price: Double, _id: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Order", "create_at": createAt, "price": price, "_id": _id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var createAt: String? {
        get {
          return resultMap["create_at"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "create_at")
        }
      }

      public var price: Double {
        get {
          return resultMap["price"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "price")
        }
      }

      public var _id: String? {
        get {
          return resultMap["_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "_id")
        }
      }
    }

    public struct FindUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FindUser"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .scalar(String.self)),
          GraphQLField("access_token", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(_id: String? = nil, accessToken: String, id: GraphQLID, email: String, name: String) {
        self.init(unsafeResultMap: ["__typename": "FindUser", "_id": _id, "access_token": accessToken, "id": id, "email": email, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var _id: String? {
        get {
          return resultMap["_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "_id")
        }
      }

      public var accessToken: String {
        get {
          return resultMap["access_token"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "access_token")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var email: String {
        get {
          return resultMap["email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class CreateUserMutationMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateUserMutation($data: InputCreateUser!) {
      createUser(data: $data) {
        __typename
        id
        name
        access_token
      }
    }
    """

  public let operationName: String = "CreateUserMutation"

  public var data: InputCreateUser

  public init(data: InputCreateUser) {
    self.data = data
  }

  public var variables: GraphQLMap? {
    return ["data": data]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createUser", arguments: ["data": GraphQLVariable("data")], type: .nonNull(.object(CreateUser.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createUser: CreateUser) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createUser": createUser.resultMap])
    }

    public var createUser: CreateUser {
      get {
        return CreateUser(unsafeResultMap: resultMap["createUser"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createUser")
      }
    }

    public struct CreateUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CreateUser"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("access_token", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, accessToken: String) {
        self.init(unsafeResultMap: ["__typename": "CreateUser", "id": id, "name": name, "access_token": accessToken])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var accessToken: String {
        get {
          return resultMap["access_token"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "access_token")
        }
      }
    }
  }
}

public final class CreateProductMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateProduct($data: InputCreateProduct!) {
      createProduct(data: $data) {
        __typename
        id
        _id
        price
        title
        content
        creator
        isRemove
        amount
      }
    }
    """

  public let operationName: String = "CreateProduct"

  public var data: InputCreateProduct

  public init(data: InputCreateProduct) {
    self.data = data
  }

  public var variables: GraphQLMap? {
    return ["data": data]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createProduct", arguments: ["data": GraphQLVariable("data")], type: .nonNull(.object(CreateProduct.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createProduct: CreateProduct) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createProduct": createProduct.resultMap])
    }

    public var createProduct: CreateProduct {
      get {
        return CreateProduct(unsafeResultMap: resultMap["createProduct"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createProduct")
      }
    }

    public struct CreateProduct: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CreateProduct"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("_id", type: .scalar(String.self)),
          GraphQLField("price", type: .nonNull(.scalar(Double.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("creator", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("isRemove", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, _id: String? = nil, price: Double, title: String, content: String, creator: GraphQLID, isRemove: Bool, amount: Double) {
        self.init(unsafeResultMap: ["__typename": "CreateProduct", "id": id, "_id": _id, "price": price, "title": title, "content": content, "creator": creator, "isRemove": isRemove, "amount": amount])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var _id: String? {
        get {
          return resultMap["_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "_id")
        }
      }

      public var price: Double {
        get {
          return resultMap["price"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "price")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var content: String {
        get {
          return resultMap["content"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "content")
        }
      }

      public var creator: GraphQLID {
        get {
          return resultMap["creator"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "creator")
        }
      }

      public var isRemove: Bool {
        get {
          return resultMap["isRemove"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isRemove")
        }
      }

      public var amount: Double {
        get {
          return resultMap["amount"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "amount")
        }
      }
    }
  }
}

public final class CreateOrderMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateOrder($data: InputCreateOrder!) {
      createOrder(data: $data) {
        __typename
        create_at
        price
        _id
        id
        paid
      }
    }
    """

  public let operationName: String = "CreateOrder"

  public var data: InputCreateOrder

  public init(data: InputCreateOrder) {
    self.data = data
  }

  public var variables: GraphQLMap? {
    return ["data": data]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createOrder", arguments: ["data": GraphQLVariable("data")], type: .nonNull(.object(CreateOrder.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createOrder: CreateOrder) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createOrder": createOrder.resultMap])
    }

    public var createOrder: CreateOrder {
      get {
        return CreateOrder(unsafeResultMap: resultMap["createOrder"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createOrder")
      }
    }

    public struct CreateOrder: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Order"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("create_at", type: .scalar(String.self)),
          GraphQLField("price", type: .nonNull(.scalar(Double.self))),
          GraphQLField("_id", type: .scalar(String.self)),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("paid", type: .nonNull(.scalar(Bool.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(createAt: String? = nil, price: Double, _id: String? = nil, id: GraphQLID? = nil, paid: Bool) {
        self.init(unsafeResultMap: ["__typename": "Order", "create_at": createAt, "price": price, "_id": _id, "id": id, "paid": paid])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var createAt: String? {
        get {
          return resultMap["create_at"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "create_at")
        }
      }

      public var price: Double {
        get {
          return resultMap["price"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "price")
        }
      }

      public var _id: String? {
        get {
          return resultMap["_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "_id")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var paid: Bool {
        get {
          return resultMap["paid"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "paid")
        }
      }
    }
  }
}

public final class UpdateProductMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateProduct($data: InputUpdateProduct!) {
      updateProduct(data: $data) {
        __typename
        _id
        content
        amount
        create_at
        isRemove
        price
        title
      }
    }
    """

  public let operationName: String = "UpdateProduct"

  public var data: InputUpdateProduct

  public init(data: InputUpdateProduct) {
    self.data = data
  }

  public var variables: GraphQLMap? {
    return ["data": data]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateProduct", arguments: ["data": GraphQLVariable("data")], type: .nonNull(.object(UpdateProduct.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateProduct: UpdateProduct) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateProduct": updateProduct.resultMap])
    }

    public var updateProduct: UpdateProduct {
      get {
        return UpdateProduct(unsafeResultMap: resultMap["updateProduct"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "updateProduct")
      }
    }

    public struct UpdateProduct: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["UpdateProduct"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .scalar(String.self)),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
          GraphQLField("create_at", type: .scalar(String.self)),
          GraphQLField("isRemove", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("price", type: .nonNull(.scalar(Double.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(_id: String? = nil, content: String, amount: Double, createAt: String? = nil, isRemove: Bool, price: Double, title: String) {
        self.init(unsafeResultMap: ["__typename": "UpdateProduct", "_id": _id, "content": content, "amount": amount, "create_at": createAt, "isRemove": isRemove, "price": price, "title": title])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var _id: String? {
        get {
          return resultMap["_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "_id")
        }
      }

      public var content: String {
        get {
          return resultMap["content"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "content")
        }
      }

      public var amount: Double {
        get {
          return resultMap["amount"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "amount")
        }
      }

      public var createAt: String? {
        get {
          return resultMap["create_at"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "create_at")
        }
      }

      public var isRemove: Bool {
        get {
          return resultMap["isRemove"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isRemove")
        }
      }

      public var price: Double {
        get {
          return resultMap["price"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "price")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }
    }
  }
}
