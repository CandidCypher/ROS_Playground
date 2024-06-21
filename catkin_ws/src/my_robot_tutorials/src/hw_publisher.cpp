#include <ros/ros.h>
#include<my_robot_msgs/HardwareStatus.h>


int main(int argc, char** argv)
{
    ros::init(argc, argv, "hardware_status_publisher");
    ros::NodeHandle nh;

    ros::Publisher pub = nh.advertise<my_robot_msgs::HardwareStatus>("/my_robot/hardware_status", 10);

    ros::Rate rate(5);
    my_robot_msgs::HardwareStatus hw_msg;

    hw_msg.are_motors_up=true;
    hw_msg.temperature=45.123;
    hw_msg.debug_msg="Motors are up";

    while(ros::ok())
    {
        pub.publish(hw_msg);
        rate.sleep();
    }
}