import UIKit

class Node<Value> {
    var value: Value
    var nextNode: Node?
    
    init(value: Value, nextNode: Node? = nil) {
        self.value = value
        self.nextNode = nextNode
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let nextNode = nextNode else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: nextNode) + " "
    }
}

struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    var isEmpty: Bool {
        return tail == nil
    }
    
    mutating func push(_ value: Value) {
        self.head = Node(value: value, nextNode: head)
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ value: Value) {
        if isEmpty {
            push(value)
            return
        }
        let node = Node(value: value)
        tail?.nextNode = node
        tail = node
    }
    
    init() {}
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Linked list is Empty"
        }
        return String(describing: head)
    }
}

var linkedList = LinkedList<Int>()
linkedList.push(15)
linkedList.push(25)
linkedList.push(35)
print(linkedList)

var linkedList1 = LinkedList<Int>()
linkedList1.append(15)
linkedList1.append(25)
linkedList1.append(35)
print(linkedList1)
