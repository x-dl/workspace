cmake_minimum_required(VERSION 2.8.3)
project(tutorial_pkg)

add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  sensor_msgs
)

catkin_package(
  CATKIN_DEPENDS
)

include_directories(${catkin_INCLUDE_DIRS})

add_executable(my_first_node src/test.cpp)

target_link_libraries(my_first_node
  ${catkin_LIBRARIES}
)
