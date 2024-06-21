#! /usr/bin/env python

import rospy
from my_robot_msgs.msg import HardwareStatus

def cb_recieve_status(data:HardwareStatus):
    rospy.loginfo(f"Motors Up: {data.are_motors_up},"
                  f"Motor Temp: {data.temperature},"
                  f"Message: {data.debug_msg}")

if __name__ == "__main__":
    rospy.init_node("status_sub")

    status_sub = rospy.Subscriber("/my_robot/hardware_status",
                                  HardwareStatus,
                                  cb_recieve_status)
    
    rospy.spin()