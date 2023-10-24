//
//  calculateCompassDirection.swift
//  yourCompass
//
//  Created by Roy Espen Olsen on 23/10/2023.
//

import Foundation

func calculateCompassDirection(x: Double, y: Double, z: Double) -> (direction: String, angle: Double) {
    // Calculate magnetic field strength
    let magneticFieldStrength = sqrt(x * x + y * y + z * z)
    
    // Calculate the angle in radians with the correct order of arguments
    let angle = atan2(y, x)
    
    // Convert radians to degrees
    var angleInDegrees = angle * 180 / .pi
    
    // Ensure the angle is between 0 and 360 degrees
    if angleInDegrees < 0 {
        angleInDegrees += 360
    }
    
    // Define compass directions and map the angle to them
    let compassDirections = ["N", "NE", "E", "SE", "S", "SW", "W", "NW"]
    let directionIndex = Int((angleInDegrees + 22.5) / 45) % 8
    let compassDirection = compassDirections[directionIndex]
    
    return (compassDirection, angleInDegrees)
}

