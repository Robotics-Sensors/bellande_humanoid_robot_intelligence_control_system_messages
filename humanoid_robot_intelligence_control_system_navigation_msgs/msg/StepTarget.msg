# Target for a single stepping motion of a humanoid's leg

# step pose as relative offset to last leg
geometry_msgs/Pose2D pose

# which leg to use (left/right, see below)
uint8 leg 

# right leg constant
uint8 right=0

# left leg constant
uint8 left=1 
