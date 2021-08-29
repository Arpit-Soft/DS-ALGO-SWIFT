import UIKit

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

extension TreeNode {
    
    func forEachDepthFirst(_ visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit)
        }
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

cold.add(soda)
cold.add(milk)

beverages.add(hot)
beverages.add(cold)

print(beverages)

beverages.forEachDepthFirst { (node) in
    print(node)
}

/*
 
       Beverages
         /   \
        /     \
  Hot Drink  Cold Drink
 
 */
