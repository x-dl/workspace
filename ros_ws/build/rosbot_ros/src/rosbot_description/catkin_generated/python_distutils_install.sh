#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/jasper123/workspace/ros_ws/src/rosbot_ros/src/rosbot_description"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/jasper123/workspace/ros_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/jasper123/workspace/ros_ws/install/lib/python3/dist-packages:/home/jasper123/workspace/ros_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/jasper123/workspace/ros_ws/build" \
    "/usr/bin/python3" \
    "/home/jasper123/workspace/ros_ws/src/rosbot_ros/src/rosbot_description/setup.py" \
     \
    build --build-base "/home/jasper123/workspace/ros_ws/build/rosbot_ros/src/rosbot_description" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/jasper123/workspace/ros_ws/install" --install-scripts="/home/jasper123/workspace/ros_ws/install/bin"
