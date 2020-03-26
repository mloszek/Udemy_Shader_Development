Shader "Holistic/ColourVF"
{
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION; //only x and z coordinates, y will not make a change
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float4 color : COLOR;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.color.r = v.vertex.x;         //xyz coordinates of world space, rounds on every vertex
                o.color.g = v.vertex.z;
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                fixed4 col = i.color;           
                //col.r = i.vertex.x / 1000;      //xyz coordinates of screen space, rounds on every pixel
                //col.g = i.vertex.y / 1000;
                return col;
            }
            ENDCG
        }
    }
}
