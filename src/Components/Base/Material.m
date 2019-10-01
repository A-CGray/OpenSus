classdef Material
    %MATERIAL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        name
        desc
        E
        YS
    end
    
    methods
        function Mat = Material(varargin)
            %MATERIAL Construct an instance of the Material class

            %% Input parsing
            % We use the input parser to check the given inputs are in the
            % correct form, to allow the user to skip optional arguments
            % without having to pass in a [], and to assign default values
            % to missing inputs
            parser = inputParser;
            
            % Name is a required input and must be a char
            addOptional(parser, 'name', 'Steel', @(x) validateattributes(x,{'char'},{'scalartext'}))
            
            % desc is an optional argument and must be a char
            addOptional(parser, 'desc', '', @(x) validateattributes(x,{'char'},{}))
            
            % E is an optional argument and must be a scalar double
            addOptional(parser, 'E', 210e3, @(x) validateattributes(x,{'double'},{'scalar'}))
            
            % Y is an optional argument and must be a scalar double
            addOptional(parser, 'YS', 300, @(x) validateattributes(x,{'double'},{'scalar'}))
                        
            % Parse the input arguments
            parse(parser, varargin{:});
            
            %% Property assignment
            inps = parser.Results;
            Mat.name = inps.name;
            Mat.desc = inps.desc;
            Mat.E = inps.E;
            Mat.YS = inps.YS;
        end
    end
end

