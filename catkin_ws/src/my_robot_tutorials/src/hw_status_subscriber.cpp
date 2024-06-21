#include <ros/ros.h>
#include <my_robot_msgs/HardwareStatus.h>


void cb_recieve_status(const my_robot_msgs::HardwareStatus &data)
{
    ROS_INFO("Temperature : %i, Up/Down: %s, Msg: %s",
            (int)data.temperature,
            data.are_motors_up ? "True" : "False",
            data.debug_msg.c_str()
    );
}


int main(int argc, char* argv[])
{
    ros::init(argc, argv, "status_sub");
    ros::NodeHandle nh;

    ros::Subscriber sub = nh.subscribe("/my_robot/hardware_status",
                                        10,
                                        cb_recieve_status);

    ros::spin();
}