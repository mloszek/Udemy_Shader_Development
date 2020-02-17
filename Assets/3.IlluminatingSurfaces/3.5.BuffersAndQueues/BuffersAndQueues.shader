Shader "Holistic/BuffersAndQueues"
{
	Properties
	{
		_MainTex("Albedo", 2D) = "white" {}
	}

	SubShader
	{
		Tags {"Queue" = "Geometry+100"}		//setting custom rendering queue value	
		ZWrite Off							//turns Z buffering off, meaning there is no differentiation between depth of rendered objects

		CGPROGRAM
			#pragma surface surf Lambert

		struct Input
		{
			float2 uv_MainTex;
		};

		sampler2D _MainTex;

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
		}

		ENDCG
	}

		FallBack "Diffuse"
}