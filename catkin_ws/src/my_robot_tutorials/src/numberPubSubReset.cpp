#include <ros/ros.h>
#include <std_msgs/Int64.h>
#include <std_srvs/SetBool.h>


std_msgs::Int64 value;
bool handle_counter_reset(std_srvs::SetBool::Request &request,
                        std_srvs::SetBool::Response &response)
{
    ROS_INFO("Reset counter request");
    value.data = 0;
    response.message = "Reset complete";
    response.success = true;
    return true;
}

void cb_recieve_seed(const std_msgs::Int64 &seed)
{
    if(value.data==0)
    {
        ROS_INFO("Seed recieved: %i", (int)seed.data);
        value.data = seed.data;
    }
    else
    {
        value.data += 1;
        ROS_INFO("Incrementing counter %i", (int)value.data);
    }
}

void cb_recieve_count(const std_msgs::Int64 &count)
{
    ROS_INFO("Counter: %i", (int)count.data);
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "number_pubsub");
    ros::NodeHandle nh;
    ros::Subscriber sub_seed = nh.subscribe("/seed",
                                            1,
                                            cb_recieve_seed);

    ros::Subscriber sub_counter = nh.subscribe("/counter",
                                                1,
                                                cb_recieve_count);

    ros::Publisher pub = nh.advertise<std_msgs::Int64>("/counter", 1);
    ros::ServiceServer resetServer = nh.advertiseService("/reset_counter",
                                                    handle_counter_reset);
    ros::spin();

}