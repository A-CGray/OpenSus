function mirroredCorner = mirrorCorner(corner)
    % First define the mirror transformation, this is simply flipping the Y coordinate
    transform = createScaling3d(1, -1, 1);
    
    % Mirror the points
    mirroredCorner.points = structfun(@(x)transformPoint3d(x,transform),corner.points,'UniformOutput',false);
    
    % Build the mirrored corner
    mirroredCorner = buildCorner(mirroredCorner);
end