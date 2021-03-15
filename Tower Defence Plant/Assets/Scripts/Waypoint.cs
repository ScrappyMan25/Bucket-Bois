
using UnityEngine;

public class Waypoint : MonoBehaviour
{
    public static Transform[] plants;

    void Awake()
    {
        plants = new Transform[transform.childCount];
        for(int i = 0; i < plants.Length; i++)
        {
            plants[i] = transform.GetChild(i);
        }
    }
}
