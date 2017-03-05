import MySQLdb

db = MySQLdb.connect(host="localhost",
                     user="root",
                     passwd="admin",
                     db="PillMill")

cur = db.cursor()

cur.execute("SELECT * FROM DrugSchedule")

for row in cur.fetchall():
    for i in range(0,len(row)-1):
        print row[i]

db.close()
