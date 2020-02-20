Shader "Holistic/Cutoff"
{
	Properties
	{
		_Texture("Base Texture", 2D) = "white" {}
		_RimColor("Rim Color", COLOR) = (0,.5,.5,0)
		_Thickness("Rim Thickness", Range(0, 1)) = 0
		_Power("Power", Range(0, 10)) = 1
		_StripeWidth("Stripe Width", Range(0, 5)) = .4
	}

	SubShader
	{
		CGPROGRAM
			#pragma surface surf Lambert

		struct Input
		{
			float3 viewDir;
			float3 worldPos;
			float2 uv_Texture;
		};

		sampler2D _Texture;
		float4 _RimColor;
		half _Thickness;
		half _Power;
		half _StripeWidth;

		void surf(Input IN, inout SurfaceOutput o)
		{
			half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
			//o.Emission = rim > 1 - .5 ? float3(1,0,0) : rim > .3 ? float3(0,1,0) : 0;				//double color
			//o.Emission = rim > 1 - _Thickness ? _RimColor : 0;									//modified with properties
			//o.Emission = IN.worldPos.y > 1 ? float3(0, 1, 0) : float3(1, 0, 0);					//height-dependent cutoff
			/*o.Emission = frac(IN.worldPos.y * 10 * .5) > .4 ? 
				float3(0, 1, 0) * rim : float3(1, 0, 0);*/											//stripes with rim

			//challenge solution (rim + texture + modable stripe width):
			{
				o.Albedo = tex2D(_Texture, IN.uv_Texture);
				o.Emission = frac(IN.worldPos.y * 10 * (5 - _StripeWidth)) > .4 ?
					float3(0, 1, 0) * pow(rim, _Power) : float3(1, 0, 0) * pow(rim, _Power);
			}
		}

		ENDCG
	}
	FallBack "Diffuse"
}