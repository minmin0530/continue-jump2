//
//  ShaderTypes.h
//  continue-jump2
//
//  Created by 泉芳樹 on 2024/04/27.
//

//
//  Header containing types and enum constants shared between Metal shaders and Swift/ObjC source
//
#ifndef ShaderTypes_h
#define ShaderTypes_h

#ifdef __METAL_VERSION__
#define NS_ENUM(_type, _name) enum _name : _type _name; enum _name : _type
typedef metal::int32_t EnumBackingType;
#else
#import <Foundation/Foundation.h>
typedef NSInteger EnumBackingType;
#endif

#include <simd/simd.h>

typedef NS_ENUM(EnumBackingType, BufferIndex)
{
    BufferIndexMeshPositions        = 0,
    BufferIndexUniforms             = 1,
    BufferIndexOriginalPositions    = 2,
};

typedef NS_ENUM(EnumBackingType, VertexAttribute)
{
    VertexAttributePosition  = 0,
    VertexAttributeColor  = 1,
};

typedef struct
{
    matrix_float4x4 projectionMatrix;
    matrix_float4x4 modelViewMatrix;
    vector_float3   lightPosition;
    vector_float3   lightColor;
} Uniforms;

typedef struct
{
    vector_float3 position;
} OriginalPositions;

#endif /* ShaderTypes_h */

