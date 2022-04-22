  **Nodes:** 节点,一个节点即为一个可执行文件，它可以通过ROS与其它节点进行通信。  
    一个节点其实只不过是ROS程序包中的一个可执行文件（相当于windows里的exe）。ROS节点可以使用ROS客户库与其他节点通信。节点可以发布或接收一个话题。节点也可以提供或使用某种服务。
    
  **Master:**  节点管理器，ROS名称服务 (比如帮助节点找到彼此)。
   - 为节点提供命名和注册服务
   - 跟踪和记录话题/服务通信，辅助节点相互查找/建立连接
   - 提供参数服务器，节点使用此服务器存储和检索运行时的参数 
    
###  **Topics:** 话题--异步通讯机制
   - 节点间通讯的一个总线
   - 节点可以**发布**（Publish）消息到话题，也可以**订阅**（Subscribe）话题以接收消息。
   - 单向数据传输
   -  适用于数据传输
 ![图片](https://user-images.githubusercontent.com/87596371/164627821-20d05f54-5808-43f8-a1f7-36d9376b9db9.png)

       **Messages:** 消息，消息是一种ROS数据类型，用于订阅或发布到一个话题
       *使用编程语言无关的.mse文件定义,编译过程中生成对应代码文件
        
  ###  **Service:**  服务--同步通讯机制
   
   - 使用客户端/服务器（C/S）模型，客户端发送**请求**（request）数据，服务器完成处理后返回**应答**（response）数据
   - 适用于逻辑处理
   - 使用.srv文件定义请求和应答数据结构
   
![图片](https://user-images.githubusercontent.com/87596371/164627964-5500cda1-d7e2-4451-b1c6-754b704aebb9.png)

![图片](https://user-images.githubusercontent.com/87596371/164628114-a1f2e3f7-5496-4349-af19-60225d6b2f43.png)
  
  
   **rosout:** ROS中相当于stdout/stderr。
   
   **roscore:**    主机+ rosout + 参数服务器 。
   
 ### 文件系统

![图片](https://user-images.githubusercontent.com/87596371/164628222-9b5d72bf-b1ad-4f1d-98b2-9902d28e6172.png)
