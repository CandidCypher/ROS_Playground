#! /usr/bin/env python

import rospy
from random import randint
from std_msgs.msg import Int64

number = Int64()
number.data = randint(0,100)
frequency = rospy.get_param("/number_frequency")

if __name__ == "__main__":
    rospy.init_node("number_publisher", anonymous=True)
    publisher = rospy.Publisher("/seed", Int64, queue_size=1)
    rospy.set_param("/published_number",number.data)
    rate = rospy.Rate(frequency)

    while not rospy.is_shutdown():
        publisher.publish(number)
        rate.sleep()
        