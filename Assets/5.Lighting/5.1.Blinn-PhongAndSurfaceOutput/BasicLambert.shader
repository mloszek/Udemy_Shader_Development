Shader "Holistic/BasicLambert"
{
	Properties
	{
		_Colour("Colour", Color) = (.5,.5,.5,1)
	}

		SubShader
		{
			Tags
			{
				"Queue" = "Geometry"
			}

			CGPROGRAM
				#pragma surface surf Lambert

			struct Input
			{
				float2 uv_MainTex;
			};

			float4 _Colour;

			void surf(Input IN, inout SurfaceOutput o)
			{
				o.Albedo = _Colour.rgb;
			}

			ENDCG
		}

			FallBack "Diffuse"
}