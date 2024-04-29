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
project(humanoid_robot_intelligence_control_system_navigation_msgs)

#List to make rest of code more readable
set(MESSAGE_DEPENDENCIES std_msgs geometry_msgs actionlib_msgs)


if($ENV{ROS_VERSION} EQUAL 1)
  find_package(
    catkin REQUIRED
    COMPONENTS
    message_generation
    ${MESSAGE_DEPENDENCIES}
  )
else()
  find_package(ament_cmake REQUIRED)
endif()


add_service_files(
  DIRECTORY srv
  FILES
  ClipFootstep.srv
  PlanFootsteps.srv
  PlanFootstepsBetweenFeet.srv
  StepTargetService.srv
)


add_message_files(
  DIRECTORY 
  msg 
  FILES 
  StepTarget.msg
  )


#Add action files
add_action_files(
  DIRECTORY action
  FILES
  ExecFootsteps.action
)

#And now generate the messages
generate_messages(DEPENDENCIES ${MESSAGE_DEPENDENCIES})


if($ENV{ROS_VERSION} EQUAL 1)
  catkin_package(
    CATKIN_DEPENDS 
    message_runtime 
    ${MESSAGE_DEPENDENCIES}
  )
endif()
