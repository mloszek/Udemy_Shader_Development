Shader "Holistic/Blending"
{
	Properties
	{
		_MainTex("Texture", 2D) = "black" {}
	}

	SubShader
	{
		Tags
		{
			"Queue" = "Transparent"
		}

		//Blend One One
		//Blend SrcAlpha OneMinusSrcAlpha //standard blend
		Blend DstColor Zero

		Pass
		{
			SetTexture[_MainTex] { combine texture }
		}
	}
		FallBack "Diffuse"
}