execute_process(COMMAND "/home/jasper123/workspace/ros_ws/build/rosbot_ros/src/navigation_testing/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/jasper123/workspace/ros_ws/build/rosbot_ros/src/navigation_testing/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
