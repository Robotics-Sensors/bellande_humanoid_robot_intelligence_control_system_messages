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
project(humanoid_robot_intelligence_control_system_offset_tuner_msgs)

if($ENV{ROS_VERSION} EQUAL 1)
  find_package(
    catkin REQUIRED COMPONENTS
    std_msgs
    message_generation
  )

  add_message_files(
    FILES
    JointOffsetData.msg
    JointOffsetPositionData.msg
    JointTorqueOnOff.msg
    JointTorqueOnOffArray.msg
  )

  add_service_files(
    FILES
    GetPresentJointOffsetData.srv
  )

  generate_messages(
    DEPENDENCIES
    std_msgs
  )

  catkin_package(
    CATKIN_DEPENDS
    std_msgs
    message_runtime
  )

else()
  find_package(ament_cmake REQUIRED)
  find_package(std_msgs REQUIRED)
  find_package(rosidl_default_generators REQUIRED)

  rosidl_generate_interfaces(${PROJECT_NAME}
    "msg/JointOffsetData.msg"
    "msg/JointOffsetPositionData.msg"
    "msg/JointTorqueOnOff.msg"
    "msg/JointTorqueOnOffArray.msg"
    "srv/GetPresentJointOffsetData.srv"
    DEPENDENCIES std_msgs
  )

  ament_export_dependencies(rosidl_default_runtime)

  ament_package()
endif()
