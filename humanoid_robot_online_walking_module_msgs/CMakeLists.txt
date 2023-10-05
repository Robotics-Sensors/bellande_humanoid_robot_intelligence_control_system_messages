cmake_minimum_required(VERSION 3.8)
project(humanoid_robot_online_walking_module_msgs)


if($ENV{ROS_VERSION} EQUAL 1)
  find_package(
    catkin REQUIRED COMPONENTS
    std_msgs
    sensor_msgs
    geometry_msgs
    message_generation
  )
else()
  find_package(ament_cmake REQUIRED)
endif()


add_message_files(
  FILES
  JointPose.msg
  KinematicsPose.msg
  FootStepCommand.msg
  FootStepArray.msg
  PreviewRequest.msg
  PreviewResponse.msg
  WalkingParam.msg
  Step2D.msg
  Step2DArray.msg
)

add_service_files(
  FILES
  GetJointPose.srv
  GetKinematicsPose.srv
  GetPreviewMatrix.srv
)

generate_messages(
  DEPENDENCIES
  std_msgs
  sensor_msgs
  geometry_msgs
)

if($ENV{ROS_VERSION} EQUAL 1)
  catkin_package(
    CATKIN_DEPENDS
    std_msgs
    sensor_msgs
    geometry_msgs
    message_runtime
  )
endif()
