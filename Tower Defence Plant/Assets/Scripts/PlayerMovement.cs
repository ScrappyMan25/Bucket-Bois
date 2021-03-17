using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    //player variables
    // gun variables are on the gun child object
    public CharacterController controller;
    public Interactable focus;

    public float speed = 12f;
    public float gravity = -9.8f;
    public float jumpHeight = 3f;
    public float nrOfEnemiesKilled = 0f;
    public Transform groundCheck;
    public float groundDistance = 0.4f;
    public LayerMask groundMask;

    public float playerHealth = 3f;
    public float playerMoney = 0f;
    public float totalDeaths = 0f;
    public float wavesCleared = 0f;
    public float shotsFired = 0f;
    public float totalScore = 0f;
    public float plantsPlaced = 0f;
    float timePlayedDecimal = 0f;
    public string timePlayed;

    public GameObject Tree;
    private float temp = 5.353087f;

    Vector3 velocity;
    bool isGrounded;
    public bool isDead = false;
    public bool completedRound = false;
    
    Camera cam;

    // Start is called before the first frame update
    void Start()
    {
        cam = Camera.main;
    }

    // Update is called once per frame
    void Update()
    {
        //timer for game so we know how long the player has been going for
        timePlayedDecimal += Time.deltaTime;
        timePlayed = timePlayedDecimal.ToString("0");


        isGrounded = Physics.CheckSphere(groundCheck.position, groundDistance, groundMask);

        if (isGrounded && velocity.y < 0)
        {
            velocity.y = -2f;
        }

        float x = Input.GetAxis("Horizontal");
        float z = Input.GetAxis("Vertical");

        Vector3 move = transform.right * x + transform.forward * z;

        if (Input.GetButtonDown("Jump") && isGrounded)
        {
            velocity.y = Mathf.Sqrt(jumpHeight * -2f * gravity);
        }

        controller.Move(move * speed * Time.deltaTime);

        velocity.y += gravity * Time.deltaTime;

        controller.Move(velocity * Time.deltaTime);

        if (Input.GetKeyUp(KeyCode.E) && GetComponentInChildren<MeshRenderer>().material.color == Color.red)
        {
            Transform Trees = GameObject.Find("Trees").transform;
            Instantiate(Tree, new Vector3(this.transform.position.x, Trees.position.y + temp, this.transform.position.z), Quaternion.identity, Trees);
        }

        // select an object
        if (Input.GetKeyDown(KeyCode.F))

        {
            //create a ray
            Ray ray = cam.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;



            if (Physics.Raycast(ray, out hit, 100))
            {
                //object has to have interactable script attached to become selectable
                Interactable interactable = hit.collider.GetComponent<Interactable>();
                if (interactable != null)
                {
                    SetFocus(interactable);
                    Debug.Log("you have selected " + interactable);
                }


            }



        }

        if (Input.GetKeyDown(KeyCode.E))
        {
            Ray ray = cam.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;


            if (Physics.Raycast(ray, out hit, 100))
            {
                RemoveFocus();
                Debug.Log("you have de-selected the item");

            }
        }

        checkRadius();

        Die();
    }



    void Die()
    {
        if (playerHealth <= 0)
        {
            playerHealth = 0;
            isDead = true;
            Debug.Log("player Died you suck!!!");
        }
        
    }

    void takeDamage()
    {
        playerHealth -= 1f;
    }

    void earnMoney()
    {
        playerMoney += 10f;
    }

    void resetPlayer()
    {
        playerHealth = 3;
        playerMoney = 0;
        nrOfEnemiesKilled = 0;
    }

    void SetFocus(Interactable newFocus)
    {
        focus = newFocus;
       
    }

    void RemoveFocus()
    {
        focus = null;
       

    }

    void checkRadius()
    {
        if (focus != null)
        {


            if (Vector3.Distance(focus.gameObject.transform.position, gameObject.transform.position) > focus.gameObject.GetComponent<Interactable>().radius)
            {

                RemoveFocus();
            }

        }
    }
}
