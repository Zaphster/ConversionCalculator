//
//  model.swift
//  ConversionCalculator
//
//  Created by Jared Bruemmer on 10/3/17.
//  Copyright © 2017 Cameron Barker. All rights reserved.
//

import Foundation

class Converter {
    var speedTracker:SpeedUnitTracker
    var volumeTracker:VolumeUnitTracker
    var massTracker:MassUnitTracker
    var lengthTracker:LengthUnitTracker
    var tempTracker:TemperatureUnitTracker
    var currentUnitType:unitType = .length
    var inputValue: String = ""
    var outputValue: Double = 0.0
    var input: Double {
        return Double(inputValue) ?? 0.0
    }
    
    init(){
        speedTracker = SpeedUnitTracker()
        volumeTracker = VolumeUnitTracker()
        massTracker = MassUnitTracker()
        lengthTracker = LengthUnitTracker()
        tempTracker = TemperatureUnitTracker()
    }
    
    enum unitType {
        case speed, volume, length, mass, temperature
    }
    
    enum speed {
        case milesPerHour, kilometersPerHour, feetPerSecond, metersPerSecond, knot
    }
    enum volume {
        case gallon, quart, pint, cup, ounce, tablespoon, teaspoon, cubicMeter, cubicFoot, cubicInch, liters, milliliters
    }
    enum length {
        case kilometer, meter, centimeter, millimeter, micrometer, nanometer,  mile, yard, feet, inch, nauticalMile
    }
    enum mass {
        case metricTon, kilogram, gram, milligram, microgram, ton, pound, ounce
    }
    enum temperature {
        case celsius, fahrenheit, kelvin
    }
    
    struct SpeedUnitTracker {
//        var inputType: unitType = .speed
        var specificInputUnit: speed = .milesPerHour
        var specificOutputUnit: speed = .kilometersPerHour
    }
    struct VolumeUnitTracker {
//        var inputType: unitType = .volume
        var specificInputUnit: volume = .quart
        var specificOutputUnit: volume = .gallon
    }
    struct LengthUnitTracker {
//        var inputType: unitType = .length
        var specificInputUnit: length = .feet
        var specificOutputUnit: length = .inch
    }
    struct MassUnitTracker {
//        var inputType: unitType = .mass
        var specificInputUnit: mass = .pound
        var specificOutputUnit: mass = .ounce
    }
    struct TemperatureUnitTracker {
//        var inputType: unitType = .temperature
        var specificInputUnit: temperature = .celsius
        var specificOutputUnit: temperature = .fahrenheit
    }
    
    
    
//Function time
    func clearInput() {
        self.inputValue = ""
    }
    func append(digit: Int) {
        self.inputValue += String(digit)
    }
    func appendDecimal() {
        guard !inputValue.contains(".") else {return}
        if inputValue.isEmpty {
            inputValue = "0."
        } else {
            self.inputValue += "."
        }
    }
    
    func setCurrentUnitType(`as` unit:unitType){
        currentUnitType = unit
    }
    
    func setInputUnits(speed:speed){
        guard currentUnitType == .speed else {return}
        speedTracker.specificInputUnit = speed
    }
    
    func setInputUnits(length:length){
        guard currentUnitType == .length else {return}
        lengthTracker.specificInputUnit = length
    }
    
    func setInputUnits(mass:mass){
        guard currentUnitType == .mass else {return}
        massTracker.specificInputUnit = mass
    }
    
    func setInputUnits(volume:volume){
        guard currentUnitType == .volume else {return}
        volumeTracker.specificInputUnit = volume
    }
    
    func setInputUnits(temperature:temperature){
        guard currentUnitType == .temperature else {return}
        tempTracker.specificInputUnit = temperature
    }
    func setOutputUnits(speed:speed){
        guard currentUnitType == .speed else {return}
        speedTracker.specificOutputUnit = speed
    }
    
    func setOutputUnits(length:length){
        guard currentUnitType == .length else {return}
        lengthTracker.specificOutputUnit = length
    }
    
    func setOutputUnits(mass:mass){
        guard currentUnitType == .mass else {return}
        massTracker.specificOutputUnit = mass
    }
    
    func setOutputUnits(volume:volume){
        guard currentUnitType == .volume else {return}
        volumeTracker.specificOutputUnit = volume
    }
    
    func setOutputUnits(temperature:temperature){
        guard currentUnitType == .temperature else {return}
        tempTracker.specificOutputUnit = temperature
    }

    struct Conversion {
        var inputUnits: String
        var outputUnits: String
        var operation: (Double, Double) -> Double
        
        init?(inputUnits: String, outputUnits: String, operation: @escaping (Double, Double) -> Double) {
            guard !inputUnits.isEmpty else {return nil}
            guard !outputUnits.isEmpty else {return nil}
            self.inputUnits = inputUnits
            self.outputUnits = outputUnits
            self.operation = operation
        }
    }






























}
