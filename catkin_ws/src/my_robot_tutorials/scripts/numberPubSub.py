#! /usr/bin/env python

import rospy
from std_msgs.msg import Int64


value = 0


def cb_recieve_data(data:Int64):
    global value
    if not value:
        rospy.loginfo(f"Seed recieved {data.data}")
        value = data
    else:
        value.data += 1
        rospy.loginfo(f"Counter incrementing: {value.data}")
        

def cb_recieve_count(data:Int64):
    rospy.loginfo(f"Counter: {data.data}")

if __name__ == "__main__":
    rospy.init_node("number_pubsub")

    sub_seed = rospy.Subscriber("/seed", 
                           Int64, 
                           cb_recieve_data)
    
    sub_counter = rospy.Subscriber("/counter",
                                   Int64,
                                   cb_recieve_count)
    
    pub = rospy.Publisher("counter_count", Int64, queue_size=1)
    rate = rospy.Rate(1)

    while not rospy.is_shutdown():
        pub.publish(value)
        rate.sleep()
    rospy.loginfo("Node is exiting")