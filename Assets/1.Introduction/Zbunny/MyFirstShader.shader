Shader "Holistic/MyFirstShader"
{
	Properties
	{
		_myColour("Example Colour", Color) = (1,1,1,1)
		_myEmission("Example Emission", Color) = (1,1,1,1)
		_myNormal("Example Normal", Color) = (1,1,1,1)
	}

	SubShader
	{
		CGPROGRAM
			#pragma surface surf Lambert

		struct Input
		{
			float2 uvMainTex;
		};

		fixed4 _myColour;
		fixed4 _myEmission;
		fixed4 _myNormal;

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = _myColour.rgba;				 // rgb(a) == xyz(w)
			o.Emission = _myEmission.xyz;			 //
			o.Normal = _myNormal.rgb;				 //
		}

		ENDCG	
	}
	
	FallBack "Diffuse"
}