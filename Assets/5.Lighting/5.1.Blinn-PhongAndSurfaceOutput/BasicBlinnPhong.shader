Shader "Holistic/BasicBlinn" {
	Properties{
			_Colour("Colour", Color) = (1,1,1,1)
			_SpecColor("Colour", Color) = (1,1,1,1)
			_Spec("Specular", Range(0,1)) = 0.5
			_Gloss("Gloss", Range(0,1)) = 0.5
	}
		SubShader
		{
			Tags
			{
				"Queue" = "Geometry"
			}


			CGPROGRAM
			#pragma surface surf BlinnPhong

			float4 _Colour;
			half _Spec;				//no _SpecColour, because it's already built in and defined. Including will cause error.				
			fixed _Gloss;		

			struct Input {
				float2 uv_MainTex;
			};

			void surf(Input IN, inout SurfaceOutput o) {
				o.Albedo = _Colour.rgb;
				o.Specular = _Spec;
				o.Gloss = _Gloss;
			}
			ENDCG
	}
		FallBack "Diffuse"

}


