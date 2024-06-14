#!/usr/bin/env python


import rospy

if __name__ == "__main__":
    rospy.init_node("my_first_python_node")

    rospy.loginfo("This node has been started")
    count = 1
    script_rate = rospy.Rate(1)
    while not rospy.is_shutdown():
        rospy.loginfo(f"Hello {count}")
        count+=1
        script_rate.sleep()
    