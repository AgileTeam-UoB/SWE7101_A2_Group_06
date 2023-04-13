# import the Flask class from the flask library
from flask import Flask,request,jsonify 
# create an instance of the Flask class and assign to app
# SQLAlchemy is an Object Relational Mapper allowing decoupling of db operations
from flask_sqlalchemy import SQLAlchemy
# Marshmallow is an object serialization/deserialization library
from flask_marshmallow import Marshmallow

import json 

# __name__ refers to the default path of the package
app = Flask(__name__)
# decorator @ is used to determine path and trigger proceeding function
@app.get("/")
def hello_world():
 return "<p>Hello, World!</p>"

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
#------------------------------------------------------------------------------
  # class def for SQLAlchemy ORM
class semester(db.Model):
 """Definition of the User Model used by SQLAlchemy"""
 semester_id = db.Column(db.Integer, primary_key=True)
 year = db.Column(db.String(80), nullable=False)
 start_date = db.Column(db.String(80), nullable=False)
 end_date = db.Column(db.String(80), nullable=False)
 semester_name = db.Column(db.Integer, primary_key=False) 
 def __repr__(self):
    return '<User %r>' % self.tutor_id
 
  # class def for SQLAlchemy ORM
class tutor(db.Model):
 """Definition of the User Model used by SQLAlchemy"""
 tutor_id = db.Column(db.Integer, primary_key=True)
 tutor_forename = db.Column(db.String(80), nullable=False)
 tutor_surname = db.Column(db.String(80), nullable=False)
 tutor_email = db.Column(db.String(80), nullable=False)
 def __repr__(self):
    return '<User %r>' % self.tutor_id
 
# class def for SQLAlchemy ORM
class course(db.Model):
 """Definition of the User Model used by SQLAlchemy"""
 course_code = db.Column(db.String(80), primary_key=True)
 course_title = db.Column(db.String(80), nullable=False)
 course_desc = db.Column(db.String(80), nullable=False)
 course_level = db.Column(db.Integer, nullable=False)
 course_credits = db.Column(db.Integer, nullable=False)
 def __repr__(self):
    return '<User %r>' % self.course_code
 
# class def for SQLAlchemy ORM
class module(db.Model):
 """Definition of the User Model used by SQLAlchemy"""
 module_id = db.Column(db.Integer, primary_key=True)
 module_title = db.Column(db.String(80), nullable=False)
 module_desc = db.Column(db.String(80), nullable=False)
 module_level = db.Column(db.String(80), nullable=False)
 module_credits = db.Column(db.Integer, nullable=False)
 course_ref = db.relationship("course", backref=db.backref("course",uselist=False)) 
 course_code = db.Column(db.Integer, db.ForeignKey(course.course_code))
 semester_ = db.relationship("semester", backref=db.backref("semester",uselist=False)) 
 semester_id = db.Column(db.Integer, db.ForeignKey(semester.semester_id))
 taught_ = db.relationship("tutor", backref=db.backref("tutor",uselist=False)) 
 taught_by = db.Column(db.String(80), db.ForeignKey(tutor.tutor_id))
 def __repr__(self):
    return '<User %r>' % self.module_id
 

 
  
# class def for SQLAlchemy ORM
class student(db.Model):
 """Definition of the User Model used by SQLAlchemy"""
 student_id = db.Column(db.Integer, primary_key=True)
 student_forename = db.Column(db.String(80), nullable=False)
 student_surname = db.Column(db.String(80), nullable=False)
 student_email = db.Column(db.String(80), nullable=False)
 student_category = db.Column(db.String(80), nullable=False)
 course_rel = db.relationship("course", backref=db.backref("course_rel",uselist=False)) 
 course_code = db.Column(db.Integer, db.ForeignKey(course.course_code))
 def __repr__(self):
    return '<User %r>' % self.student_id
 


 
 

# class def for SQLAlchemy ORM
class timetable_event(db.Model):
 """Definition of the User Model used by SQLAlchemy"""
 time_table_event_id = db.Column(db.Integer, primary_key=True)
 time_table_event_day = db.Column(db.String(80), nullable=False)
 time_table_event_start_time = db.Column(db.String(80), nullable=False)
 time_table_event_duration = db.Column(db.String(80), nullable=False)
 module_ref = db.relationship("module", backref=db.backref("module",uselist=False)) 
 module_id = db.Column(db.Integer, db.ForeignKey(module.module_id))
 def __repr__(self):
    return '<User %r>' % self.attendance_id


# class def for SQLAlchemy ORM
class attendance(db.Model):
 """Definition of the User Model used by SQLAlchemy"""
 attendance_id = db.Column(db.Integer, primary_key=True)
 attendance_date = db.Column(db.String(80), nullable=False)
 attendance_status = db.Column(db.String(80), nullable=False)
 student_ref =  db.relationship("student", backref=db.backref("fk_attendance_student_id",uselist=False)) 
 student_id = db.Column(db.Integer, db.ForeignKey(student.student_id))
 time_table_event_ = db.relationship("timetable_event", backref=db.backref("fk_attendance_timetable_event_id",uselist=False)) 
 timetable_event_id = db.Column(db.Integer, db.ForeignKey(timetable_event.time_table_event_id))
 def __repr__(self):
    return '<User %r>' % self.attendance_id
 
 # class def for Marshmallow serialization
class AttendanceSchema(ma.SQLAlchemyAutoSchema):
 """Definition used by serialization library based on User Model"""
 class Meta:
    fields = ("attendance_date","timetable_event_id","student_id", "attendance_status")

# instantiate objs based on Marshmallow schemas
attendance_schema = AttendanceSchema()
attendances_schema = AttendanceSchema(many=True)

@app.post("/attendance/bulk-upload")
def add_attendance():
 """endpoint uses json to add user details to db"""
 json_data = request.get_json() # req.get_json() used to access json sent
 print(request.json)
 new_user = attendance (
 attendance_date = json_data['date'],
 timetable_event_id = json_data['timetable_event_id'],
 student_id = json_data['student_id'],
 attendance_status = json_data['attendance']   
 )
 db.session.add(new_user)
 db.session.commit()
 print ("Record added:")
 print (json.dumps(json_data, indent=4)) # used for debugging purposes
 return attendance_schema.jsonify(new_user)
 