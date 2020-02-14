using UnityEngine;

[ExecuteInEditMode]
public class ShowNormals : MonoBehaviour
{
    [SerializeField] MeshFilter mesh;
    [Range(-10, 10)]
    [SerializeField] float nx, ny, nz;

    public float normalLength;

    void Update()
    {
        if (!mesh)
            return;

        Vector3[] vertices = mesh.sharedMesh.vertices;
        Vector3[] normals = mesh.sharedMesh.normals;

        Vector3 modNormal = new Vector3(normals[0].x * nx, normals[0].y * ny, normals[0].z * nz);
        normalLength = modNormal.magnitude;

        for (var i = 0; i < normals.Length; i++)
        {
            Vector3 pos = vertices[i];

            pos.x *= transform.localScale.x;            //
            pos.y *= transform.localScale.y;            //
            pos.z *= transform.localScale.z;            //
            pos += transform.position;                  //
            Vector3 posRot = transform.rotation * pos;  //needed when scaling and rotating game object

            normals[i].x *= nx;
            normals[i].y *= ny;
            normals[i].z *= nz;

            Debug.DrawLine(posRot, posRot + normals[i], Color.red);
        }
    }
}
