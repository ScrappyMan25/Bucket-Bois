using UnityEngine;

public class Enemy : MonoBehaviour
{
    public float speed = 10f;
    private Transform target;
    private int waypointindex = 0;

    void Start()
    {
        //target = Waypoint.plants[0];
    }

    void Update()
    {
        //Vector3 dir = target.position - transform.position;
        //transform.Translate(dir.normalized * speed * Time.deltaTime, Space.World);

        //if target does not exist. Switch waypoint
    }
}
