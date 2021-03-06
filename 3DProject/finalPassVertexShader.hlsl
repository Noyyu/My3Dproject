
// Input/Output structures

struct myMatrixes
{
    float4x4 WorldViewProjection;
    float4x4 World;
    float4x4 WorldInverseTransposeMatrix; //This might have to be a row_major matrix;
    float time;
    int hasTexture;
    int hasNormal;
    int animated;
};

cbuffer constantBuffer : register(b0)
{
    myMatrixes matrixes;
};

struct VertexShaderInput
{
    float3 position : POSITION;
    float3 color : COLOR;
    float2 textureCoordinates : TEXCOORD;
    float3 normal : NORMAL;
	
};
struct VSOutput
{
    float4 position : SV_Position;
    float3 color : COLOR;
    float2 textureCoordinates : TEXCOORD;
    float3 normal : NORMAL;
    float4 worldPosition : POSITION;
};

// Vertex shader for final pass of light prepass deferred rendering
VSOutput main(in VertexShaderInput input)
{
    VSOutput output;
    
// Pass along the texture coordinate
    output.textureCoordinates = input.textureCoordinates;
    output.position = float4(input.position, 1);
    output.normal = input.normal;
    output.worldPosition = mul(input.position, matrixes.World);
    return output;
}
