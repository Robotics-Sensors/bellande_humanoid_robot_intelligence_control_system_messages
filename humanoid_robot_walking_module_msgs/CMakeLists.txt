cmake_minimum_required(VERSION 3.8)
project(humanoid_robot_walking_module_msgs)


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
  WalkingParam.msg
)

add_service_files(
  FILES
  GetWalkingParam.srv
  SetWalkingParam.srv
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
else()
  ament_package()
endif()
