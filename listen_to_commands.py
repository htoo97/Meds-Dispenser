import requests
from flask import Flask
from flask import request
from flask import send_from_directory
from twilio import twiml
import subprocess
import re
import MySQLdb

db = MySQLdb.connect(host="localhost", user="root", passwd="admin", db="PillMill")
cur = db.cursor()

app = Flask(__name__)
app.config

@app.route('/sms', methods=['POST','GET'])
def sms():
    number = request.form['From']
    message_body = request.form['Body']
    resp = twiml.Response()

    reply = message_body.lower()
    reply_array = reply.split()

    # proceed only if reply lengths match what's expected
    if len(reply_array) == 2 or len(reply_array) == 4 or len(reply_array) == 10:
        # parse drugName and its ID
        drugName = reply_array[1].lower()

        # format: delete drugName
        if reply_array[0] == "delete" and len(reply_array) == 2:
            drugID = cur.execute("SELECT ISNULL((SELECT DrugID FROM DrugSchedule WHERE DrugName LIKE " + drugName + "), NULL)")
            if drugID == null:
                resp.message("Medicine name not found.")
                return str("error")
            cur.execute("DELETE FROM DrugSchedule WHERE DrugID = " + drugID)
            resp.message(drugName + ' deleted from database and scheduling.')

        # add new drug and schedule for every day
        # format: add drugName pillsPerTime
        elif reply_array[0] == "add" and len(reply_array) == 4:
            pillsPerTime = reply_array[2]
            dailyDose = reply_array[3]
            intDailyDose = int(dailyDose)
            times = [0 for i in range(intDailyDose)]
            if (intDailyDose == 1):
                times[0] = 12
            else:
                times[0] = 7
                times[intDailyDose-1] = 21
                interval = 14 / (intDailyDose - 1)
                for i in range (1, intDailyDose-1):
                    times[i] = times[i-1] + interval
                cur.execute("INSERT INTO DrugSchedule(DrugID, DrugName, PillsPerTime, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday) VALUES ('0', '" + drugName + "', '" + str(pillsPerTime) + "', '" +str(dailyDose) + "', '"+str(dailyDose)+"', '"+str(dailyDose)+"', '"+str(dailyDose)+"', '"+str(dailyDose)+"', '"+str(dailyDose)+"', '"+str(dailyDose)+"')")
                drugID = cur.execute("SELECT DrugID FROM DrugSchedule WHERE DrugName LIKE " + drugName)
                for i in range (0,7):
                    for j in range (0, len(times)):
                        subprocess.call('./cron.sh ' + drugId + " " + pillsPerTime + " 0 " + times[j] + " " + i)
                resp.message(drugName + ' added to database and scheduled.')
        else:
            resp.message('to come soon.')
    else:
        message = "I don't quite understand. Please reply one of the three: \n(1) add [medicine name] [pills per time] [daily dose], \n(2) add [medicine name] [pills per time] [Monday dose] [Tuesday dose] [Wednesday dose] [Thursday dose] [Friday dose] [Saturday dose] [Sunday dose], (3) now [medicine name] [num of pills], or \n(4) delete [medicine name]."
        resp.message(message)

    return str(resp)

if __name__  == '__main__':
    app.run()
