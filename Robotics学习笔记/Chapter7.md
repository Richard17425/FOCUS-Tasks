## 第七章 机器人运动学

### 7.1 描述一台机械臂

### 7.2 正运动学

创建一个名为_p560_的SerialLink对象

'''
mdl_puma560
'''

绘图

`p560.plot(qz)`

![puma590](pictures/Puma560p1.png)

![puma](https://github.com/Richard17425/FOCUS-Tasks/blob/main/Robotics%E5%AD%A6%E4%B9%A0%E7%AC%94%E8%AE%B0/pictures/Puma560p1.png)

![1] (../assets/pictures/Puma560p1.png)

![2] (../main/Robotics%E5%AD%A6%E4%B9%A0%E7%AC%94%E8%AE%B0/pictures/Puma560p1.png)

位姿转换

`p560.base=transl(0,0,3)*trotx(pi)
p560.fkine(qz)`

### 7.3 逆运动学
