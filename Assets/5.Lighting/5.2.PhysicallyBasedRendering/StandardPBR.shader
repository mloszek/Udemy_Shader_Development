Shader "Holistic/StandardPBR"
{
	Properties
	{
		_Colour("Colour", Color) = (1,1,1,1)
		_MetallicTex("Metallic (R)", 2D) = "white" {}
		_Metallic("Metallic", Range(0,1)) = 0
	}

	SubShader
	{
		Tags
		{
			"Queue" = "Geometry"
		}

		CGPROGRAM
			#pragma surface surf Standard	//Standard, not Lambert or Blin-Phong

		struct Input
		{
			float2 uv_MetallicTex;
		};

		float4 _Colour;
		sampler2D _MetallicTex;
		half _Metallic;

		void surf(Input IN, inout SurfaceOutputStandard o)	//SurfaceOutputStandard instead of SurfaceOutput, because Standard is declared in pragma above
		{
			o.Albedo = _Colour.rgb;
			o.Smoothness = tex2D(_MetallicTex, IN.uv_MetallicTex).r;
			o.Metallic = _Metallic;
		}

		ENDCG
	}
	FallBack "Diffuse"
}