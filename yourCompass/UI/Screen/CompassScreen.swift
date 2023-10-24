//
//  ContentView.swift
//  yourCompass
//
//  Created by Roy Espen Olsen on 23/10/2023.
//

import SwiftUI

struct CompassView: View {
    
    @ObservedObject var compassHeading = CompassHeading()
    
    var body: some View {
        let angle = compassHeading.degrees
        let direction = calculateDirection(angle: angle)

        VStack {
            Text("Compass Degree")
            Text("\(Int(angle))° \(direction)")
                .font(.headline)
        }
    }
    
    func calculateDirection(angle: Double) -> String {
        let direction = ["N", "NE", "E", "SE", "S", "SW", "W", "NW"]
        
        var normalizedAngle = (angle.truncatingRemainder(dividingBy: 360) + 360).truncatingRemainder(dividingBy: 360)
        
        if normalizedAngle >= 337.5 {
            normalizedAngle = 0
        }
        
        let index = Int((normalizedAngle + 22.5) / 45) % 8
        
        return direction[index]
    }
}

#Preview {
    CompassView()
}
