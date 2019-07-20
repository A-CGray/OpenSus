function corner = buildCorner(corner)
    % This function takes in a suspension corner corneretry structure
    % containing pickup point coordinates and constructs all the relevant
    % members axes and planes
    
   %% Define the suspension members
   corner.members.UF = buildMember(corner.points.UB,corner.points.UIF); % UpperFront
   corner.members.UR = buildMember(corner.points.UB,corner.points.UIR); % UpperRear
   corner.members.LF = buildMember(corner.points.LB,corner.points.LIF); % LowerFront
   corner.members.LR = buildMember(corner.points.LB,corner.points.LIR); % LowerRear
   corner.members.TR = buildMember(corner.points.OT,corner.points.IT); % TieRod
   corner.members.PR = buildMember(corner.points.OS,corner.points.IS); % Push/PullRod
   
   %% Define planes
   corner.planes.UW = createPlane(corner.points.UIR, corner.points.UIF, corner.points.UB);
   corner.planes.LW = createPlane(corner.points.LIR, corner.points.LIF, corner.points.LB);
   corner.planes.FV = createPlane(corner.points.CP, [1,0,0]);
   corner.planes.SV = createPlane(corner.points.CP, [0,1,0]);
   corner.planes.WP = createPlane(corner.points.CP, corner.points.WC, corner.points.WF);
   
   %% Define some kinematics related corneretric objects
   corner.axes.instantAxis = intersectPlanes(corner.planes.UW,corner.planes.LW);
   corner.axes.KP = createLine3d(corner.points.UB,corner.points.LB);
   corner.points.FVIC = intersectLinePlane(corner.axes.instantAxis,corner.planes.FV);
   corner.axes.wheelVertical = createLine3d(corner.points.WC,corner.points.CP);
   corner.axes.wheelHorizontal = createLine3d(corner.points.WF,corner.points.WC);
   corner.axes.wheelAxis = createLine3d(corner.points.WC,corner.points.WC+planeNormal(corner.planes.WP));
   corner.points.SVIC = intersectLinePlane(corner.axes.instantAxis,corner.planes.SV);

end