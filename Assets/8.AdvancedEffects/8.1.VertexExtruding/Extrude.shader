Shader "Holistic/Extrude"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Extrudion("Extrude", Range(-1, 1)) = 1
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert vertex:vert

        sampler2D _MainTex;
        float _Extrudion;

        struct Input
        {
            float2 uv_MainTex;
        };

        struct appdata
        {
            float4 vertex : POSITION;
            float3 normal : NORMAL;
            float4 texcoord : TEXCOORD0;
        };

        void vert(inout appdata v) 
        {
            v.vertex.xyz += v.normal * .1 * _Extrudion;// *_SinTime;
        }

        void surf (Input IN, inout SurfaceOutput o)
        {
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
            o.Albedo = c.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
