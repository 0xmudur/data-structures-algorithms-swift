import UIKit

/// A stack is a LIFO last-in-first-out data structure.
/// The only two essentials operations for the stack are the push elements and the pop method for removing elements

/// Implementation
public struct Stack<Element> {
    
    private var storage: [Element] = []
    
    public init() { }
    
    public init(_ elements: [Element]) {
        storage = elements
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
      storage.popLast()
    }

    
    public func peek() -> Element? {
        storage.last
    }
    
    public var isEmpty: Bool {
        peek() == nil
    }
    
}

/// Sample
var stack = Stack<Int>()
stack.push(1)
stack.push(2)

if let poopedValue = stack.pop() {
    print("Popped value: \(poopedValue)")
}
