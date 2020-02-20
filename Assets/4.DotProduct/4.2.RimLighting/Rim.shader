Shader "Holistic/Rim"
{
	Properties
	{
		_RimColor("Rim Color", COLOR) = (0,.5,.5,0)
		_Power("Power", Range(.5, 10)) = 1
	}

	SubShader
	{
		CGPROGRAM
			#pragma surface surf Lambert

		struct Input
		{
			float3 viewDir;
		};

		float4 _RimColor;
		half _Power;

		void surf(Input IN, inout SurfaceOutput o)
		{
			half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
			o.Emission = _RimColor.rgb * pow(rim, _Power);
		}

		ENDCG
	}
	FallBack "Diffuse"
}