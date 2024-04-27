//
//  Cube.swift
//  continue-jump2
//
//  Created by 泉芳樹 on 2024/04/27.
//

struct Vertex2 {
    var position: vector_float4
    var color: vector_float4
    var normal: vector_float3
}

let white_edge : vector_float4 = [0.5, 0.5, 0.5, 1.0]
let white_face : vector_float4 = [0.5, 0.5, 0.5, 0.3]
let red   : vector_float4 = [1.0, 0.0, 0.0, 1.0]
let green : vector_float4 = [0.0, 1.0, 0.0, 1.0]
let blue  : vector_float4 = [0.0, 0.0, 1.0, 0.3]
let violet: vector_float4 = [1.0, 0.0, 1.0, 1.0]
let yellow: vector_float4 = [1.0, 1.0, 0.0, 1.0]
let cyan  : vector_float4 = [0.0, 1.0, 1.0, 1.0]
let xlp: Float =  1.2
let xlm: Float = -1.2
let ylp: Float =  1.2
let ylm: Float = -1.2
let zlp: Float =  1.2
let zlm: Float = -1.2

let xsp: Float =  1.0
let xsm: Float = -1.0
let ysp: Float =  1.0
let ysm: Float = -1.0
let zsp: Float =  1.0
let zsm: Float = -1.0
class Cube {
    
    var vertexData = [
        Vertex2(position: [ 1.0,  1.0, 1.0, 1.0], color: white_face, normal: [0.0, 0.0, 1.0]),
        Vertex2(position: [-1.0,  1.0, 1.0, 1.0], color: white_face, normal: [0.0, 0.0, 1.0]),
        Vertex2(position: [ 1.0, -1.0, 1.0, 1.0], color: white_face, normal: [0.0, 0.0, 1.0]),
        Vertex2(position: [ 1.0, -1.0, 1.0, 1.0], color: white_face, normal: [0.0, 0.0, 1.0]),
        Vertex2(position: [-1.0,  1.0, 1.0, 1.0], color: white_face, normal: [0.0, 0.0, 1.0]),
        Vertex2(position: [-1.0, -1.0, 1.0, 1.0], color: white_face, normal: [0.0, 0.0, 1.0]),
        
        
        Vertex2(position: [-1.0, 1.0,  1.0, 1.0], color: white_face, normal: [0.0, 1.0, 0.0]),
        Vertex2(position: [ 1.0, 1.0,  1.0, 1.0], color: white_face, normal: [0.0, 1.0, 0.0]),
        Vertex2(position: [ 1.0, 1.0, -1.0, 1.0], color: white_face, normal: [0.0, 1.0, 0.0]),
        Vertex2(position: [-1.0, 1.0,  1.0, 1.0], color: white_face, normal: [0.0, 1.0, 0.0]),
        Vertex2(position: [ 1.0, 1.0, -1.0, 1.0], color: white_face, normal: [0.0, 1.0, 0.0]),
        Vertex2(position: [-1.0, 1.0, -1.0, 1.0], color: white_face, normal: [0.0, 1.0, 0.0]),
        
        Vertex2(position: [1.0,  1.0, -1.0, 1.0], color: white_face, normal: [1.0, 0.0, 0.0]),
        Vertex2(position: [1.0,  1.0,  1.0, 1.0], color: white_face, normal: [1.0, 0.0, 0.0]),
        Vertex2(position: [1.0, -1.0,  1.0, 1.0], color: white_face, normal: [1.0, 0.0, 0.0]),
        Vertex2(position: [1.0,  1.0, -1.0, 1.0], color: white_face, normal: [1.0, 0.0, 0.0]),
        Vertex2(position: [1.0, -1.0,  1.0, 1.0], color: white_face, normal: [1.0, 0.0, 0.0]),
        Vertex2(position: [1.0, -1.0, -1.0, 1.0], color: white_face, normal: [1.0, 0.0, 0.0]),
        
        Vertex2(position: [-1.0,  1.0, -1.0, 1.0], color: white_face, normal: [0.0, 0.0, 1.0]),
        Vertex2(position: [ 1.0,  1.0, -1.0, 1.0], color: white_face, normal: [0.0, 0.0, 1.0]),
        Vertex2(position: [ 1.0, -1.0, -1.0, 1.0], color: white_face, normal: [0.0, 0.0, 1.0]),
        Vertex2(position: [-1.0,  1.0, -1.0, 1.0], color: white_face, normal: [0.0, 0.0, 1.0]),
        Vertex2(position: [ 1.0, -1.0, -1.0, 1.0], color: white_face, normal: [0.0, 0.0, 1.0]),
        Vertex2(position: [-1.0, -1.0, -1.0, 1.0], color: white_face, normal: [0.0, 0.0, 1.0]),
        
        Vertex2(position: [ 1.0, -1.0,  1.0, 1.0], color: white_face, normal: [0.0, 1.0, 0.0]),
        Vertex2(position: [-1.0, -1.0,  1.0, 1.0], color: white_face, normal: [0.0, 1.0, 0.0]),
        Vertex2(position: [ 1.0, -1.0, -1.0, 1.0], color: white_face, normal: [0.0, 1.0, 0.0]),
        Vertex2(position: [ 1.0, -1.0, -1.0, 1.0], color: white_face, normal: [0.0, 1.0, 0.0]),
        Vertex2(position: [-1.0, -1.0,  1.0, 1.0], color: white_face, normal: [0.0, 1.0, 0.0]),
        Vertex2(position: [-1.0, -1.0, -1.0, 1.0], color: white_face, normal: [0.0, 1.0, 0.0]),
        
        Vertex2(position: [-1.0,  1.0,  1.0, 1.0], color: white_face, normal: [1.0, 0.0, 0.0]),
        Vertex2(position: [-1.0,  1.0, -1.0, 1.0], color: white_face, normal: [1.0, 0.0, 0.0]),
        Vertex2(position: [-1.0, -1.0,  1.0, 1.0], color: white_face, normal: [1.0, 0.0, 0.0]),
        Vertex2(position: [-1.0, -1.0,  1.0, 1.0], color: white_face, normal: [1.0, 0.0, 0.0]),
        Vertex2(position: [-1.0,  1.0, -1.0, 1.0], color: white_face, normal: [1.0, 0.0, 0.0]),
        Vertex2(position: [-1.0, -1.0, -1.0, 1.0], color: white_face, normal: [1.0, 0.0, 0.0]),
    ]
    
    init(r:Float,g:Float,b:Float,a:Float,sx:Float,sy:Float,sz:Float) {
        for i in 0..<vertexData.count {
            vertexData[i].color[0] = r
            vertexData[i].color[1] = g
            vertexData[i].color[2] = b
            vertexData[i].color[3] = a
            vertexData[i].position[0] *= sx
            vertexData[i].position[1] *= sy
            vertexData[i].position[2] *= sz
        }
    }
    func setColor(r:Float,g:Float,b:Float,a:Float) {
        for i in 0..<vertexData.count {
            vertexData[i].color[0] = r
            vertexData[i].color[1] = g
            vertexData[i].color[2] = b
            vertexData[i].color[3] = a
        }
    }
    func setSize(size:Float) {
        for i in 0..<vertexData.count {
            vertexData[i].position[0] *= size
            vertexData[i].position[1] *= size
            vertexData[i].position[2] *= size
        }
    }
}
