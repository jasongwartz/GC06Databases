import unittest
import requests
import pymysql.cursors
import json

# Connect to the database
with open("config.json", "r") as f:
    config = json.loads(f.read())
connection = pymysql.connect(host=config["host"],
                             user=config["user"],
                             password=config["password"],
                             db=config["db"],
                             cursorclass=pymysql.cursors.DictCursor)

def query_db(sql):
    try:
        with connection.cursor() as cursor:
            cursor.execute(sql)
            return cursor.fetchall()
    finally:
        connection.close()


def reach_server(endpoint, params):
    #return requests.get("http://gc06.jasongwartz.com/api" + "/users")
    r = requests.get("http://gc06.jasongwartz.com/api/" + endpoint,
        params = params)
    return r
    

class SQLTest(unittest.TestCase):
    
    def test_users(self):
        pairs = {
            "users": "SELECT * FROM users WHERE `user_id`=1;"
        }
        
        a = reach_server("users", params = {'id':1, 'access_token':'token'})
        b = query_db(pairs["users"])        
        self.assertEqual(a.json(), b)
        
        
     


if __name__ == '__main__':
    unittest.main()