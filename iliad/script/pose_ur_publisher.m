

jointTrajectory = rospublisher("/ur10e_eff_joint_traj_controller/command","trajectory_msgs/JointTrajectory");

pose_ur10e = rosmessage('trajectory_msgs/JointTrajectory');

pose_ur10e.JointNames = {'ur10e_shoulder_pan_joint','ur10e_shoulder_lift_joint','ur10e_elbow_joint'...
    'ur10e_wrist_1_joint','ur10e_wrist_2_joint','ur10e_wrist_3_joint'};

pose_ur10e.Points = rosmessage('trajectory_msgs/JointTrajectoryPoint');

pose_ur10e.Points.Positions = double([0; -1.5; 2.8;-1.3; 1.57; 3.14]);
pose_ur10e.Points.Velocities= double([0; 0; 0; 0; 0; 0]);
pose_ur10e.Points.Accelerations= double([0; 0; 0; 0; 0; 0]);
pose_ur10e.Points.Effort = double([0; 0; 0; 0; 0; 0]);
pose_ur10e.Points.TimeFromStart = rosduration(3,0);

sub = rossubscriber('/clock');
pose_ur10e.Header.Stamp = sub.LatestMessage.Clock_ + rosduration(1,0);

% send(jointTrajectory,pose_ur10e);
% display("1")
% pause(5)

pose_ur10e.Points.Positions = config8(:,5);
sub = rossubscriber('/clock');
pose_ur10e.Header.Stamp = sub.LatestMessage.Clock_ + rosduration(1,0);
send(jointTrajectory,pose_ur10e);
display("2")

pause(5)
pose_ur10e.Points.Positions = config8(:,5);
pose_ur10e.Points.Positions(1) = 1.57;
pose_ur10e.Points.Positions(5) = 1.57;
sub = rossubscriber('/clock');
pose_ur10e.Header.Stamp = sub.LatestMessage.Clock_ + rosduration(1,0);
pose_ur10e.Points.TimeFromStart = rosduration(5,0);
send(jointTrajectory,pose_ur10e);
display("3")