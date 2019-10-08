classdef Member
    % Member The base class defining a Member in the suspension geometry
    % Detailed explanation goes here
    %
    % Member Properties:
    %   name - Name of the Member    
    %   desc - A description of what the Member represents    
    %   P1 - First point defining the member    
    %   P2 - Second point defining the member   
    %   visible - Whether this Member should be shown when visualising the geometry
    %   colour - The color of the Member when it is displayed in a plot
    %   OD - Outer Diameter of the member
    %   ID - Inner Diameter of the member
    %   material - The material the member is made of, defined by a Material object
    %
    % Member Methods:
    %   method1 - Does a thing
    
    
    properties
        name
        desc
        P1
        P2
        visible
        colour
        OD
        ID
        material
    end
    properties (Dependent)
        length
        unitVector
        edge
        A
        I
    end
    
    methods
        function M = Member(P1, P2, varargin)
            %Member Construct an instance of the Member class
            
            %% Input parsing
            % We use the input parser to check the given inputs are in the
            % correct form, to allow the user to skip optional arguments
            % without having to pass in a [], and to assign default values
            % to missing inputs
            parser = inputParser;
                                  
            % P1 is a required input and must be a Point object
            addRequired(parser, 'P1', @(x) validateattributes(x,{'Point'},{}))
            
            % P2 is a required input and must be a Point object
            addRequired(parser, 'P2', @(x) validateattributes(x,{'Point'},{}))
            
            % Name is an optional input and must be a char
            addParameter(parser, 'name', [P1.name,'-',P2.name], @(x) validateattributes(x,{'char'},{'scalartext'}))
            
            % desc is an optional argument and must be a char
            addParameter(parser, 'desc', '', @(x) validateattributes(x,{'char'},{}))
            
            % visible is an optional argument and must be a scalar logical
            addParameter(parser, 'visible', true, @(x) validateattributes(x,{'logical'},{'scalar'}))
            
            % colour is an optional argument and must be a char
            addParameter(parser, 'colour', 'g', @(x) validateattributes(x,{'char'},{}))
            
            % OD is an optional argument and must be a scalar double
            addParameter(parser, 'OD', 18, @(x) validateattributes(x,{'double'},{'scalar'}))
            
            % ID is an optional argument and must be a scalar double
            addParameter(parser, 'ID', 10, @(x) validateattributes(x,{'double'},{'scalar'}))
            
            % ID is an optional argument and must be a scalar double
            addParameter(parser, 'material', Material(), @(x) validateattributes(x,{'Material'}))
            
            % Parse the input arguments
            parse(parser, P1, P2, varargin{:});
            
            %% Property assignment
            inps = parser.Results;
            M.name = inps.name;
            M.P1 = inps.P1;
            M.P2 = inps.P2;
            M.desc = inps.desc;
            M.visible = inps.visible;
            M.OD = inps.OD;
            M.ID = inps.ID;
            M.colour = inps.colour;
            M.material = inps.material;
        end
        
        %% Plot function
        function plot(M)
            %plot Plot the Member as a sphere with the size and color
            %defined by its properties
            if M.visible
                drawCylinder([M.P1.coord, M.P2.coord, M.OD/2], 'facecolor', M.colour)
            end
        end
        
        %% Get methods for dependent properties 
        function L = get.length(M)
            L = norm(M.P2-M.P1);
        end
        
        function V = get.unitVector(M)
            V = (M.P2-M.P1)./norm(M.P2-M.P1);
        end
        
        function E = get.edge(M)
            E = createEdge3d(M.P1, M.P2);
        end
        
        function A = get.A(M)
            A = 1/4*pi*(M.OD^2 - M.ID^2);
        end
        
        function I = get.I(M)
            I = 1/64*pi*(M.OD^4 - M.ID^4);
        end
    end
end