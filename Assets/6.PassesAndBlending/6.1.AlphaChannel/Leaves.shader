﻿Shader "Holistic/Leaves"
{
	Properties
	{
		_Color("Color", Color) = (1,1,1,1)
		_MainTex("Main Texture", 2D) = "white"{}
	}
	
	SubShader
	{
		Tags
		{
			"Queue" = "Transparent"
		}

		CGPROGRAM
			#pragma surface surf Lambert alpha:fade		

		struct Input
		{
			float2 uv_MainTex;
		};

		sampler2D _MainTex;

		void surf(Input IN, inout SurfaceOutput o)
		{
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
		FallBack "Diffuse"
}