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
project(humanoid_robot_intelligence_control_system_action_module_msgs)


if($ENV{ROS_VERSION} EQUAL 1)
  find_package(
    catkin REQUIRED COMPONENTS
    std_msgs
    message_generation
  )
else()
  find_package(ament_cmake REQUIRED)
endif()


add_message_files(
  FILES
  StartAction.msg
)

add_service_files(
  FILES
  IsRunning.srv
)

generate_messages(
  DEPENDENCIES
  std_msgs
)


if($ENV{ROS_VERSION} EQUAL 1)
  catkin_package(
    CATKIN_DEPENDS
    std_msgs
    message_runtime
  )
endif()
