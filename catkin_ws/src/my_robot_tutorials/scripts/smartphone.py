#! /usr/bin/env python

import rospy
from std_msgs.msg import String


def cb_recieve_radio_dat(msg):
    rospy.loginfo(f"Message Recieved: {msg}")


if __name__ == "__main__":
    rospy.init_node("smartphone", anonymous=True)
    sub = rospy.Subscriber("/robot_news_radio", String,
                           cb_recieve_radio_dat)
    rospy.spin()