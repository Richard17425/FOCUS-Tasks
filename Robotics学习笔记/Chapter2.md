## 第二章 位置与姿态描述
### 二维空间位姿描述
#### 矩阵运算规律
![矩阵运算规律](https://github.com/Richard17425/FOCUS-Tasks/blob/main/Robotics%E5%AD%A6%E4%B9%A0%E7%AC%94%E8%AE%B0/pictures/%E7%9F%A9%E9%98%B5%E8%BF%90%E7%AE%97%E8%A7%84%E5%BE%8B.png)
![](https://github.com/Richard17425/FOCUS-Tasks/blob/main/Robotics%E5%AD%A6%E4%B9%A0%E7%AC%94%E8%AE%B0/pictures/%E4%BD%8D%E5%A7%BF%E8%BF%90%E7%AE%97.png)

#### 坐标系变换方法
![坐标系变换方法](https://github.com/Richard17425/FOCUS-Tasks/blob/main/Robotics%E5%AD%A6%E4%B9%A0%E7%AC%94%E8%AE%B0/pictures/%E5%9D%90%E6%A0%87%E7%B3%BB1.png)
![坐标系变换方法Pro](https://github.com/Richard17425/FOCUS-Tasks/blob/main/Robotics%E5%AD%A6%E4%B9%A0%E7%AC%94%E8%AE%B0/pictures/%E5%9D%90%E6%A0%87%E7%B3%BB2.png)

用函数SE2创建一个齐次变换
`T1=SE2(1,2,30*pi/180)`

创建一个坐标系，标签是{1}，绘制成蓝色的
`axis([0 5 0 5]);
trplot2(T1, 'frame', '1', 'color', 'b')`

创建另一个坐标系
`T2=SE2(2, 1, 0)
hold on
trplot2(T2, 'frame', '2', 'color', 'r')`
