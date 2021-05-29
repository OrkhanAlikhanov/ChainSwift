//
//  Chain.swift
//  ChainSwift
//
//  Created by Orkhan Alikhanov on 5/29/21.
//

@dynamicMemberLookup
public struct Chain<Base> {
  public var get: Base
  
  init(_ base: Base) {
    self.get = base
  }
  
  public subscript<T>(dynamicMember keyPath: WritableKeyPath<Base, T>) -> Callable<Base, T> {
    Callable(get, keyPath: keyPath)
  }
}

public class Callable<Base, T> {
  var base: Base
  var keyPath: WritableKeyPath<Base, T>
  
  init(_ base: Base, keyPath: WritableKeyPath<Base, T>) {
    self.base = base
    self.keyPath = keyPath
  }
  
  @discardableResult
  public func callAsFunction(_ value: T) -> Chain<Base> {
    base[keyPath: keyPath] = value
    return Chain(base)
  }
}

public protocol Chainable {
  associatedtype ChainableBase
  
  var set: Chain<ChainableBase> { get }
}

public extension Chainable {
  var set: Chain<Self> {
    Chain(self)
  }
}

