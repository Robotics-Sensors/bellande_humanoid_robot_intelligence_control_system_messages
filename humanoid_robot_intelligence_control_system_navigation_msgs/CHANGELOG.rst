^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Changelog for package humanoid_robot_intelligence_control_system_navigation_msgs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

0.3.2 (2023-10-03)
------------------
* Make it compatible for ROS1/ROS2
* Fix bugs
* Update package.xml and CMakeList.txt for to the latest versions
* Contributors & Maintainer: Ronaldson Bellande

0.3.1 (2023-09-27)
------------------
* Starting from this point it under a new license
* Fix errors and Issues
* Rename Repository for a completely different purpose
* Make it compatible with ROS/ROS2
* Upgrade version of all builds and make it more compatible
* Update package.xml and CMakeList.txt for to the latest versions
* Contributors & Maintainer: Ronaldson Bellande

0.3.1.5 (2022-05-06)
------------------
* Update package.xml and CMakeList.txt for noetic branch
* Ronaldson Bellande

0.3.0 (2014-01-16)
------------------
* Add service to (re)plan between feet as start and goal.
* Contributors: Armin Hornung

0.2.0 (2013-10-25)
------------------
* Initial catkinization

0.1.2 (2013-01-10)
------------------
* spelling mistake corrected
* added more details to PlanFootsteps srv result
* action ExecFootsteps can now feedback changeable_footsteps and robot_pose (see naoqi docu for further info)
* integrated a new action to communicate with the action server provided by nao_footsteps.py in the nao_driver package
* service to clip footsteps
* moved humanoid_robot_intelligence_control_system_navigation_msgs into new humanoid_robot_intelligence_control_system_msgs stack
