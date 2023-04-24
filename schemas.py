 

from flask import Flask
# create an instance of the Flask class and assign to app
# SQLAlchemy is an Object Relational Mapper allowing decoupling of db operations
from flask_sqlalchemy import SQLAlchemy
# Marshmallow is an object serialization/deserialization library
from flask_marshmallow import Marshmallow
from datetime import date,timedelta
import datetime
from sqlalchemy import and_, or_, not_, exc as sqla_exc
from http_status_code import StatusCode

# __name__ refers to the default path of the package
app = Flask(__name__)

# Marshmallow must be initialised after SQLAlchemy
ma = Marshmallow(app)
# class def for Marshmallow serialization
class TimeTableSchema(ma.SQLAlchemyAutoSchema):
 """Definition used by serialization library based on User Model"""
 class Meta:
    fields = ("timetable_event_id","timetable_event_day","timetable_start_time", "timetable_event_duration","module_id","timetable_end_time")


 
 # class def for Marshmallow serialization
class AttendanceSchema(ma.SQLAlchemyAutoSchema):
 """Definition used by serialization library based on User Model"""
 class Meta:
    fields = ("attendance_date","timetable_event_id","student_id", "attendance_status")

 # class def for Marshmallow serialization
class ModuleSchema(ma.SQLAlchemyAutoSchema):
 """Definition used by serialization library based on User Model"""
 class Meta:
    fields = ("module_id","module_title","module_description", "module_level","module_credits","course_code","Semester_ID","Taught_by")

class SemesterSchema(ma.SQLAlchemyAutoSchema):
 """Definition used by serialization library based on User Model"""
 class Meta:
    fields = ("semester_id","year","start_date", "end_date","semester_name")
 
# class def for Marshmallow serialization
class studentSchema(ma.SQLAlchemyAutoSchema):
 """Definition used by serialization library based on User Model"""
 class Meta:
    fields = ("std_id","student_forename","student_surname", "student_email","student_category","course_code")