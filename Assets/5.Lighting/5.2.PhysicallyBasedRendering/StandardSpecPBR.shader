Shader "Holistic/StandardSpecPBR"
{
	Properties
	{
		_Colour("Colour", Color) = (1,1,1,1)
		_MetallicTex("Metallic (R)", 2D) = "white" {}
		_SpecColour("Specular", Color) = (1,1,1,1)
	}

	SubShader
	{
		Tags
		{
			"Queue" = "Geometry"
		}

		CGPROGRAM
			#pragma surface surf StandardSpecular	//StandardSpecular

		struct Input
		{
			float2 uv_MetallicTex;
		};

		float4 _Colour;
		sampler2D _MetallicTex;
		float3 _SpecColour;

		void surf(Input IN, inout SurfaceOutputStandardSpecular o)	//SurfaceOutputStandardSpecular
		{
			o.Albedo = _Colour.rgb;
			o.Smoothness = tex2D(_MetallicTex, IN.uv_MetallicTex);
			o.Specular = _SpecColour.rgb;
			//Challenge solution:
			//o.Smoothness = 1 - tex2D(_MetallicTex, IN.uv_MetallicTex);
		}

		ENDCG
	}
	FallBack "Diffuse"
}