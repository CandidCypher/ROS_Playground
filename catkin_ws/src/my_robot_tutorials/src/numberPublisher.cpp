#include <random>
#include <ros/ros.h>
#include <std_msgs/Int64.h>


int main(int argc, char* argv[])
{
    ros::init(argc, argv, "number_publisher");
    ros::NodeHandle nh;

    ros::Publisher pub = nh.advertise<std_msgs::Int64>("/seed", 1);

    ros::Rate rate(1);
    std_msgs::Int64 value;
    // Generate some random value
    std::random_device randDev;
    std::mt19937 rng(randDev());
    
    std::uniform_int_distribution<std::mt19937::result_type>dist6(0,100); // distribution in range [1, 6]
    value.data = (int64_t)dist6(rng);
    while(ros::ok())
    {
       pub.publish(value);
       rate.sleep();     
    }
}