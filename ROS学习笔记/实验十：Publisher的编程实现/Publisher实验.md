

该例程将发布turtle1/cmd_vel话题（topic），消息类型geometry_msgs::Twist   *用来控制海龟完成速度指令的运动

## 一. 实现一个发布者
 
```
#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
```
Twist是ROS自带的线速度和角速度关系的头文件

### 1 初始化ROS节点
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

### 2 向ROS Master注册节点信息
包括发布的话题名和话题中的消息类型
```
	// 创建一个Publisher，发布名为/turtle1/cmd_vel的topic，消息类型为geometry_msgs::Twist，队列长度10
	ros::Publisher turtle_vel_pub = n.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 10);
```
< >中为发布的消息类型(geometry_msgs::Twist)
( )中的初始化内容
- /turtle1/cmd_vel 是发布的话题名
- 10 是队列长度，先把数据存放在队列中，再来根据实际的发送能力来不断发布

### 3 创建消息数据

### 4 按照一定频率循环发布消息

```
	// 设置循环的频率
	ros::Rate loop_rate(10);         //10Hz

	int count = 0;
	while (ros::ok())
	{
	    // 初始化geometry_msgs::Twist类型的消息
		geometry_msgs::Twist vel_msg;   //创建类的对象
		vel_msg.linear.x = 0.5;       			//线速度  m/s
		vel_msg.angular.z = 0.2;      		    //角速度   rad/s

	    // 发布消息
		turtle_vel_pub.publish(vel_msg);                  //之前创建的Publisher
		ROS_INFO("Publsh turtle velocity command[%0.2f m/s, %0.2f rad/s]",          //ROS_INFO相当于C中的printf，使客户端上可以显示
				vel_msg.linear.x, vel_msg.angular.z);

	    // 按照循环频率延时
	    loop_rate.sleep();
	}

	return 0;
}
```

## 二. 配置发布者代码编辑规则

在创建的程序包的CMakeLists.txt中添加编译规则

![图片](https://user-images.githubusercontent.com/87596371/164760267-1cd75e96-9e8a-4a74-aa61-e5eb977eea59.png)


在Bulid标题下

```
###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
# include
  ${catkin_INCLUDE_DIRS}
)

## Declare a C++ library
# add_library(${PROJECT_NAME}
#   src/${PROJECT_NAME}/learning_topic.cpp
# )

## Add cmake target dependencies of the library
## as an example, code may need to be generated before libraries
## either from message generation or dynamic reconfigure
# add_dependencies(${PROJECT_NAME} ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

## Declare a C++ executable
## With catkin_make all packages are built within a single CMake context
## The recommended prefix ensures that target names across packages don't collide
# add_executable(${PROJECT_NAME}_node src/learning_topic_node.cpp)                  //描述要把哪一个程序文件编译成可执行文件

## Rename C++ executable without prefix
## The above recommended prefix causes long target names, the following renames the
## target back to the shorter version for ease of user use
## e.g. "rosrun someones_pkg node" instead of "rosrun someones_pkg someones_pkg_node"
# set_target_properties(${PROJECT_NAME}_node PROPERTIES OUTPUT_NAME node PREFIX "")

## Add cmake target dependencies of the executable
## same as for the library above
# add_dependencies(${PROJECT_NAME}_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

## Specify libraries to link a library or executable target against
# target_link_libraries(${PROJECT_NAME}_node                               //把可执行文件跟ROS相关的库（C++）做链接
#   ${catkin_LIBRARIES}
# )

add_executable(velocity_publisher src/velocity_publisher.cpp)
target_link_libraries(velocity_publisher ${catkin_LIBRARIES})
```
**加入的语句为：**
```
add_executable(velocity_publisher src/velocity_publisher.cpp)
target_link_libraries(velocity_publisher ${catkin_LIBRARIES})
```


## 三. 编译并运行发布者

1. 在工作空间的目录下：
`cd ~/catkin_ws`

2. 通过`catkin_make` 来进行编译

![图片](https://user-images.githubusercontent.com/87596371/164757294-8ebde7b9-b8e3-4f25-9d6f-d399c1353b94.png)

3. 设置环境变量

`source devel/setup.bash`  
预先在.bashrc中添加好了则不用每次都设置了

4. 运行海龟仿真和功能包程序

`roscore
rosrun turtlesim turtlesim_node
rosrun learning_topic velocity_publisher`
