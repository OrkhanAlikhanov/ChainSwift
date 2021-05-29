//
//  Chain.swift
//  ChainSwift
//
//  Created by Orkhan Alikhanov on 5/29/21.
//

@dynamicMemberLookup
public struct Chain<Base> {
  public var ch: Base
  
  init(_ base: Base) {
    self.ch = base
  }
  
  public subscript<T>(dynamicMember keyPath: WritableKeyPath<Base, T>) -> Callable<Base, T> {
    Callable(ch, keyPath: keyPath)
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
  
  static var ch: Chain<ChainableBase>.Type { get }
  var ch: Chain<ChainableBase> { get }
}

public extension Chainable {
  static var ch: Chain<Self>.Type {
    Chain<Self>.self
  }
  
  var ch: Chain<Self> {
    Chain(self)
  }
}
