#! /usr/bin/env python

import rospy
from std_msgs.msg import String


if __name__ == "__main__":
    rospy.init_node("robot_news_radio_transmitter",anonymous=True)
    pub = rospy.Publisher("robot_news_radio", String, queue_size=10)

    rate = rospy.Rate(2)

    while not rospy.is_shutdown():
        msg = String()
        msg.data = "Good morning Vietnam!!"
        pub.publish(msg)
        rate.sleep()

    rospy.loginfo("Node is exiting")