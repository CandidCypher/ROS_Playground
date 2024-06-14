#include <ros/ros.h>
#include <std_msgs/Int64.h>


std_msgs::Int64 value;

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

    ros::spin();

}