//
//  MotionManager.swift
//  yourCompass
//
//  Created by Roy Espen Olsen on 23/10/2023.
//

import Foundation
import Combine
import CoreMotion

class MotionManager: ObservableObject {
    private var motionManager: CMMotionManager
    
    @Published
    var x: Double = 0.0
    @Published
    var y: Double = 0.0
    @Published
    var z: Double = 0.0
    
    @Published
    var pitch: Double = 0.0
    @Published
    var yaw: Double = 0.0
    @Published
    var roll: Double = 0.0
    
    init() {
        motionManager = CMMotionManager()
        
        // MAGNETOMETER
        motionManager.magnetometerUpdateInterval = 1/60
        motionManager.startMagnetometerUpdates(to: .main) { (magnetometerData, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            if let magnetData = magnetometerData {
                self.x = magnetData.magneticField.x
                self.y = magnetData.magneticField.y
                self.z = magnetData.magneticField.z
            }
        }
        
        // ACCELEROMETER
        motionManager.accelerometerUpdateInterval = 1/60
        motionManager.startAccelerometerUpdates(to: .main) { (accelerometerData, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            if let acceleroData = accelerometerData {
                self.pitch = acceleroData.acceleration.x
                self.yaw = acceleroData.acceleration.y
                self.roll = acceleroData.acceleration.z
            }
        }
    }
}
