#! /usr/bin/env python

import rospy
from random import randint
from std_msgs.msg import Int64

number = Int64()
number.data = randint(0,100)

if __name__ == "__main__":
    rospy.init_node("number_publisher")
    publisher = rospy.Publisher("/seed", Int64, queue_size=1)
    
    rate = rospy.Rate(1)

    while not rospy.is_shutdown():
        publisher.publish(number)
        rate.sleep()
        