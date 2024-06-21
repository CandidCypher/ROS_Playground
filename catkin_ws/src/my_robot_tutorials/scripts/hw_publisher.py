#! /usr/bin/env python

import rospy
from my_robot_msgs.msg import HardwareStatus

if __name__ == "__main__":
    rospy.init_node("hardware_status_publisher")

    pub = rospy.Publisher("/my_robot/hardware_status", HardwareStatus, queue_size=10)

    rate = rospy.Rate(5)

    while not rospy.is_shutdown():
        msg = HardwareStatus()
        msg.are_motors_up = True
        msg.temperature = 45
        msg.debug_msg = "Robot is running"

        pub.publish(msg)
        rate.sleep()