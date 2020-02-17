using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class Rotate : MonoBehaviour
{
    [SerializeField] float speed;

    void Update()
    {
        transform.Rotate(Vector3.up, Time.deltaTime * speed);        
    }
}
