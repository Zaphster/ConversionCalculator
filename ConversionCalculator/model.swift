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
    var mphToKph:SpeedConversion
    var kphToMph:SpeedConversion
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
        mphToKph = SpeedConversion(inputUnits: .milesPerHour, outputUnits: .kilometersPerHour) { (input) -> Double in
            return input * 1.60934
        }
        kphToMph = SpeedConversion(inputUnits: .kilometersPerHour, outputUnits: .milesPerHour, operation: { (input) -> Double in
            return input / 1.60934
        })
    }
    
    enum unitType {
        case speed, volume, length, mass, temperature
    }
    
    enum speed {
        case feetPerSecond, metersPerSecond, kilometersPerHour, milesPerHour
        static var list:[speed] = [speed.feetPerSecond, speed.metersPerSecond, speed.kilometersPerHour, speed.milesPerHour]
    }
    enum volume {
        case cubicInch, cubicFoot, cubicMeter, milliliters, liters, gallon, quart, pint, cup, ounce, tablespoon, teaspoon
        static var list:[volume] = [volume.cubicInch, volume.cubicFoot, volume.cubicMeter, volume.milliliters, volume.liters, volume.gallon, volume.quart, volume.pint, volume.cup, volume.ounce, volume.tablespoon, volume.teaspoon]
    }
    enum length {
        case inch, feet, yard, mile, kilometer, meter, centimeter, millimeter, micrometer, nanometer
        static var list:[length] = [length.inch, length.feet, length.yard, length.mile, length.kilometer, length.meter, length.centimeter, length.millimeter, length.micrometer, length.nanometer]
    }
    enum mass {
        case  ounce, pound, ton, metricTon, kilogram, gram, milligram, microgram
        static var list:[mass] = [mass.ounce, mass.pound, mass.ton, mass.metricTon, mass.kilogram, mass.gram, mass.milligram, mass.microgram]
    }
    enum temperature {
        case fahrenheit, celsius, kelvin
        static var list:[temperature] = [temperature.fahrenheit, temperature.celsius, temperature.kelvin]
    }
    
    struct SpeedUnitTracker {
        var specificInputUnit: speed = .milesPerHour
        var specificOutputUnit: speed = .kilometersPerHour
    }
    struct VolumeUnitTracker {
        var specificInputUnit: volume = .quart
        var specificOutputUnit: volume = .gallon
    }
    struct LengthUnitTracker {
        var specificInputUnit: length = .feet
        var specificOutputUnit: length = .inch
    }
    struct MassUnitTracker {
        var specificInputUnit: mass = .pound
        var specificOutputUnit: mass = .ounce
    }
    struct TemperatureUnitTracker {
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
    
    func convert(){
        switch(currentUnitType){
        case .length:
            lengthTracker.specificInputUnit
            lengthTracker.specificOutputUnit
        case .mass:
        case .temperature:
            var firstFound:temperature?
            var lastFound:temperature?
            for enumVal:temperature in temperature.list{
                if(firstFound == nil){
                    //find first value
                    //no converting yet
                } else {
                    //do conversion!
                }
                if(enumVal == tempTracker.specificInputUnit || enumVal == tempTracker.specificOutputUnit){
                    
                }
            }
        case .speed:
        case .volume:
        }
    }

    struct SpeedConversion {
        var inputUnits: speed
        var outputUnits: speed
        var operation: (Double) -> Double
        
        init(inputUnits: speed, outputUnits: speed, operation: @escaping (Double) -> Double) {
            self.inputUnits = inputUnits
            self.outputUnits = outputUnits
            self.operation = operation
        }
    }




























}
