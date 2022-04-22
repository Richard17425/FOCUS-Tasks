

该例程将发布turtle1/cmd_vel话题（topic），消息类型geometry_msgs::Twist   *用来控制海龟完成速度指令的运动

 
```
#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
```
Twist是ROS自带的线速度和角速度关系的头文件

```
int main(int argc, char **argv)
{
	// ROS节点初始化
	ros::init(argc, argv, "velocity_publisher");
```
首先进行节点初始化，velocity_publisher是设置的节点名字（节点名字不能重复）
argc, argv是输入的参数，来设置初始化的一些属性

```
	// 创建节点句柄
	ros::NodeHandle n;
```
用来管理ROS的API等资源，为后面调用做准备

```
	// 创建一个Publisher，发布名为/turtle1/cmd_vel的topic，消息类型为geometry_msgs::Twist，队列长度10
	ros::Publisher turtle_vel_pub = n.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 10);
```
< >中为发布的消息类型
队列长度是先把消息存放在队列中，再来传送

```
	// 设置循环的频率
	ros::Rate loop_rate(10);

	int count = 0;
	while (ros::ok())
	{
	    // 初始化geometry_msgs::Twist类型的消息
		geometry_msgs::Twist vel_msg;
		vel_msg.linear.x = 0.5;
		vel_msg.angular.z = 0.2;

	    // 发布消息
		turtle_vel_pub.publish(vel_msg);
		ROS_INFO("Publsh turtle velocity command[%0.2f m/s, %0.2f rad/s]", 
				vel_msg.linear.x, vel_msg.angular.z);

	    // 按照循环频率延时
	    loop_rate.sleep();
	}

	return 0;
}
```
