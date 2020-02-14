using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class NormalPlay : MonoBehaviour
{
    [SerializeField] Vector3 normal = new Vector3(0, 1, 0);

    [Range(1.0f, 10.0f)]
    [SerializeField] float xmod, ymod, zmod = 1;

    void Update()
    {
        Vector3 result = new Vector3(normal.x * xmod, normal.y * ymod, normal.z * zmod);
        Debug.DrawRay(this.transform.position, result, Color.red);
    }
}
