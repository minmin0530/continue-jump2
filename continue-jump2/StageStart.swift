//
//  StageStart.swift
//  continue-jump2
//
//  Created by 泉芳樹 on 2024/04/27.
//

import MetalKit

let STAGE_HEIGHT: Int = 14
let STAGE_WIDTH: Int = 12

class StageStart {
    var cubeData:[Cube] = []
    var translateDataCube: [Position] = []
    var originalDataCube: [[Original]] = []
    var dynamicUniformBufferArrayCube: [MTLBuffer]?
    var uniformsArrayCube: [UnsafeMutablePointer<Uniforms>]?
    
    var vertexBufferCube :[MTLBuffer]?
    var originalBufferCube: [MTLBuffer]?
    
    var r = 1
    var g = 1
    var b = 1
    var high: Float = 0.5
    init() {
        for i in 0..<STAGE_HEIGHT {
            for j in -1-STAGE_WIDTH..<STAGE_WIDTH {
                if i % 2 == 0 {
                    if j % 2 == 0 {
                        cubeData.append(Cube(r:Float.random(in:0..<high),g:Float.random(in:0..<high),b:Float.random(in:0..<high),a:1.0,sx:1.0,sy:1.0,sz:1.0))
                    } else {
                        cubeData.append(Cube(r:Float.random(in:0..<high),g:Float.random(in:0..<high),b:Float.random(in:0..<high),a:1.0,sx:1.0,sy:1.0,sz:1.0))
                    }
                } else {
                    if j % 2 == 1 {
                        cubeData.append(Cube(r:Float.random(in:0..<high),g:Float.random(in:0..<high),b:Float.random(in:0..<high),a:1.0,sx:1.0,sy:1.0,sz:1.0))
                    } else {
                        cubeData.append(Cube(r:Float.random(in:0..<high),g:Float.random(in:0..<high),b:Float.random(in:0..<high),a:1.0,sx:1.0,sy:1.0,sz:1.0))
                    }
                }
                translateDataCube.append(Position(x:Float(j) + 7.0,y:-3.0,z:Float(i) * -1.0 + 4.0 ))
                originalDataCube.append([Original(position: [0.0,0.0,0.0])])
            }
        }
        for i in 0..<STAGE_HEIGHT {
            for j in -1-STAGE_WIDTH..<STAGE_WIDTH {
                if i % 2 == 0 {
                    if j % 2 == 0 {
                        cubeData.append(Cube(r:Float.random(in:0..<high),g:Float.random(in:0..<high),b:Float.random(in:0..<high),a:1.0,sx:1.0,sy:1.0,sz:1.0))
                    } else {
                        cubeData.append(Cube(r:Float.random(in:0..<high),g:Float.random(in:0..<high),b:Float.random(in:0..<high),a:1.0,sx:1.0,sy:1.0,sz:1.0))
                    }
                } else {
                    if j % 2 == 1 {
                        cubeData.append(Cube(r:Float.random(in:0..<high),g:Float.random(in:0..<high),b:Float.random(in:0..<high),a:1.0,sx:1.0,sy:1.0,sz:1.0))
                    } else {
                        cubeData.append(Cube(r:Float.random(in:0..<high),g:Float.random(in:0..<high),b:Float.random(in:0..<high),a:1.0,sx:1.0,sy:1.0,sz:1.0))
                    }
                }
                translateDataCube.append(Position(x:Float(j) + 7.0, y:Float(i) - 3.0,z: -10.0))
                originalDataCube.append([Original(position: [0.0,0.0,0.0])])
            }
        }
        
    }
    
    func initUniform(device: MTLDevice, uniformBufferSize: Int) {
        dynamicUniformBufferArrayCube = []
        uniformsArrayCube = []
        for i in 0..<cubeData.count {
            dynamicUniformBufferArrayCube?.append((device.makeBuffer(length:uniformBufferSize, options:[MTLResourceOptions.storageModeShared])!))
            dynamicUniformBufferArrayCube![i].label = "UniformBufferCube"
            uniformsArrayCube?.append(UnsafeMutableRawPointer(dynamicUniformBufferArrayCube![i].contents()).bindMemory(to:Uniforms.self, capacity:1) )
        }
    }
    func updateLeft(characterPosition: SIMD3<Float>) {
        var index = 0
        for _ in 0..<STAGE_HEIGHT * 2 {
            for _ in -STAGE_WIDTH..<STAGE_WIDTH {
                if translateDataCube[index].x > characterPosition.x + Float(STAGE_WIDTH) {
                    cubeData[index].setColor(r:Float.random(in:0..<1),g:Float.random(in:0..<1),b:Float.random(in:0..<1),a:1.0)
                    translateDataCube[index].x = round(characterPosition.x - Float(STAGE_WIDTH))
                }
                index += 1
            }
        }
    }
    func updateRight(characterPosition: SIMD3<Float>) {
        var index = 0
        for _ in 0..<STAGE_HEIGHT * 2 {
            for _ in -STAGE_WIDTH..<STAGE_WIDTH {
                if translateDataCube[index].x < characterPosition.x - Float(STAGE_WIDTH) {
                    cubeData[index].setColor(r:Float.random(in:0..<1),g:Float.random(in:0..<1),b:Float.random(in:0..<1),a:1.0)
                    translateDataCube[index].x = round(characterPosition.x + Float(STAGE_WIDTH))
                }
                index += 1
            }
        }
    }
    func updateGoal(characterPosition: SIMD3<Float>) {
        var index = 0
        for i in 0..<STAGE_HEIGHT {
            for j in -1-STAGE_WIDTH..<STAGE_WIDTH {
                if translateDataCube[index].x < characterPosition.x - Float(STAGE_WIDTH) {
                    if Float(i).truncatingRemainder(dividingBy: 2.0) == 0.0 {
                        if Float(j).truncatingRemainder(dividingBy: 2.0) == 0.0 {
                            cubeData[index].setColor(r:0.0,g:0.0,b:0.0,a:1.0)
                        } else {
                            cubeData[index].setColor(r:1.0,g:1.0,b:1.0,a:1.0)
                        }
                    } else {
                        if Float(j).truncatingRemainder(dividingBy: 2.0) == 0.0 {
                            cubeData[index].setColor(r:1.0,g:1.0,b:1.0,a:1.0)
                        } else {
                            cubeData[index].setColor(r:0.0,g:0.0,b:0.0,a:1.0)
                        }
                    }
                    translateDataCube[index].x = round(characterPosition.x + Float(STAGE_WIDTH))
                }
                index += 1
            }
        }
        for i in 0..<STAGE_HEIGHT {
            for j in -1-STAGE_WIDTH..<STAGE_WIDTH {
                if translateDataCube[index].x < characterPosition.x - Float(STAGE_WIDTH) {
                    if Float(i).truncatingRemainder(dividingBy: 2.0) == 0.0 {
                        if Float(j).truncatingRemainder(dividingBy: 2.0) == 0.0 {
                            cubeData[index].setColor(r:1.0,g:1.0,b:1.0,a:1.0)
                        } else {
                            cubeData[index].setColor(r:0.0,g:0.0,b:0.0,a:1.0)
                        }
                    } else {
                        if Float(j).truncatingRemainder(dividingBy: 2.0) == 0.0 {
                            cubeData[index].setColor(r:0.0,g:0.0,b:0.0,a:1.0)
                        } else {
                            cubeData[index].setColor(r:1.0,g:1.0,b:1.0,a:1.0)
                        }
                    }
                    translateDataCube[index].x = round(characterPosition.x + Float(STAGE_WIDTH))
                }
                index += 1
            }
        }
    }
    
    func update(device: MTLDevice, projectionMatrix: matrix_float4x4, viewMatrix: matrix_float4x4, light: SIMD3<Float>, lightColor: SIMD3<Float>, uniformBufferIndex: Int, uniformBufferOffset: Int, position: SIMD3<Float>) {
        for i in 0..<cubeData.count {
            uniformsArrayCube![i] = UnsafeMutableRawPointer(dynamicUniformBufferArrayCube![i].contents() + uniformBufferOffset).bindMemory(to:Uniforms.self, capacity:1)
            uniformsArrayCube![i][0].projectionMatrix = projectionMatrix
            let translateMatrix = matrix4x4_translation(translateDataCube[i].x,translateDataCube[i].y,translateDataCube[i].z)
            uniformsArrayCube![i][0].modelViewMatrix = simd_mul(viewMatrix, translateMatrix)
            uniformsArrayCube![i][0].lightPosition = light
            uniformsArrayCube![i][0].lightColor = lightColor
        }
        vertexBufferCube = []
        for i in 0..<cubeData.count {
            vertexBufferCube?.append(device.makeBuffer(bytes: cubeData[i].vertexData, length: 82 * cubeData[i].vertexData.count, options:[])!)
        }
        originalBufferCube = []
        for data in originalDataCube {
            originalBufferCube?.append( device.makeBuffer(bytes: data, length: 16, options:[])! )
        }
    }
    
    func draw(renderCommandEncoder: MTLRenderCommandEncoder, uniformBufferOffset: Int){
        var i = 0
        for data in vertexBufferCube! {
            renderCommandEncoder.setVertexBuffer(data, offset: 0, index: 0)
            renderCommandEncoder.setVertexBuffer(dynamicUniformBufferArrayCube![i], offset:uniformBufferOffset, index: BufferIndex.uniforms.rawValue)
            renderCommandEncoder.setVertexBuffer(originalBufferCube![i], offset:0, index: BufferIndex.originalPositions.rawValue)
            renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: 36, instanceCount: 12)
            i += 1
        }
        
    }
}
