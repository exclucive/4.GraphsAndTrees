//: Playground - noun: a place where people can play

import UIKit

class Vertice<T>: CustomStringConvertible {
    enum State {
        case blank, visiting, completed;
    }
    
    let data: T
    var neighbors:[Edge<T>] = []
    var degree: Int = 0
    var state: State = .blank
    
    init(data: T) {
        self.data = data
    }
    
    func addNeigbor(_ vertice: Vertice<T>) {
        let edge = Edge<T>(destination: vertice)
        vertice.degree += 1
        
        neighbors.append(edge)
    }
    
    var description: String {
        return "\(data)"
    }
}

class Edge<T> {
    var destination: Vertice<T>
    
    init(destination: Vertice<T>) {
        self.destination = destination
    }
}


class Graph<T> {
    typealias Project = Vertice<T>
    var nodes: [Project] = []
    
    func addProject(_ data: T) -> Project {
        let project = Project(data: data)
        nodes.append(project)
        
        return project
    }

    func buildGraph(pairs: [[Project]])  {
        for pair in pairs {
            let child = pair[0]
            let parent = pair[1]
            parent.addNeigbor(child)
        }
    }

    func zeroDegreeNodes() -> [Project]? {
        return nodes.filter({ (node) -> Bool in
            return node.degree == 0
        })
    }
    
    func findOrder() -> [Project]? {
        var result:[Project] = []
        
        guard let entryNodes = graph.zeroDegreeNodes() as? [Project] else {
            return nil
        }
        
        for startNode in entryNodes {
            var newResult: [Project] = []
            if dfs(node: startNode, result: &newResult) {
                result = newResult + result
            }
            else {
                return nil
            }
        }
        
        return result
    }
    
    func dfs(node: Project, result: inout [Project]) -> Bool {
        guard node.state != .visiting else {
            return false
        }
        node.state = .visiting
        
        for edge in node.neighbors {
            let neighbor = edge.destination
            if neighbor.state == .blank {
                dfs(node: neighbor, result: &result)
            }
        }
        
        node.state = .completed
        result = [node] + result
        
        return true
    }
}

let graph = Graph<String>()

let a = graph.addProject("a")
let b = graph.addProject("b")
let c = graph.addProject("c")
let d = graph.addProject("d")
let e = graph.addProject("e")
let f = graph.addProject("f")

let pairs = [[d,a], [b,f], [d,b], [a,f], [c,d]]
graph.buildGraph(pairs: pairs)
let order = graph.findOrder()
print(order)
