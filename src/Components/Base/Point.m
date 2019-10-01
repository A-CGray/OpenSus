classdef Point
    % Point The base class defining a point in the suspension geometry
    % Detailed explanation goes here
    %
    % Point Properties:
    %   name - Name of the point    
    %   desc - A description of what the point represents    
    %   coord - The [x, y, z] coordinate vector of the point     
    %   x - The point's x coordinate
    %   y - The point's y coordinate
    %   z - The point's z coordinate
    %   visible - Whether this point should be shown when visualising the geometry
    %   colour - The color of the point when it is displayed in a plot
    %   size - The radius of the sphere used to display the point in a plot
    %
    % Point Methods:
    %   method1 - Does a thing
    
    
    properties
        name
        desc
        coord
        visible
        colour
        size
    end
    properties (Dependent)
        x
        y
        z
    end
    
    methods
        function P = Point(name, coord, varargin)
            %POINT Construct an instance of this class
            
            
            %% Input parsing
            % We use the input parser to check the given inputs are in the
            % correct form, to allow the user to skip optional arguments
            % without having to pass in a [], and to assign default values
            % to missing inputs
            parser = inputParser;
            
            % Name is a required input and must be a char
            addRequired(parser, 'name', @(x) validateattributes(x,{'char'},{'scalartext'}))
            
            % coord is a required input and must be a 3x1 double
            addRequired(parser, 'coord', @(x) validateattributes(x,{'double'},{'size',[1,3]}))
            
            % desc is an optional argument and must be a char
            addOptional(parser, 'desc', '', @(x) validateattributes(x,{'char'},{}))
            
            % visible is an optional argument and must be a scalar logical
            addOptional(parser, 'visible', true, @(x) validateattributes(x,{'logical'},{'scalar'}))
            
            % colour is an optional argument and must be a char
            addOptional(parser, 'colour', 'r', @(x) validateattributes(x,{'char'},{}))
            
            % size is an optional argument and must be a scalar double
            addOptional(parser, 'size', 10, @(x) validateattributes(x,{'double'},{'scalar'}))
            
            % Parse the input arguments
            parse(parser, name, coord, varargin{:});
            
            %% Property assignment
            inps = parser.Results;
            P.name = inps.name;
            P.coord = inps.coord;
            P.desc = inps.desc;
            P.visible = inps.visible;
            P.size = inps.size;
            P.colour = inps.colour;
        end
        %% Plot function
        function plot(P)
            %plot Plot the point as a sphere with the size and color
            %defined by its properties
            if P.visible
                drawSphere(P.coord, P.size, 'facecolor', P.colour)
            end
        end
        
        %% Minus function
        function vec = minus(P1, P2)
            %minus Subtracting two Point objects simply subtracts their
            %coordinate vectors
            vec = P1.coord - P2.coord;
        end
        
        %% Get methods for dependent properties x, y and z
        function X = get.x(P)
            X = P.coord(1);
        end
        
        function Y = get.y(P)
            Y = P.coord(2);
        end
        
        function Z = get.z(P)
            Z = P.coord(3);
        end
    end
end