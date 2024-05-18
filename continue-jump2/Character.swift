//
//  Character.swift
//  continue-jump2
//
//  Created by 泉芳樹 on 2024/04/27.
//

import MetalKit

class Character {
    var jumpFlag: Bool = true
    var jumpFlagZ: Bool = true
    var jumpSpeed: Float = 0.0
    var jumpSpeedZ: Float = 0.0
    var gravity: Float = 0.015
    var spinData: Rotation = Rotation(axis: [ 0.0, 1.0, 0.0], angle: 0.0, speed: 0.03)

    /*[
        // head
        Rotation(axis: [ 0.0, 1.0, 0.0], angle: 0.0, speed: 0.01),
        Rotation(axis: [ 0.0, 1.0, 0.0], angle: 0.0, speed: 0.01),
        Rotation(axis: [ 0.0, 1.0, 0.0], angle: 0.0, speed: 0.01),
        Rotation(axis: [ 0.0, 1.0, 0.0], angle: 0.0, speed: 0.01),
        Rotation(axis: [ 0.0, 1.0, 0.0], angle: 0.0, speed: 0.01),
        Rotation(axis: [ 0.0, 1.0, 0.0], angle: 0.0, speed: 0.01),
        Rotation(axis: [ 0.0, 1.0, 0.0], angle: 0.0, speed: 0.01),
        Rotation(axis: [ 0.0, 1.0, 0.0], angle: 0.0, speed: 0.01),
        Rotation(axis: [ 0.0, 1.0, 0.0], angle: 0.0, speed: 0.01),
        
        // left hand
        Rotation(axis: [ 0.0, 1.0, 0.0], angle: 0.0, speed: 0.01),
        // right hand
        Rotation(axis: [ 0.0, 1.0, 0.0], angle: 0.0, speed: 0.01),
        
        // body
        Rotation(axis: [ 0.0, 1.0, 0.0], angle: 0.0, speed: 0.01),
        Rotation(axis: [ 0.0, 1.0, 0.0], angle: 0.0, speed: 0.01),
        
        // left foot
        Rotation(axis: [ 0.0, 1.0, 0.0], angle: 0.0, speed: 0.01),
        // right foot
        Rotation(axis: [ 0.0, 1.0, 0.0], angle: 0.0, speed: 0.01),
        
        // tail
        Rotation(axis: [ 0.0, 1.0, 0.0], angle: 0.0, speed: 0.01),
        Rotation(axis: [ 0.0, 1.0, 0.0], angle: 0.0, speed: 0.01),
        Rotation(axis: [ 0.0, 1.0, 0.0], angle: 0.0, speed: 0.01),
        Rotation(axis: [ 0.0, 1.0, 0.0], angle: 0.0, speed: 0.01),
    ]
    
    
    var originalData: [[Original]] = [
        // head
        [Original(position: [ 0.5/3.0, 4.7/3.0, -1.0/3.0])],
        [Original(position: [-2.5/3.0, 4.7/3.0, -1.0/3.0])],
        [Original(position: [ 0.5, 3.7/3.0,  0.0])],
        [Original(position: [-0.5, 3.7/3.0,  0.0])],
        [Original(position: [ 0.0, 2.0/3.0,  0.0])],
        [Original(position: [ 0.0,-1.0/3.0,  0.0])],
        [Original(position: [ 0.5, 0.0,  1.0])],
        [Original(position: [-0.5, 0.0,  1.0])],
        [Original(position: [ 0.0,-1.0/3.0,  1.0])],
        
        // left hand
        [Original(position: [ 7.0/3.0, -1.0,  0.0])],
        // right hand
        [Original(position: [-7.0/3.0, -1.0,  0.0])],
        
        // body
        [Original(position: [ 0.0, -4.0/3.0,  0.0])],
        [Original(position: [ 0.0, -2.0,  0.0])],
        
        // left foot
        [Original(position: [ 4.0/3.0, -3.0,  1.0/3.0])],
        // right foot
        [Original(position: [-4.0/3.0, -3.0,  1.0/3.0])],
        
        // tail
        [Original(position: [ 0.0, -3.0,  -2.5/3.0])],
        [Original(position: [-0.8/3.0, -4.2,  -2.5/3.0])],
        [Original(position: [-4.0/3.0, -4.4,  -2.5/3.0])],
        [Original(position: [-6.0/3.0, -4.4,  -2.5/3.0])],
        
        ]
    
    var translateData: [Position] = [
        // head
        Position(x:0.0, y:5.0, z:-5.0),
        Position(x:0.0, y:5.0, z:-5.0),
        Position(x:0.0, y:5.0, z:-5.0),
        Position(x:0.0, y:5.0, z:-5.0),
        Position(x:0.0, y:5.0, z:-5.0),
        Position(x:0.0, y:5.0, z:-5.0),
        Position(x:0.0, y:5.0, z:-5.0),
        Position(x:0.0, y:5.0, z:-5.0),
        Position(x:0.0, y:5.0, z:-5.0),
        
        // left hand
        Position(x:0.0, y:5.0, z:-5.0),
        // right hand
        Position(x:0.0, y:5.0, z:-5.0),
        
        // body
        Position(x:0.0, y:5.0, z:-5.0),
        Position(x:0.0, y:5.0, z:-5.0),
        
        // left foot
        Position(x:0.0, y:5.0, z:-5.0),
        // right foot
        Position(x:0.0, y:5.0, z:-5.0),
        
        // tail
        Position(x:0.0, y:5.0, z:-5.0),
        Position(x:0.0, y:5.0, z:-5.0),
        Position(x:0.0, y:5.0, z:-5.0),
        Position(x:0.0, y:5.0, z:-5.0),
    ]
    
    
    
    var cubeData = [
        // head
        Cube(r:0.0,g:0.0,b:0.0,a:1.0,sx:0.7/3.0,sy:0.7/3.0,sz:0.7/3.0),
        Cube(r:0.0,g:0.0,b:0.0,a:1.0,sx:0.7/3.0,sy:0.7/3.0,sz:0.7/3.0),
        Cube(r:0.0,g:0.0,b:0.0,a:1.0,sx:0.7/3.0,sy:0.7/3.0,sz:0.7/3.0),
        Cube(r:0.0,g:0.0,b:0.0,a:1.0,sx:0.7/3.0,sy:0.7/3.0,sz:0.7/3.0),
        Cube(r:0.0,g:0.0,b:0.0,a:1.0,sx:1.0,sy:1.0/3.0,sz:1.0),
        Cube(r:1.0,g:1.0,b:0.5,a:1.0,sx:1.0,sy:2.0/3.0,sz:1.0),
        Cube(r:0.0,g:0.0,b:0.0,a:1.0,sx:0.5/3.0,sy:1.0/3.0,sz:0.5/3.0),
        Cube(r:0.0,g:0.0,b:0.0,a:1.0,sx:0.5/3.0,sy:1.0/3.0,sz:0.5/3.0),
        Cube(r:0.0,g:0.0,b:0.0,a:1.0,sx:0.5/3.0,sy:0.5/3.0,sz:0.5/3.0),
        
        // left hand
        Cube(r:1.0,g:1.0,b:0.5,a:1.0,sx:1.0,sy:2.0/3.0,sz:1.0),
        // right hand
        Cube(r:1.0,g:1.0,b:0.5,a:1.0,sx:1.0,sy:2.0/3.0,sz:1.0),
        
        // body
        Cube(r:1.0,g:1.0,b:0.5,a:1.0,sx:2.0/3.0,sy:1.0/3.0,sz:2.0/3.0),
        Cube(r:0.0,g:0.0,b:0.0,a:1.0,sx:1.0,sy:1.0/3.0,sz:1.0),
        
        // left foot
        Cube(r:1.0,g:1.0,b:0.5,a:1.0,sx:2.5/3.0,sy:2.5/3.0,sz:2.5/3.0),
        // right foot
        Cube(r:1.0,g:1.0,b:0.5,a:1.0,sx:2.5/3.0,sy:2.5/3.0,sz:2.5/3.0),
        
        // tail
        Cube(r:0.0,g:0.0,b:0.0,a:1.0,sx:0.5/3.0,sy:3.0/3.0,sz:0.5/3.0),
        Cube(r:0.0,g:0.0,b:0.0,a:1.0,sx:0.5/3.0,sy:0.5/3.0,sz:0.5/3.0),
        Cube(r:0.0,g:0.0,b:0.0,a:1.0,sx:3.0/3.0,sy:0.5/3.0,sz:0.5/3.0),
        Cube(r:0.0,g:0.0,b:0.0,a:1.0,sx:1.5/3.0,sy:1.5/3.0,sz:1.5/3.0),
        
        ]
 */
    var originalDataVoxel: [[Original]] = []
    var translateDataVoxel: [Position] = []
    var cubeDataVoxel: [Cube] = []
    
    var vertexBuffer :[MTLBuffer]?
    var originalBuffer: [MTLBuffer]?
    
    var dynamicUniformBufferArray: [MTLBuffer]?
    var uniformsArray: [UnsafeMutablePointer<Uniforms>]?
    
    func setVoxel(data: Data?) {
        do {
            let strData: String = String(data: data!, encoding: .utf8)!
            let voxel = try JSONSerialization.jsonObject(with: strData.data(using: String.Encoding.utf8)!) as! Dictionary<String, Any>
            let roomData = voxel["room"]! as! Dictionary<String, Any>
            let voxelData = roomData["voxel"]! as! [Dictionary<String, Float>]
            let materialData = roomData["materials"]! as! [Dictionary<String, Double>]
            for v in voxelData {
                let m = materialData[   Int(v["m"]!)   ]["color"]
                let r = Float((m! / 65536).truncatingRemainder(dividingBy: 256) / 256)
                let g = Float((m! / 256).truncatingRemainder(dividingBy: 256) / 256)
                let b = Float((m!).truncatingRemainder(dividingBy: 256) / 256)
                let a = Float(materialData[   Int(v["m"]!)   ]["alpha"]!)
                cubeDataVoxel.append(Cube(r: r, g: g, b: b, a: a, sx: 0.5, sy: 0.5, sz: 0.5))
                translateDataVoxel.append(Position(x: v["z"]! / 1, y: v["y"]! / 1 - 4, z: v["x"]! / 1))
                originalDataVoxel.append([Original(position: [v["z"]! / 1, v["y"]! / 1 - 4, v["x"]! / 1])])
            }
        } catch {
            print("voxel parse error")
        }
    }
    func initUniform(device: MTLDevice, uniformBufferSize: Int) {
        dynamicUniformBufferArray = []
        uniformsArray = []
        for i in 0..<originalDataVoxel.count {
            dynamicUniformBufferArray?.append((device.makeBuffer(length:uniformBufferSize, options:[MTLResourceOptions.storageModeShared])!))
            dynamicUniformBufferArray![i].label = "UniformBufferCharacter"
            uniformsArray?.append(UnsafeMutableRawPointer(dynamicUniformBufferArray![i].contents()).bindMemory(to:Uniforms.self, capacity:1) )
        }
    }
    
    func update(device: MTLDevice, projectionMatrix: matrix_float4x4, viewMatrix: matrix_float4x4, light: SIMD3<Float>, lightColor: SIMD3<Float>, uniformBufferIndex: Int, uniformBufferOffset: Int, position: SIMD3<Float>) {
        
        for i in 0..<originalDataVoxel.count {
            uniformsArray![i] = UnsafeMutableRawPointer(dynamicUniformBufferArray![i].contents() + uniformBufferOffset).bindMemory(to:Uniforms.self, capacity:1)
            uniformsArray![i][0].projectionMatrix = projectionMatrix
            
            
            let spinMatrix = matrix4x4_rotation(radians: spinData.angle, axis: spinData.axis)
            let translateMatrix = matrix4x4_translation(translateDataVoxel[i].x,translateDataVoxel[i].y,translateDataVoxel[i].z)
                        uniformsArray![i][0].modelViewMatrix = simd_mul(viewMatrix, spinMatrix)
            uniformsArray![i][0].modelViewMatrix = simd_mul(viewMatrix, translateMatrix)
            uniformsArray![i][0].modelViewMatrix = simd_mul(uniformsArray![i][0].modelViewMatrix, spinMatrix)
            
            uniformsArray![i][0].lightPosition = light
            uniformsArray![i][0].lightColor = lightColor

            
            
            translateDataVoxel[i].x = position.x
            translateDataVoxel[i].y = position.y
            translateDataVoxel[i].z = position.z
        }
        spinData.angle += spinData.speed

        vertexBuffer = []
        for i in 0..<cubeDataVoxel.count {
            vertexBuffer?.append(device.makeBuffer(bytes: cubeDataVoxel[i].vertexData, length: 82 * cubeDataVoxel[i].vertexData.count, options:[])!)
        }
        
        originalBuffer = []
        for data in originalDataVoxel {
            originalBuffer?.append( device.makeBuffer(bytes: data, length: 16, options:[])! )
        }
        
    }
    
    func draw(renderCommandEncoder: MTLRenderCommandEncoder, uniformBufferOffset: Int) {
        var i = 0
        for data in originalBuffer! {
            renderCommandEncoder.setVertexBuffer(vertexBuffer![i], offset: 0, index: 0)
            renderCommandEncoder.setVertexBuffer(dynamicUniformBufferArray![i], offset:uniformBufferOffset, index: BufferIndex.uniforms.rawValue)
            renderCommandEncoder.setVertexBuffer(data, offset:0, index: BufferIndex.originalPositions.rawValue)
            renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: 36, instanceCount: 12)
            i += 1
        }
        
    }
}
