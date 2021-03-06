## 第二章 位置与姿态描述
### 二维空间位姿描述
#### 矩阵运算规律

![矩阵运算规律](./pictures/%E7%9F%A9%E9%98%B5%E8%BF%90%E7%AE%97%E8%A7%84%E5%BE%8B.png)
![](./pictures/%E4%BD%8D%E5%A7%BF%E8%BF%90%E7%AE%97.png)

#### 坐标系变换方法

![坐标系变换方法](./pictures/%E5%9D%90%E6%A0%87%E7%B3%BB1.png)
![坐标系变换方法Pro](./pictures/%E5%9D%90%E6%A0%87%E7%B3%BB2.png)


**用函数SE2创建一个齐次变换**

`T1=SE2(1,2,30*pi/180)`

**它代表(1,2)的平移和30°的旋转。相对于世界坐标系，我们可以将该变换用绘图函数绘制如下：**

`axis([0 5 0 5]);`
`trplot2(T1, 'frame', '1', 'color', 'b')`

该坐标系标签是{1}，绘制成蓝色的

**我们再创建另一个平移(2,1)，零旋转的相对位姿：**

`T2=SE2(2, 1, 0)`
`hold on`
`trplot2(T2, 'frame', '2', 'color', 'r')`

**将两个相对位姿复合：**
`T3=T1*T2`

**在图中用绿色（图中Y3 \31 X3 坐标系）绘制出来：**

`trplot2(T3, 'frame', '3', 'color', 'g')`

在复合中，坐标系 {2} 的平移(2, 1)是相对于坐标系{1}的。 要注意的是，最终坐标系{3}相对于世界坐标系的平移量并不是(3, 3)，
因为它是相对于旋转后的坐标系 {l} 再平移的。

**复合运算的不可交换性可用以下例子证明：**
`T4=T2*T1`

![Axis_transformation](./pictures/Axis%20transformation.png)
可以看出，坐标系{4}与坐标系{3}不同。
