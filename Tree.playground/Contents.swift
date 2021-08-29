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

extension TreeNode: CustomStringConvertible {
    var description: String {
        return String(describing: "\(value) -> \(children.map {$0.value})")
    }
}

var beverages = TreeNode(value: "Beverages")
let hot = TreeNode(value: "Hot Drink")
let cold = TreeNode(value: "Cold Drink")

beverages.add(hot)
beverages.add(cold)

print(beverages)

/*
 
       Beverages
         /   \
        /     \
  Hot Drink  Cold Drink
 
 */
