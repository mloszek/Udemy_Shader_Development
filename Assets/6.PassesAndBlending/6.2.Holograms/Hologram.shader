Shader "Holistic/Hologram"
{
	Properties
	{
		_RimColor("Rim Color", Color) = (1,1,1,1)
		_RimPower("Rim Power", Range(.5, 8.0)) = 3.0
	}

	SubShader
	{
		Tags
		{
			"Queue" = "Transparent"
		}

		Pass //Pass for making additional drawing before CGPROGRAM. In this case it makes insides of Zombunny invisible
		{
			ZWrite On
			ColorMask 0
		}

		CGPROGRAM
			#pragma surface surf Lambert alpha:fade

		struct Input
		{
			float2 viewDir;
		};

		float4 _RimColor;
		half _RimPower;

		void surf(Input IN, inout SurfaceOutput o)
		{
			half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
			o.Emission = _RimColor.rgb * pow(rim, _RimPower);
			o.Alpha = pow(rim, _RimPower);

		}
		ENDCG
	}
		FallBack "Diffuse"
}