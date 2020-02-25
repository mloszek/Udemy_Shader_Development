Shader "Holistic/CustomLambert"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
    }
    SubShader
    {
        Tags 
        { 
            "Queue"="Geometry"
        }
        LOD 200

        CGPROGRAM
            #pragma surface surf CustomLambert  

        half4 LightingCustomLambert(SurfaceOutput o, half3 lightDir, half atten) //Custom lighting model need to be defined with following convention: "Lighting" + name from pragma
        {
            half NdotL = dot(o.Normal, lightDir);
            half4 c;
            c.rgb = o.Albedo * _LightColor0.rgb * (NdotL * atten);
            c.a = o.Alpha;
            return c;
        }

        struct Input
        {
            float2 uv_MainTex;
        };
        
        sampler2D _MainTex;
        fixed4 _Color;

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Color.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
