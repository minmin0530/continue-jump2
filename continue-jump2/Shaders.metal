//
//  Shaders.metal
//  continue-jump2
//
//  Created by 泉芳樹 on 2024/04/27.
//

// File for Metal kernel and shader functions

#include <metal_stdlib>
#include <simd/simd.h>

// Including header shared between this Metal shader code and Swift/C code executing Metal API commands
#import "ShaderTypes.h"

using namespace metal;

struct Vertex {
    float4 position [[position]];
    float4 color;
    float3 normal;
};

struct ColorInOut {
    float4 position [[position]];
    float4 color;
    float3 normal;
    float3 light;
    float3 lightColor;
};

vertex ColorInOut vertexShader(constant Vertex *vertices [[buffer(0)]],
                          uint vid [[vertex_id]],
                          constant Uniforms & uniforms [[ buffer(1) ]],
                          constant OriginalPositions & origins [[ buffer(2) ]]
                          ) {
    ColorInOut out;
    out.position = uniforms.projectionMatrix * uniforms.modelViewMatrix * (vertices[vid].position + float4(origins.position, 1.0));
    out.color = vertices[vid].color;
    out.normal = ( uniforms.projectionMatrix * uniforms.modelViewMatrix * float4(vertices[vid].normal, 1.0) ).xyz;
    out.light = uniforms.lightPosition;
    out.lightColor = uniforms.lightColor;
    return out;
}

fragment float4 fragmentShader(ColorInOut vert [[stage_in]]) {
    float3 halfway = normalize(vert.light.xyz + vert.position.xyz);
    float specular = pow(max(dot(vert.normal, halfway), 0.0), 2);
    float directional = max(dot(normalize(vert.light) , vert.normal), 0.0);
    float3 vLighting = vert.color.rgb + (vert.lightColor * (directional + specular));
    return float4(vLighting, vert.color.a);
}
