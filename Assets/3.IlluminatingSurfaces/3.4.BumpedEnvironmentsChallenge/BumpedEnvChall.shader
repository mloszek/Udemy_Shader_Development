Shader "Holistic/BumpedEnvChall"
{
	Properties
	{
		_normal("Normal", 2D) = "bump" {}
		_cube("Cube Map", CUBE) = "white" {}
	}

	SubShader
	{
		CGPROGRAM
			#pragma surface surf Lambert

		struct Input
		{
			float2 uv_normal;
			float3 worldRefl; INTERNAL_DATA
		};

		sampler2D _normal;
		samplerCUBE _cube;

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Normal = UnpackNormal(tex2D(_normal, IN.uv_normal)).xyz;
			o.Normal *= .3;
			o.Albedo = texCUBE(_cube, WorldReflectionVector(IN, o.Normal));
		}

		ENDCG
	}

		FallBack "Diffuse"
}