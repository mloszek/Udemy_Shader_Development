using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class DecalOnOff : MonoBehaviour
{
    Material mat;
    bool showDecal = true;

    private void OnMouseDown()
    {
        ShowDecal();
    }

    private void Start()
    {
        mat = GetComponent<Renderer>().sharedMaterial;
        ShowDecal();
    }

    private void ShowDecal()
    {
        showDecal = !showDecal;

        if (showDecal)
            mat.SetFloat("_ShowDecal", 1);
        else
            mat.SetFloat("_ShowDecal", 0);
    }
}
