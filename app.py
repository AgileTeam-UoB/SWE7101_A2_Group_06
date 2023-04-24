
from flask import Flask,request,jsonify 
# create an instance of the Flask class and assign to app
# SQLAlchemy is an Object Relational Mapper allowing decoupling of db operations
from flask_sqlalchemy import SQLAlchemy
# Marshmallow is an object serialization/deserialization library
from flask_marshmallow import Marshmallow
from datetime import date
import datetime
from sqlalchemy import exc as sqla_exc
from http_status_code import StatusCode
import json 
from modules import attendance, timetable_event, tutor, student, semester, module
from schemas import AttendanceSchema, TimeTableSchema, studentSchema, SemesterSchema,ModuleSchema



# __name__ refers to the default path of the package
app = Flask(__name__)


# SQLAlchemy configuration
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:''@localhost/db_python' # path to db
app.config['SQLALCHEMY_ECHO'] = True # echoes SQL for debug
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
#------------------------------------------------------------------------------
# instantiate db obj using the SQLAlchemy class with the Flask app obj as arg
db = SQLAlchemy(app)
#------------------------------------------------------------------------------
# Marshmallow must be initialised after SQLAlchemy
ma = Marshmallow(app)




#---------------------- instantiate objs based on Marshmallow schemas-------------------------------------
attendance_schema = AttendanceSchema()
attendances_schema = AttendanceSchema(many=True)

module_schema = ModuleSchema()
modules_schema = ModuleSchema(many=True)

semester_schema = SemesterSchema()
semesters_schema = SemesterSchema(many=True)

student_schema = studentSchema()
students_schema = studentSchema(many=True)

timetable_schema = TimeTableSchema()
timetables_schema = TimeTableSchema(many=True)

#---------------------------------POST APIs--------------------------------------------------------------
@app.post("/attendance/bulk-upload")
def add_attendance():
 """endpoint uses json to add user details to db"""
 try:
  json_data = request.get_json() # req.get_json() used to access json sent
  n= len(request.json)
  for idx, x in enumerate(json_data): 
    new_user = attendance (
    attendance_date = json_data[idx]['date'],
    timetable_event_id = json_data[idx]['timetable_event_id'],
    student_id = json_data[idx]['student_id'],
    attendance_status = json_data[idx]['attendance']   
    )
    db.session.add(new_user)
    db.session.commit()
    print ("Record added:")
    print (json.dumps(json_data, indent=4)) # used for debugging purposes
  return attendance_schema.jsonify(new_user)
 except Exception as e: 
   return jsonify({"message":str(e)}), StatusCode.HTTP_500_INTERNAL_SERVER_ERROR
 
 

  
#---------------------------------GET APIs----------------------------------------------------------- --

@app.get("/getAllLessons/<Taught_by>")
def getAllModules(Taught_by):
  try:
   modules = module.query.filter_by(Taught_by= Taught_by).all()
   return modules_schema.jsonify(modules)
  except Exception as e: 
   return jsonify({"message":str(e)}), StatusCode.HTTP_500_INTERNAL_SERVER_ERROR










  
#---------------------------------PUT APIs----------------------------------------------------------------- 
