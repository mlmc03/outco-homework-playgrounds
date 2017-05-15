
/*
 *                                 Homework VII
 *
 *  Problem: Graph
 *
 *  Prompt: Create a Vertex class/constructor and Graph class/constructor.
 *          Name it Graph.
 *
 *  The Vertex will have the following properties:
 *
 *               value: integer value (initially null)
 *               edges: hash that contains edges to other vertices
 *
 *  The Graph will have the following properties:
 *
 *            vertices: A hash/dictionary/object to store vertices.
 *       totalVertices: The total number of vertices in your Graph.
 *          totalEdges: The total number of edges in your Graph
 *
 *  The Graph will also have the following methods:
 *
 *           addVertex: Method that accepts an id (int/str), and creates an
 *                      object with a "value" of id, and a property called
 *                      "edges" which will store the edges of the vertex. If a
 *                      vertex with the id already exists, then do not create a
 *                      new vertex.
 *
 *           getVertex: Method that takes an id, and outputs the vertex with the
 *                      matching id, if it exists.
 *
 *             addEdge: Method that accepts two different id's as its input, and
 *                      creates an edge between both vertices.
 *                      (This edge may look like [id1,id2])
 *
 *          removeEdge: Method that accepts two different id's as its input, and
 *                      removes the edge between the two vertices if it exists.
 *
 *        removeVertex: Method that takes an id as its input, and removes the
 *                      vertex with the matching id.
 *
 *       findNeighbors: Method that accepts an id as its input, and returns
 *                      all of the edges of that vertex.
 *
 *  Input:  N/A
 *  Output: A Graph instance
 *
 *  What are the time and auxilliary space complexities of the various methods?
 *
 */

class Vertex {
    var value: Int
    var edges: [Int: Vertex]
    
    init(value: Int) {
        self.value = value
        self.edges = [:]
    }
}

class Graph {
    
    var vertices: [Int: Vertex] = [:]
    var totalVertices: Int = 0
    var totalEdges: Int = 0
    
    func addVertex(id: Int) {
        // check if the vertex already exists
        guard vertices[id] == nil else {
            return
        }
        
        // create the vertex since it doesn't exist
        let vertex = Vertex(value: id)
        vertices[id] = vertex
        totalVertices += 1
    }
    
    func getVertex(id: Int) -> Vertex? {
        return vertices[id]
    }
    
    func addEdge(id1: Int, id2: Int) {
        guard vertices[id1] != nil,
            vertices[id2] != nil else {
                return
        }
        
        let vertex1 = vertices[id1]!
        let vertex2 = vertices[id2]!
        
        vertex1.edges[vertex2.value] = vertex2
        vertex1.edges[vertex1.value] = vertex1
        totalEdges += 2
    }
    
    func removeEdge(id1: Int, id2: Int) {
        guard vertices[id1] != nil,
            vertices[id2] != nil else {
                return
        }
        
        let vertex1 = vertices[id1]!
        let vertex2 = vertices[id2]!
        
        vertex1.edges[vertex2.value] = nil
        vertex1.edges[vertex1.value] = nil
        totalEdges -= 2
    }
    
    func removeVertex(id: Int) {
        guard vertices[id] != nil else {
            return
        }
        
        // remove the vertex
        vertices[id] = nil
        
        // remove any edges to/from this vertex
        for v in vertices {
            let vertex = v.value
            if vertex.edges[id] != nil {
                vertex.edges[id] = nil
                totalEdges -= 1
            }
        }
        
        // decrement the vertex count
        totalVertices -= 1
    }
    
    func findNeighbors(id: Int) -> [Int: Vertex] {
        guard vertices[id] != nil else {
            return [:]
        }
        
        let vertex = vertices[id]!
        return vertex.edges
    }
}

var work = Vertex(value: 5)
assert(work.value == 5)

var work1 = Vertex(value: 5)
var work2 = Vertex(value: 10)
work1.edges[work2.value] = work2
work2.edges[work1.value] = work1
assert(work1.edges[work2.value]?.value == 10 && work2.edges[work1.value]?.value == 5)











