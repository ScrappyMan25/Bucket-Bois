using UnityEngine;

public class Enemy : MonoBehaviour
{
    public float speed = 10f;
    private Transform target;
    private Rigidbody enemyGrav;
    public int health;
    public int attackDamage;
    public float attackSpeed;
    private float attackCooldown = 0f;
    private bool moving = true;

    void Awake()
    {
        target = GameObject.FindGameObjectWithTag("Mother").transform; //sets the target to "Mother"
        enemyGrav = gameObject.GetComponent<Rigidbody>();
    }

    void FixedUpdate()
    {
        attackCooldown -= Time.deltaTime; //You want to make sure the attackCooldown is always decreasing every frame.
        if (moving)
        {
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
        else
        {
            enemyGrav.velocity = Vector3.zero;
        }
    }

    private void OnTriggerStay(Collider other)
    {
        if (other.tag == "Tree" || other.tag == "Player")
        {
            target = other.transform; // Targets if the tag is Tree or Player
        }
    }

    private void OnTriggerExit(Collider other)
    {
        target = GameObject.FindGameObjectWithTag("Mother").transform; //When exiting the trigger range it will target back to the "Mother" tree.
    }

    private void OnCollisionStay(Collision collision)
    {
        //Play attack animation
        if(collision.gameObject.tag == "Player" && attackCooldown <= 0f) //Checks to see what object it collides with. attackCooldown so that when colliding the hp doesn't drop every frame but instead "attackSpeed" second.
        {
            GameObject player = GameObject.Find("FirstPersonPlayer");
            player.GetComponent<PlayerMovement>().playerHealth -=1;
            attackCooldown = 1f / attackSpeed;
            
        }
        if (collision.gameObject.tag == "Tree" && attackCooldown <= 0f)
        {
            Destroy(collision.gameObject);
            //GameObject plant = GameObject.Find("Tree");
            //plant.takedamage(attackDamage)
            //attackCooldown = 1f / attackSpeed;
        }
        if(collision.gameObject.tag == "Mother" && attackCooldown <=0)
        {
            
        }
    }

    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.tag != "Enemy")
        {
            moving = false;
        }
    }

    private void OnCollisionExit(Collision collision)
    {
        if (collision.gameObject.tag != "Mother" && collision.gameObject.tag != "Tree")
        {
            moving = true;
        }
    }

    public void TakeDamage(int damage)
    {
        health -= damage;
        if (health <= 0)
        {
            Destroy(this.gameObject);
        }
    }
}
