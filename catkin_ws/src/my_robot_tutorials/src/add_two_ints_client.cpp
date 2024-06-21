#include <ros/ros.h>
#include <rospy_tutorials/AddTwoInts.h>



int main(int argc, char* argv[])
{
    ros::init(argc, argv, "add_two_ints_client");
    ros::NodeHandle nh;

    ros::ServiceClient client = 
            nh.serviceClient<rospy_tutorials::AddTwoInts>("/add_two_ints");

    rospy_tutorials::AddTwoInts service;
    service.request.a = 12;
    service.request.b = 5;

    if(client.call(service))
    {
        ROS_INFO("Returned sum is %i", (int)service.response.sum);
    }
    else
    {
        ROS_WARN("Service call falied");
    }
}
