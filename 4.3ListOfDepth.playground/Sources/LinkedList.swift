import Foundation

public class LinkedListNode<T> {
    let value: T
    var next: LinkedListNode<T>?
    
    public init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {
    typealias Node = LinkedListNode<T>
    var head: Node?
    var tail: Node?
    private(set) public var count: Int = 0 
    
    
    public init(array: [T]) {
        assert(array.count > 0)
        
        for item in array {
            add(value: item)
        }
    }
    
    public func add(value: T) {
        count += 1
        let node = Node(value: value)
        
        if head == nil {
            head = node
            tail = node
        }
        else {
            tail?.next = node
            tail = node
        }
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var result = ""
        
        var node = head
        
        while let printNode = node {
            result += "\(printNode.value) -> "
            node = printNode.next
        }
        
        return String(result.dropLast(4))
    }
}
