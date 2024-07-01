#! /usr/bin/env python

import rospy
from std_msgs.msg import Bool, Int64
from std_srvs.srv import SetBool
from my_robot_msgs.srv import setLEDState
from my_robot_msgs.msg import LEDPanelStatus

led_states = LEDPanelStatus()
led_states.status = [False, False, False]


def cb_recieve_battery_status(bat_status:Bool):
    rospy.loginfo(f"Battery Status: {bat_status.data}")


def cb_recieve_battery_percent(bat_percent:Int64):
    rospy.loginfo(f"Battery Percentage: {bat_percent.data}")


def handle_set_state(ledState:setLEDState._request_class):
    global led_states
    if ledState.ledIndex > len(led_states.status) or ledState.ledIndex < 0:
        return {"successs":False}
    led_states.status[ledState.ledIndex] = ledState.ledStatus
    #rospy.loginfo(f"LED States: {led_states}")
    return {"successs":True}

if __name__ == "__main__":
    rospy.init_node("led_manager")
    battery_status_sub = rospy.Subscriber("/battery_full",\
                                          Bool,
                                          cb_recieve_battery_status)
    

    battery_percent_sub = rospy.Subscriber("/battery_percent",
                                           Int64,
                                           cb_recieve_battery_percent)

    led_state_service = rospy.Service("/set_led_state",
                                      setLEDState,
                                      handle_set_state)
    
    led_state_pub = rospy.Publisher("/led_state",
                                    LEDPanelStatus,
                                    queue_size=1)
    rate = rospy.Rate(1)
    while not rospy.is_shutdown():
        led_state_pub.publish(led_states)
        rospy.loginfo(f"LED States: {led_states}")
        rate.sleep()
    