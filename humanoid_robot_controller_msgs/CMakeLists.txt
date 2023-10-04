cmake_minimum_required(VERSION 3.8)
project(humanoid_robot_controller_msgs)


if($ENV{ROS_VERSION} EQUAL 1)
  find_package(
    catkin REQUIRED COMPONENTS
    std_msgs
    sensor_msgs
    message_generation
  )
else()
  find_package(ament_cmake REQUIRED)
endif()


add_message_files(
  FILES
  SyncWriteItem.msg
  JointCtrlModule.msg
  StatusMsg.msg
  WriteControlTable.msg
)

add_service_files(
  FILES
  GetJointModule.srv
  SetJointModule.srv
  SetModule.srv
  LoadOffset.srv
)

generate_messages(
  DEPENDENCIES
  std_msgs
  sensor_msgs
)

if($ENV{ROS_VERSION} EQUAL 1)
  catkin_package(
    CATKIN_DEPENDS
    std_msgs
    sensor_msgs
    message_runtime
  )
else()
  ament_package()
endif()
