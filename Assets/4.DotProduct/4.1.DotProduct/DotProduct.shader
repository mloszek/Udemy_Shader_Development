Shader "Holistic/DotProduct"
{
	Properties
	{
		_Color("Color", Color) = (1,1,1,1)
		_NormZ("Normal Z", Range(.1,10)) = 1
	}

	SubShader
	{
		CGPROGRAM
			#pragma surface surf Lambert

		struct Input
		{
			float3 viewDir;
		};

		float4 _Color;
		half _NormZ;

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Normal *= float3(1, 1, _NormZ);
			half dotp = dot(IN.viewDir, o.Normal);
			o.Albedo = float3(dotp, 1, 1);
			o.Albedo *= _Color;
			//o.Emission = float3(dotp, 1, 1);
			//o.Albedo.gb = float2(1-dot(IN.viewDir, o.Normal), 0);
		}

		ENDCG
	}
	FallBack "Diffuse"
}