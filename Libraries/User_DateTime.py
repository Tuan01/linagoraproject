from datetime import datetime
import os
import time


def convert_string_to_date(datetime_string, date_format):
    date_time_obj = datetime.strptime(datetime_string, date_format)
    print('datetime obj is: ', date_time_obj)
    return date_time_obj


def convert_time_second_to_hour_and_minute(time_second):
    evaluate_time = time.gmtime(time_second)
    res_time = time.strftime("%H:%M", evaluate_time)
    return res_time
