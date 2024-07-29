#include <ros/ros.h>
#include <sensor_msgs/Image.h>

void imageCallback(const sensor_msgs::ImageConstPtr &image)
{
    long long sum = 0;
    for (int value : image->data)
    {
        sum += value;
    }
    int avg = sum / image->data.size();
    ROS_INFO("Brightness: %d", avg);
}

int main(int argc, char **argv)
{
   ros::init(argc, argv, "my_first_node");
   ros::NodeHandle n("~");
   ros::Subscriber sub = n.subscribe("/camera/color/image_raw", 10, imageCallback);

   ROS_INFO("Node started!");
   ros::spin();
}
