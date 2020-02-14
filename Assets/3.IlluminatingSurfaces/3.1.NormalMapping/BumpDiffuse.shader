Shader "Holistic/BumpDiffuse"
{
	Properties
	{
		_myDiffuse("Diffuse Texture", 2D) = "white" {}
		_myBump("Normal Texture", 2D) = "bump" {}
		_mySlider("Bump Amount", Range(-10,10)) = 1
		_myScale("Scale Amount", Range(0,10)) = 0.5
	}

	SubShader
	{
		CGPROGRAM
			#pragma surface surf Lambert

		struct Input
		{
			float2 uv_myDiffuse;
			float2 uv_myBump;
		};

		sampler2D _myDiffuse;
		sampler2D _myBump;
		half _mySlider;
		half _myScale;

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = tex2D(_myDiffuse, IN.uv_myDiffuse * _myScale).rgb;
			o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump * _myScale));
			o.Normal *= float3(_mySlider, _mySlider, 1);
		}

		ENDCG
	}

		FallBack "Diffuse"
}