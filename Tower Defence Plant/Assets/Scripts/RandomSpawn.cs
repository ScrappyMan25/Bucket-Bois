using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RandomSpawn : MonoBehaviour
{
    [SerializeField]
    public GameObject[] enemies;
    private int xPos;
    private int zPos;
    private int enemyCount = 0;
    private int xSafePos;
    private int zSafePos;
    public int totalEnemy;

    private void Start()
    {
        StartCoroutine(SpawnAnEnemy());
    }

    IEnumerator SpawnAnEnemy()
    {
        while (enemyCount < totalEnemy)
        {
            xPos = Random.Range(-150, 150);
            zPos = Random.Range(-150, 150);
            Vector3 spawnRadius = new Vector3(xPos, 4, zPos);
            if ((xPos > 100 || xPos < -100) || (zPos > 100 || zPos < -100))
            {
                Instantiate(enemies[Random.Range(0, enemies.Length)], spawnRadius, Quaternion.identity);
                yield return new WaitForSeconds(0.1f);
                enemyCount++;
            }
        }  
    }

    private void OnDrawGizmos()
    {
        Gizmos.color = Color.red;
        // Gizmos.DrawWireSphere(GameObject.FindGameObjectWithTag("Mother").transform.position, spawnRadius);
    }
}
