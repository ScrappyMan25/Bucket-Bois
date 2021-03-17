using UnityEngine;

public class Enemy : MonoBehaviour
{
    public float speed = 10f;
    private Transform target;
    private GameObject turret;
    public int health;
    public int attackDamage;
    public float attackSpeed;
    private float attackCooldown = 0f;

    void Awake()
    {
        target = GameObject.FindGameObjectWithTag("Mother").transform; //sets the target to "Mother"
    }

    void Update()
    {
        attackCooldown -= Time.deltaTime; //You want to make sure the attackCooldown is always decreasing every frame.
        try //Check incase the "Tree" object is being destroyed it will catch the error and change back the target to "Mother"
        {
            Vector3 targetDir = target.position - transform.position; //Gets the direction of the targets position.
            transform.Translate(targetDir.normalized * speed * Time.deltaTime, Space.World); //move into that direction toward the target.
        }
        catch
        {
            target = GameObject.FindGameObjectWithTag("Mother").transform;
        }
    }

    public GameObject FindClosestTurret() //useless
    {
        GameObject[] gos;
        gos = GameObject.FindGameObjectsWithTag("Tree");
        GameObject closest = null;
        float distance = Mathf.Infinity;
        Vector3 position = transform.position;
        foreach (GameObject go in gos)
        {
            Vector3 diff = go.transform.position - position;
            float curDistance = diff.sqrMagnitude;
            if (curDistance < distance)
            {
                closest = go;
                distance = curDistance;
            }
        }
        return closest;
    }

    private void OnTriggerStay(Collider other)
    {
        target = other.transform; // Targets whatever object it finds.
    }

    private void OnTriggerExit(Collider other)
    {
        target = GameObject.FindGameObjectWithTag("Mother").transform; //When exiting the trigger range it will target back to the "Mother" tree.
    }

    private void OnCollisionStay(Collision collision)
    {
        //Play attack animation
        if(collision.gameObject.name == "FirstPersonPlayer" && attackCooldown <= 0f) //Checks to see what object it collides with. attackCooldown so that when colliding the hp doesn't drop every frame but instead "attackSpeed" second.
        {
            GameObject player = GameObject.Find("FirstPersonPlayer");
            //player.health -1;
            attackCooldown = 1f / attackSpeed;
        }
        if (collision.gameObject.name == "Tree" && attackCooldown <= 0f)
        {
            Destroy(collision.gameObject);
            //GameObject plant = GameObject.Find("Tree");
            //plant.takedamage(attackDamage)
            //attackCooldown = 1f / attackSpeed;
        }
    }

    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.name == "SphereBullet") //If collide with a "SphereBullet" it will lose hp and will destroy itself when it reaches down to 0.
        {
            this.health -= 10;
        }
        if(health <=0)
        {
            Destroy(gameObject);
        }
    }
}
