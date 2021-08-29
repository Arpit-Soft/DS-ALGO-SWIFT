import UIKit

struct Queue<Type> {
    
    var elements :[Type] = []
    
    @discardableResult
    mutating func enqueue(_ value :Type) -> Bool {
        elements.append(value)
        return true
    }
    
    var isEmpty :Bool {
        return elements.isEmpty
    }
    
    mutating func dequeue() -> Type? {
        return isEmpty ? nil : elements.removeFirst()
    }
    
}

struct TreeNode <Type> {
    var value: Type
    var children = [TreeNode]()
    
    init(value: Type) {
        self.value = value
    }
    
    mutating func add(_ node: TreeNode) {
        children.append(node)
    }
}

extension TreeNode where Type: Equatable {
    
    // Depth First Traversal
    func forEachDepthFirst(_ visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit)
        }
    }
    
    // Level Order Traversal
    func forEachLevelOrder(_ visit: (TreeNode) -> Void) {
        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach { queue.enqueue($0) }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }
    
    func search( value: Type) -> TreeNode? {
        
        var result: TreeNode?
        
        forEachLevelOrder { node in
            if node.value == value {
                result = node
            }
        }
        
        return result
    }
}

extension TreeNode: CustomStringConvertible {
    var description: String {
        return String(describing: "\(value) -> \(children.map {$0.value})")
    }
}

var beverages = TreeNode(value: "Beverages")

var hot = TreeNode(value: "Hot Drink")
var cold = TreeNode(value: "Cold Drink")

var tea = TreeNode(value: "Tea")
var coffee = TreeNode(value: "Coffee")

hot.add(tea)
hot.add(coffee)

var soda = TreeNode(value: "Soda")
var milk = TreeNode(value: "Milk")

var sprite = TreeNode(value: "Sprite")
var lemonSoda = TreeNode(value: "Lemon Soda")

soda.add(sprite)
soda.add(lemonSoda)

var shake = TreeNode(value: "Shake")
var rabdi = TreeNode(value: "Rabdi")

milk.add(shake)
milk.add(rabdi)

cold.add(soda)
cold.add(milk)

beverages.add(hot)
beverages.add(cold)

beverages.forEachDepthFirst { (node) in
    //print(node)
}

beverages.forEachLevelOrder { (node) in
    //print(node)
}

if let result = beverages.search(value: "Cold Drink") {
    print(result)
}

/*
 
       Beverages
         /   \
        /     \
Hot Drink    Cold Drink
    / \         / \
  Tea Coffee  Soda Milk
 */
