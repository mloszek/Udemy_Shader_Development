Shader "Holistic/ToonRamp"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _RampTex("Ramp Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags 
        { 
            "Queue"="Geometry"
        }
        LOD 200

        CGPROGRAM
            #pragma surface surf ToonRamp  

        sampler2D _MainTex;
        sampler2D _RampTex;
        fixed4 _Color;

        half4 LightingToonRamp(SurfaceOutput o, half3 lightDir, half atten)
        {
            float diff = dot(o.Normal, lightDir);
            float h = diff * .5 + .5;
            float2 rh = h;
            float3 ramp = tex2D(_RampTex, rh).rgb;

            float4 c;
            c.rgb = o.Albedo * _LightColor0.rgb * ramp;
            c.a = o.Alpha;
            return c;
        }

        struct Input
        {
            float2 uv_MainTex;
        };        

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Color.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
