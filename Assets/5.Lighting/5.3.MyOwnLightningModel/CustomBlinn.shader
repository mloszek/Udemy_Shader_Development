Shader "Holistic/CustomBlinn"
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
            #pragma surface surf CustomBlinn  

        half4 LightingCustomBlinn(SurfaceOutput o, half3 lightDir, half3 viewDir, half atten)
        {
            half3 h = normalize(lightDir + viewDir);

            half diff = max(0, dot(o.Normal, lightDir));

            float nh = max(0, dot(o.Normal, h));
            float spec = pow(nh, 48.0);

            half4 c;
            c.rgb = (o.Albedo * _LightColor0.rgb * diff + _LightColor0.rgb  * spec)* atten;
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
