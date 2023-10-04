cmake_minimum_required(VERSION 3.8)
project(humanoid_nav_msgs)

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


if($ENV{ROS_VERSION} EQUAL 1)
  add_service_files(
    DIRECTORY srv
    FILES
    ClipFootstep.srv
    PlanFootsteps.srv
    PlanFootstepsBetweenFeet.srv
    StepTargetService.srv
  )
else()
  ament_package()
endif()


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

# Generate catkin/pkg-config import information
catkin_package(CATKIN_DEPENDS message_runtime ${MESSAGE_DEPENDENCIES})
