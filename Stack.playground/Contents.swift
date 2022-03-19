import UIKit

/// Stack is a LIFO last-in-first-out data structure
/// The only two essentials operations for the stack are the 'push' and 'pop' elements

//  MARK: - Implementation
struct Stack<Element> {
    var storage: [Element] = []
    
    public init() {}
    
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

//  MARK: - Example
var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)


print(stack)

if let poppedValue = stack.pop() {
    assert(4 == poppedValue)
    print("Popped: \(poppedValue)")
}

if let peekValue = stack.peek() {
    print("Peek value: \(peekValue)")
}
