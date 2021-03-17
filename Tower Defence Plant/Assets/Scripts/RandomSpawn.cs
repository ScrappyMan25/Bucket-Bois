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
    public int totalEnemy;
    public int spawnRange;

    private void Start()
    {
        StartCoroutine(SpawnAnEnemy());
    }

    IEnumerator SpawnAnEnemy()
    {
        while (enemyCount < totalEnemy)
        {
            xPos = Random.Range(-spawnRange, spawnRange);
            zPos = Random.Range(-spawnRange, spawnRange);
            Vector3 spawnRadius = new Vector3(xPos, 4, zPos);
            if ((xPos > (spawnRange - 50) || xPos < -(spawnRange - 50)) || (zPos > (spawnRange - 50) || zPos < -(spawnRange - 50)))
            {
                Instantiate(enemies[Random.Range(0, enemies.Length)], spawnRadius, Quaternion.identity, transform);
                yield return new WaitForSeconds(0.1f);
                enemyCount++;
            }
        }
    }

    private void OnDrawGizmos()
    {
        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(GameObject.FindGameObjectWithTag("Mother").transform.position, spawnRange);
    }
}
