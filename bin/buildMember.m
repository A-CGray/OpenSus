function member = buildMember(P1,P2,varargin)
    % Member has properties
    % name: Name of the member (e.g Pushrod)
    % P1: first point (Outboard point by definition)
    % P2: second point (Iboard point by definition)
    % L: Length
    % dir: Direction unit vector
    % D: Diameter of the member, can be used if you want to make realistic
    % visualisations
    % edge: geom3d edge representation of the member
    %
    % for sake of force calculations, specify P1 as the ourboard point,
    % that way positive member forces correspond to tension
    
    member.P1 = P1;
    member.P2 = P2;
    member.L = norm(P1-P2);
    member.dir = (P2-P1)/member.L;
    
    if nargin>2
        member.D = varargin{1};
    end
    
    member.edge = createEdge3d(member.P1,member.P2);
end