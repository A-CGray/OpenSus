# Tentative class structure for OpenSus

## Aims:
- To allow for model setup and analysis to be independent of suspension geometry type
- User should only have to define points and their connectivity in order to fully define a usable geometry

## Core Components
The bare minimum required to define a suspension geometry:
- Point
- Member/Link
- Corner
- Geometry

## Mechanical Components
Classes which represent some of the core mechanical suspension components, allow for more useful analysis of the suspension:
- Rocker
- Wheel
- Spring/Shock

## Kinematic components
Classes which define abstract kinematic objects, things like instant axes etc
- Plane
- Axis
- Point (does it need to be separate from point component?)
