
struct PixelShaderInput
{
    float4 position : SV_POSITION;
};


float4 main(PixelShaderInput input) : SV_TARGET
{
	return float4(0.0f, 0.0f, 0.0f, 0.0f);
}