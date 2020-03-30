﻿Shader "Holistic/VFMat"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white" {}
        _ScaleUVX("Ripple Scale X", Range(1, 61)) = 1
        _ScaleUVY("Ripple Scale Y", Range(1, 61)) = 1
    }
    SubShader
    {

        Tags
        {
            "Queue" = "Transparent"
        }
        
        GrabPass        //for GrabTexture
        {

        }

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _GrabTexture;
            sampler2D _MainTex;
            float4 _MainTex_ST;
            half _ScaleUVX;
            half _ScaleUVY;

            v2f vert(appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                o.uv.x = sin(o.uv.x * _ScaleUVX);
                o.uv.y = sin(o.uv.y * _ScaleUVY);
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                //fixed4 col = tex2D(_MainTex, i.uv);
                fixed4 col = tex2D(_GrabTexture, i.uv);     //for GrabTexture
                return col;
            }
        ENDCG
        }
    }
}