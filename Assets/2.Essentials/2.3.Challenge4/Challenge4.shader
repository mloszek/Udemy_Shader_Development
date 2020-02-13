Shader "Holistic/Challenge4"
{
	Properties
	{
		_myTex("Diffuse Texture", 2D) = "white" {}
		_myEmis("Emissive Texture", 2D) = "black" {}
	}

	SubShader
	{
		CGPROGRAM
			#pragma surface surf Lambert

		struct Input
		{
			float2 uv_myTex;
			float2 uv_myEmis;
		};
		
		sampler2D _myTex;
		sampler2D _myEmis;

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = tex2D(_myTex, IN.uv_myTex).rgb;
			o.Emission = tex2D(_myEmis, IN.uv_myEmis).rgb;
		}

		ENDCG	
	}
	
	FallBack "Diffuse"
}