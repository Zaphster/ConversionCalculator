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
//    var mphToKph:SpeedConversion
//    var kphToMph:SpeedConversion
    var currentUnitType:UnitType = .speed
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
//        mphToKph = SpeedConversion(inputUnits: .milesPerHour, outputUnits: .kilometersPerHour) { (input) -> Double in
//            return input * 1.60934
//        }
//        kphToMph = SpeedConversion(inputUnits: .kilometersPerHour, outputUnits: .milesPerHour, operation: { (input) -> Double in
//            return input / 1.60934
//        })
    }
    
    enum UnitType {
        case speed, volume, length, mass, temperature
    }
    
    enum Speed {
        case feetPerSecond, metersPerSecond, kilometersPerHour, milesPerHour
        //static var list:[speed] = [speed.feetPerSecond, speed.metersPerSecond, speed.kilometersPerHour, speed.milesPerHour]
        
        func convertTo(_ outputUnit:Speed, with input:Double) -> Double{
            switch(self){
            case .feetPerSecond:
                switch(outputUnit){
                case .feetPerSecond:
                    return input
                case .kilometersPerHour:
                    return input * 1.09728
                case .metersPerSecond:
                    return input * 0.3048
                case .milesPerHour:
                    return input * 0.681818
                }
            case .metersPerSecond:
                switch(outputUnit){
                case .feetPerSecond:
                    return input * 3.28084
                case .kilometersPerHour:
                    return input * 3.6
                case .metersPerSecond:
                    return input
                case .milesPerHour:
                    return input * 2.23694
                }
            case .kilometersPerHour:
                switch(outputUnit){
                case .feetPerSecond:
                    return input * 0.911344
                case .kilometersPerHour:
                    return input
                case .metersPerSecond:
                    return input * 0.277778
                case .milesPerHour:
                    return input * 0.621371
                }
            case .milesPerHour:
                switch(outputUnit){
                case .feetPerSecond:
                    return input * 1.46667
                case .kilometersPerHour:
                    return input * 1.60934
                case .metersPerSecond:
                    return input * 0.44704
                case .milesPerHour:
                    return input
                }
            }
        }
    }
    enum Volume {
        case cubicInch, cubicFoot, cubicMeter, milliliters, liters, gallon, quart, pint, cup, ounce, tablespoon, teaspoon
        //static var list:[volume] = [volume.cubicInch, volume.cubicFoot, volume.cubicMeter, volume.milliliters, volume.liters, volume.gallon, volume.quart, volume.pint, volume.cup, volume.ounce, volume.tablespoon, volume.teaspoon]
        func convertTo(_ outputUnit:Volume, with input:Double) -> Double{
            switch(self){
            case .cubicInch:
                switch(outputUnit){
                case .cubicInch:
                    return input
                case .cubicFoot:
                    return input * 0.000578704
                case .cubicMeter:
                    return input * 0.000016387
                case .milliliters:
                    return input * 16.3871
                case .liters:
                    return input * 0.0163871
                case .gallon:
                    return input * 0.004329
                case .quart:
                    return input * 0.017316
                case .pint:
                    return input * 0.034632
                case .cup:
                    return input * 0.0682794
                case .ounce:
                    return input * 0.554113
                case .tablespoon:
                    return input * 1.10823
                case .teaspoon:
                    return input * 3.32468
                }
            case .cubicFoot:
                switch(outputUnit){
                case .cubicInch:
                    return input * 1728
                case .cubicFoot:
                    return input
                case .cubicMeter:
                    return input * 0.0283168
                case .milliliters:
                    return input * 28316.8
                case .liters:
                    return input * 28.3168
                case .gallon:
                    return input * 7.48052
                case .quart:
                    return input * 29.9221
                case .pint:
                    return input * 59.8442
                case .cup:
                    return input * 117.987
                case .ounce:
                    return input * 957.506
                case .tablespoon:
                    return input * 1915.01
                case .teaspoon:
                    return input * 5745.04
                }
            case .cubicMeter:
                switch(outputUnit){
                case .cubicInch:
                    return input *
                case .cubicFoot:
                    return input *
                case .cubicMeter:
                    return input *
                case .milliliters:
                    return input *
                case .liters:
                    return input *
                case .gallon:
                    return input *
                case .quart:
                    return input *
                case .pint:
                    return input *
                case .cup:
                    return input *
                case .ounce:
                    return input *
                case .tablespoon:
                    return input *
                case .teaspoon:
                    return input *
                }
            case .milliliters:
                switch(outputUnit){
                case .cubicInch:
                    return input *
                case .cubicFoot:
                    return input *
                case .cubicMeter:
                    return input *
                case .milliliters:
                    return input *
                case .liters:
                    return input *
                case .gallon:
                    return input *
                case .quart:
                    return input *
                case .pint:
                    return input *
                case .cup:
                    return input *
                case .ounce:
                    return input *
                case .tablespoon:
                    return input *
                case .teaspoon:
                    return input *
                }
            case .liters:
                switch(outputUnit){
                case .cubicInch:
                    return input *
                case .cubicFoot:
                    return input *
                case .cubicMeter:
                    return input *
                case .milliliters:
                    return input *
                case .liters:
                    return input *
                case .gallon:
                    return input *
                case .quart:
                    return input *
                case .pint:
                    return input *
                case .cup:
                    return input *
                case .ounce:
                    return input *
                case .tablespoon:
                    return input *
                case .teaspoon:
                    return input *
                }
            case .gallon:
                switch(outputUnit){
                case .cubicInch:
                    return input *
                case .cubicFoot:
                    return input *
                case .cubicMeter:
                    return input *
                case .milliliters:
                    return input *
                case .liters:
                    return input *
                case .gallon:
                    return input *
                case .quart:
                    return input *
                case .pint:
                    return input *
                case .cup:
                    return input *
                case .ounce:
                    return input *
                case .tablespoon:
                    return input *
                case .teaspoon:
                    return input *
                }
            case .quart:
                switch(outputUnit){
                case .cubicInch:
                    return input *
                case .cubicFoot:
                    return input *
                case .cubicMeter:
                    return input *
                case .milliliters:
                    return input *
                case .liters:
                    return input *
                case .gallon:
                    return input *
                case .quart:
                    return input *
                case .pint:
                    return input *
                case .cup:
                    return input *
                case .ounce:
                    return input *
                case .tablespoon:
                    return input *
                case .teaspoon:
                    return input *
                }
                switch(outputUnit){
                case .cubicInch:
                    return input *
                case .cubicFoot:
                    return input *
                case .cubicMeter:
                    return input *
                case .milliliters:
                    return input *
                case .liters:
                    return input *
                case .gallon:
                    return input *
                case .quart:
                    return input *
                case .pint:
                    return input *
                case .cup:
                    return input *
                case .ounce:
                    return input *
                case .tablespoon:
                    return input *
                case .teaspoon:
                    return input *
                }
            case .pint:
                switch(outputUnit){
                case .cubicInch:
                    return input *
                case .cubicFoot:
                    return input *
                case .cubicMeter:
                    return input *
                case .milliliters:
                    return input *
                case .liters:
                    return input *
                case .gallon:
                    return input *
                case .quart:
                    return input *
                case .pint:
                    return input *
                case .cup:
                    return input *
                case .ounce:
                    return input *
                case .tablespoon:
                    return input *
                case .teaspoon:
                    return input *
                }
            case .cup:
                switch(outputUnit){
                case .cubicInch:
                    return input *
                case .cubicFoot:
                    return input *
                case .cubicMeter:
                    return input *
                case .milliliters:
                    return input *
                case .liters:
                    return input *
                case .gallon:
                    return input *
                case .quart:
                    return input *
                case .pint:
                    return input *
                case .cup:
                    return input *
                case .ounce:
                    return input *
                case .tablespoon:
                    return input *
                case .teaspoon:
                    return input *
                }
            case .ounce:
                switch(outputUnit){
                case .cubicInch:
                    return input *
                case .cubicFoot:
                    return input *
                case .cubicMeter:
                    return input *
                case .milliliters:
                    return input *
                case .liters:
                    return input *
                case .gallon:
                    return input *
                case .quart:
                    return input *
                case .pint:
                    return input *
                case .cup:
                    return input *
                case .ounce:
                    return input *
                case .tablespoon:
                    return input *
                case .teaspoon:
                    return input *
                }
            case .tablespoon:
                switch(outputUnit){
                case .cubicInch:
                    return input *
                case .cubicFoot:
                    return input *
                case .cubicMeter:
                    return input *
                case .milliliters:
                    return input *
                case .liters:
                    return input *
                case .gallon:
                    return input *
                case .quart:
                    return input *
                case .pint:
                    return input *
                case .cup:
                    return input *
                case .ounce:
                    return input *
                case .tablespoon:
                    return input *
                case .teaspoon:
                    return input *
                }
            case .teaspoon:
                switch(outputUnit){
                case .cubicInch:
                    return input *
                case .cubicFoot:
                    return input *
                case .cubicMeter:
                    return input *
                case .milliliters:
                    return input *
                case .liters:
                    return input *
                case .gallon:
                    return input *
                case .quart:
                    return input *
                case .pint:
                    return input *
                case .cup:
                    return input *
                case .ounce:
                    return input *
                case .tablespoon:
                    return input *
                case .teaspoon:
                    return input *
                }
            }
        }
    }
    enum Length {
        case inch, feet, yard, mile, kilometer, meter, centimeter, millimeter, micrometer, nanometer
        //static var list:[length] = [length.inch, length.feet, length.yard, length.mile, length.kilometer, length.meter, length.centimeter, length.millimeter, length.micrometer, length.nanometer]
        func convertTo(_ outputUnit:Length, with input:Double) -> Double{
            return input
        }
    }
    enum Mass {
        case  ounce, pound, ton, metricTon, kilogram, gram, milligram, microgram
        //static var list:[mass] = [mass.ounce, mass.pound, mass.ton, mass.metricTon, mass.kilogram, mass.gram, mass.milligram, mass.microgram]
        func convertTo(_ outputUnit:Mass, with input:Double) -> Double{
            return input
        }
    }
    enum Temperature {
        case fahrenheit, celsius, kelvin
        //static var list:[temperature] = [temperature.fahrenheit, temperature.celsius, temperature.kelvin]
        func convertTo(_ outputUnit:Temperature, with input:Double) -> Double{
            return input
        }
    }
    
    struct SpeedUnitTracker {
        var specificInputUnit: Speed = .milesPerHour
        var specificOutputUnit: Speed = .kilometersPerHour
    }
    struct VolumeUnitTracker {
        var specificInputUnit: Volume = .quart
        var specificOutputUnit: Volume = .gallon
    }
    struct LengthUnitTracker {
        var specificInputUnit: Length = .feet
        var specificOutputUnit: Length = .inch
    }
    struct MassUnitTracker {
        var specificInputUnit: Mass = .pound
        var specificOutputUnit: Mass = .ounce
    }
    struct TemperatureUnitTracker {
        var specificInputUnit: Temperature = .celsius
        var specificOutputUnit: Temperature = .fahrenheit
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
    
    func setCurrentUnitType(`as` unit:UnitType){
        currentUnitType = unit
    }
    
    func setInputUnits(speed:Speed){
        guard currentUnitType == .speed else {return}
        speedTracker.specificInputUnit = speed
    }
    
    func setInputUnits(length:Length){
        guard currentUnitType == .length else {return}
        lengthTracker.specificInputUnit = length
    }
    
    func setInputUnits(mass:Mass){
        guard currentUnitType == .mass else {return}
        massTracker.specificInputUnit = mass
    }
    
    func setInputUnits(volume:Volume){
        guard currentUnitType == .volume else {return}
        volumeTracker.specificInputUnit = volume
    }
    
    func setInputUnits(temperature:Temperature){
        guard currentUnitType == .temperature else {return}
        tempTracker.specificInputUnit = temperature
    }
    func setOutputUnits(speed:Speed){
        guard currentUnitType == .speed else {return}
        speedTracker.specificOutputUnit = speed
    }
    
    func setOutputUnits(length:Length){
        guard currentUnitType == .length else {return}
        lengthTracker.specificOutputUnit = length
    }
    
    func setOutputUnits(mass:Mass){
        guard currentUnitType == .mass else {return}
        massTracker.specificOutputUnit = mass
    }
    
    func setOutputUnits(volume:Volume){
        guard currentUnitType == .volume else {return}
        volumeTracker.specificOutputUnit = volume
    }
    
    func setOutputUnits(temperature:Temperature){
        guard currentUnitType == .temperature else {return}
        tempTracker.specificOutputUnit = temperature
    }
    
    func convert(){
        switch(currentUnitType){
        case .length:
            outputValue = lengthTracker.specificInputUnit.convertTo(lengthTracker.specificOutputUnit, with: input)
            break;
        case .mass:
            outputValue = massTracker.specificInputUnit.convertTo(massTracker.specificOutputUnit, with: input)
            break;
        case .temperature:
            outputValue = tempTracker.specificInputUnit.convertTo(tempTracker.specificOutputUnit, with: input)
            break;
        case .speed:
            outputValue = speedTracker.specificInputUnit.convertTo(speedTracker.specificOutputUnit, with: input)
            break;
        case .volume:
            outputValue = volumeTracker.specificInputUnit.convertTo(volumeTracker.specificOutputUnit, with: input)
            break;
        }
    }

//    struct SpeedConversion {
//        var inputUnits: speed
//        var outputUnits: speed
//        var operation: (Double) -> Double
//
//        init(inputUnits: speed, outputUnits: speed, operation: @escaping (Double) -> Double) {
//            self.inputUnits = inputUnits
//            self.outputUnits = outputUnits
//            self.operation = operation
//        }
//    }




























}
