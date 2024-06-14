#include <ros/ros.h>

int main(int argc, char **argv)
{
    ros::init(argc, argv, "my_first_cpp_node");
    ros::NodeHandle nh;

    ROS_INFO("Node has been started");

    ros::Rate rate(1);

    int count = 1;
    while(ros::ok())
    {
        ROS_INFO("Hello %i", count);
        count += 1;
        rate.sleep();
    }
}