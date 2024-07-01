#! /usr/bin/env python

# Standard Library Imports
from time import time

import rospy
from std_msgs.msg import Bool, Int64
from my_robot_msgs.srv import setLEDState
from my_robot_msgs.msg import LEDPanelStatus


on_duration = 7
battery_percentage = Int64()
battery_percentage.data = 100
battery_full = True
off_cycles = 0
ledStates = LEDPanelStatus()

def cb_recieve_led_state(states:LEDPanelStatus):
    global ledStates
    ledStates = states


def IsBatteryFull():
    if battery_percentage.data > 0:
        return True
    else:
        return False
    
if __name__ == "__main__":
    rospy.init_node("battery_manager")
    battery_status_pub = rospy.Publisher("/battery_full",
                                         Bool,
                                         queue_size=1)
    
    battery_level_pub = rospy.Publisher("/battery_percent",
                                        Int64,
                                        queue_size=10)
    
    led_status_sub = rospy.Subscriber("/led_state",
                                      LEDPanelStatus,
                                      cb_recieve_led_state)

    rospy.wait_for_service("/set_led_state")
    led_service = None
    try:
        led_service = rospy.ServiceProxy("/set_led_state", setLEDState)
        
    except rospy.ServiceException as e:
        rospy.logwarn(f"Service failed: {e}")
    rate = rospy.Rate(1)
    time_on = time()
    if not ledStates.status[1]:
        response = led_service(1, True)
        #rospy.loginfo(f"Service Response: {response}")

    while not rospy.is_shutdown():
        elapsed_time = time()
        if elapsed_time - time_on >= on_duration:
            battery_percentage.data -= 14
            if battery_percentage.data < 0:
                if led_service:
                    if ledStates.status[1]:
                        response = led_service(1,False)
                        #rospy.loginfo(f"Service Response: {response}")
                if off_cycles < 2:
                    battery_percentage.data = 0
                    off_cycles += 1
                else:
                    battery_percentage.data = 100
                    off_cycles = 0
                    time_on = time()
                    if not ledStates.status[1]:
                        response = led_service(1, True)
                        #rospy.loginfo(f"Service Response: {response}")

        battery_full = IsBatteryFull()
        
        battery_status_pub.publish(battery_full)
        battery_level_pub.publish(battery_percentage)

        rate.sleep()