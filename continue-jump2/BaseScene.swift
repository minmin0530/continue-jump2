//
//  BaseScene.swift
//  continue-jump2
//
//  Created by 泉芳樹 on 2024/04/27.
//

import MetalKit

class BaseScene {
    var mtkView: MTKView?
    var changeScene:Scene = Scene.opening
    var windowSize: CGSize?
    init(metalKitView: MTKView) {
    }
    func setVoxel(data: Data?) {
    }
    func draw(in view: MTKView, pipelineState: MTLRenderPipelineState, depthStencilState: MTLDepthStencilState) {
    }
    
    func setSize(size: CGSize) {
    }
}
