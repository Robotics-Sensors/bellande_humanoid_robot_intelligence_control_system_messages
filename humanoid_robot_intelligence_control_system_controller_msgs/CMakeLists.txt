# Copyright (C) 2024 Bellande Robotics Sensors Research Innovation Center, Ronaldson Bellande
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.

cmake_minimum_required(VERSION 3.8)
project(humanoid_robot_intelligence_control_system_controller_msgs)

if($ENV{ROS_VERSION} EQUAL 1)
  find_package(
    catkin REQUIRED COMPONENTS
    std_msgs
    sensor_msgs
    message_generation
  )

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

  catkin_package(
    CATKIN_DEPENDS
    std_msgs
    sensor_msgs
    message_runtime
  )

else()
  find_package(ament_cmake REQUIRED)
  find_package(std_msgs REQUIRED)
  find_package(sensor_msgs REQUIRED)
  find_package(rosidl_default_generators REQUIRED)

  rosidl_generate_interfaces(${PROJECT_NAME}
    "msg/SyncWriteItem.msg"
    "msg/JointCtrlModule.msg"
    "msg/StatusMsg.msg"
    "msg/WriteControlTable.msg"
    "srv/GetJointModule.srv"
    "srv/SetJointModule.srv"
    "srv/SetModule.srv"
    "srv/LoadOffset.srv"
    DEPENDENCIES std_msgs sensor_msgs
  )

  ament_export_dependencies(rosidl_default_runtime)

  ament_package()
endif()
