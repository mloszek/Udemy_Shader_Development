Shader "Holistic/UseProperties"
{
	Properties
	{
		_myColour("Example Colour", Color) = (1,1,1,1)
		_myRange("Example Range", Range(0,5)) = 1
		_myTex("Example Texture", 2D) = "white" {}
		_myCube("Example Cube", CUBE) = "" {}
		_myFloat("Example Float", Float) = 0.5
		_myVector("Example Vector", Vector) = (0.5,1,1,1)
	}

	SubShader
	{
		CGPROGRAM
			#pragma surface surf Lambert

		struct Input
		{
			float2 uv_myTex;		//rule is as follows: "uv" + the name of texture Property, in this case "uv" + _myTex
									//other uv maps must start with "uv2", "uv3" etc.
			float3 worldRefl;
		};

		fixed4 _myColour;
		half _myRange;
		sampler2D _myTex;			//this is the name that variable name in Input struct must contain ^^^
		samplerCUBE _myCube;
		float _myFloat;
		float4 _myVector;

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = (tex2D(_myTex, IN.uv_myTex) * _myRange).rgb * _myColour.rgb;
			o.Emission = texCUBE(_myCube, IN.worldRefl).rgb;
		}

		ENDCG	
	}
	
	FallBack "Diffuse"
}