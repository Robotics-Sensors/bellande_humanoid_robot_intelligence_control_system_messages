# 2D StepData

# step pose as relative offset to last leg
geometry_msgs/Pose2D step2d   

# which leg to be used (left/right/no, see below)
uint8 moving_foot   

# Left foot constant
uint8 LEFT_FOOT_SWING  = 1

# Right foot constant
uint8 RIGHT_FOOT_SWING = 2

# Standing constant
uint8 STANDING         = 3 
