import UIKit

/// A linked-list is a collection of values arranged in a linear, undirectional sequence.
///
/// Advanteges;
/// - Constant time insertions and removal from the front of the list
/// - Reliable performance characteristic
///
/// A linked-list is a chain of nodes. Nodes have two responsibilities;
/// - Hold a value
/// - Hold a reference to the next node. A nil value represents the end of the list
///
/// A linked-list has the concept of a head and tail. Which refers to the first and last nodes of the list
///
/// There are three ways to add values to a linked list, each having unique performance characteristics:
/// - push: Adds a value at the front of the list.
/// - append: Adds a value at the end of the list.
/// - insert(after:): Adds a value after a particular list node.
///
/// There are three main operations for removing nodes:
/// - pop: Removes the value at the front of the list.
/// - removeLast: Removes the value at the end of the list.
/// - remove(at:): Removes a value anywhere in the list.


// MARK: - Implementation
public class Node<Element> {
    public var value: Element
    public var next: Node?
    
    public init(value: Element, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

struct LinkedList<Element> {
    public var head: Node<Element>?
    public var tail: Node<Element>?
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public mutating func push(_ value: Element) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: Element) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    @discardableResult
    public mutating func insert(_ value: Element, after node: Node<Element>) -> Node<Element> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    @discardableResult
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> Value? {
        // 1
        guard let head = head else {
            return nil
        }
        // 2
        guard head.next != nil else {
            return pop()
        }
        // 3
        var prev = head
        var current = head
        while let next = current.next {
            prev = current
            current = next
        }
        // 4
        prev.next = nil
        tail = prev
        return current.value
    }
    
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
}

// MARK: - Example

var list = LinkedList<Int>()
list.push(3)
list.head?.value
list.head?.next
list.tail?.value
list.tail?.next
list.push(2)
list.head?.value
list.head?.next
list.tail?.value
list.tail?.next
list.push(1)
list.head?.value
list.head?.next
list.tail?.value
list.tail?.next

// 1,2,3





