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
    }
    
    enum UnitType {
        case speed, volume, length, mass, temperature
    }
    
    enum Speed {
        case feetPerSecond, metersPerSecond, kilometersPerHour, milesPerHour
        
        func convertTo(_ outputUnit:Speed, with input:Double) -> Double{
            switch(self){
            case .feetPerSecond:
                switch(outputUnit){
                case .feetPerSecond: return input
                case .kilometersPerHour: return input * 1.09728
                case .metersPerSecond: return input * 0.3048
                case .milesPerHour: return input * 0.681818
                }
            case .metersPerSecond:
                switch(outputUnit){
                case .feetPerSecond: return input * 3.28084
                case .kilometersPerHour: return input * 3.6
                case .metersPerSecond: return input
                case .milesPerHour: return input * 2.23694
                }
            case .kilometersPerHour:
                switch(outputUnit){
                case .feetPerSecond: return input * 0.911344
                case .kilometersPerHour: return input
                case .metersPerSecond: return input * 0.277778
                case .milesPerHour: return input * 0.621371
                }
            case .milesPerHour:
                switch(outputUnit){
                case .feetPerSecond: return input * 1.46667
                case .kilometersPerHour: return input * 1.60934
                case .metersPerSecond: return input * 0.44704
                case .milesPerHour: return input
                }
            }
        }
    }
    enum Volume {
        case cubicInch, cubicFoot, cubicMeter, milliliters, liters, gallon, quart, pint, cup, ounce, tablespoon, teaspoon
        func convertTo(_ outputUnit:Volume, with input:Double) -> Double{
            switch(self){
            case .cubicInch:
                switch(outputUnit){
                case .cubicInch: return input
                case .cubicFoot: return input * 0.000578704
                case .cubicMeter: return input * 0.000016387
                case .milliliters: return input * 16.3871
                case .liters: return input * 0.0163871
                case .gallon: return input * 0.004329
                case .quart: return input * 0.017316
                case .pint: return input * 0.034632
                case .cup: return input * 0.0692641
                case .ounce: return input * 0.554113
                case .tablespoon: return input * 1.10823
                case .teaspoon: return input * 3.32468
                }
            case .cubicFoot:
                switch(outputUnit){
                case .cubicInch: return input * 1728
                case .cubicFoot: return input
                case .cubicMeter: return input * 0.0283168
                case .milliliters: return input * 28316.8
                case .liters: return input * 28.3168
                case .gallon: return input * 7.48052
                case .quart: return input * 29.9221
                case .pint: return input * 59.8442
                case .cup: return input * 119.688
                case .ounce: return input * 957.506
                case .tablespoon: return input * 1915.01
                case .teaspoon: return input * 5745.04
                }
            case .cubicMeter:
                switch(outputUnit){
                case .cubicInch: return input * 61023.7
                case .cubicFoot: return input * 35.3147
                case .cubicMeter: return input
                case .milliliters: return input * 1000000
                case .liters: return input * 1000
                case .gallon: return input * 264.172
                case .quart: return input * 1056.69
                case .pint: return input * 2113.38
                case .cup: return input * 4226.75
                case .ounce: return input * 33814
                case .tablespoon: return input * 67628
                case .teaspoon: return input * 202884
                }
            case .milliliters:
                switch(outputUnit){
                case .cubicInch: return input * 0.0610237
                case .cubicFoot: return input * 0.000035315
                case .cubicMeter: return input * 0.000001
                case .milliliters: return input
                case .liters: return input * 0.001
                case .gallon: return input * 0.000264172
                case .quart: return input * 0.00105669
                case .pint: return input * 0.00211338
                case .cup: return input * 0.00422675
                case .ounce: return input * 0.033814
                case .tablespoon: return input * 0.067628
                case .teaspoon: return input * 0.202884
                }
            case .liters:
                switch(outputUnit){
                case .cubicInch: return input * 61.0237
                case .cubicFoot: return input * 0.0353147
                case .cubicMeter: return input * 0.001
                case .milliliters: return input * 1000
                case .liters: return input
                case .gallon: return input * 0.264172
                case .quart: return input * 1.05669
                case .pint: return input * 2.11338
                case .cup: return input * 4.22675
                case .ounce: return input * 33.814
                case .tablespoon: return input * 67.628
                case .teaspoon: return input * 202.884
                }
            case .gallon:
                switch(outputUnit){
                case .cubicInch: return input * 231
                case .cubicFoot: return input * 0.133681
                case .cubicMeter: return input * 0.00378541
                case .milliliters: return input * 3785.41
                case .liters: return input * 3.78541
                case .gallon: return input
                case .quart: return input * 4
                case .pint: return input * 8
                case .cup: return input * 16
                case .ounce: return input * 128
                case .tablespoon: return input * 256
                case .teaspoon: return input * 768
                }
            case .quart:
                switch(outputUnit){
                case .cubicInch: return input * 57.75
                case .cubicFoot: return input * 0.0334201
                case .cubicMeter: return input * 0.000946353
                case .milliliters: return input * 946.353
                case .liters: return input * 0.946353
                case .gallon: return input * 0.24
                case .quart: return input
                case .pint: return input * 2
                case .cup: return input * 4
                case .ounce: return input * 32
                case .tablespoon: return input * 64
                case .teaspoon: return input * 192
                }
            case .pint:
                switch(outputUnit){
                case .cubicInch: return input * 28.875
                case .cubicFoot: return input * 0.0167101
                case .cubicMeter: return input * 0.000473176
                case .milliliters: return input * 473.176
                case .liters: return input * 0.473176
                case .gallon: return input * 0.125
                case .quart: return input * 0.5
                case .pint: return input
                case .cup: return input * 2
                case .ounce: return input * 16
                case .tablespoon: return input * 32
                case .teaspoon: return input * 96
                }
            case .cup:
                switch(outputUnit){
                case .cubicInch: return input * 14.6457
                case .cubicFoot: return input * 0.00847552
                case .cubicMeter: return input * 0.00024
                case .milliliters: return input * 240
                case .liters: return input * 0.24
                case .gallon: return input * 0.0625
                case .quart: return input * 0.25
                case .pint: return input * 0.5
                case .cup: return input
                case .ounce:return input * 8
                case .tablespoon: return input * 16
                case .teaspoon: return input * 48
                }
            case .ounce:
                switch(outputUnit){
                case .cubicInch: return input * 1.80469
                case .cubicFoot: return input * 0.00104438
                case .cubicMeter: return input * 0.0000295735
                case .milliliters: return input * 29.5735
                case .liters: return input * 0.0295735
                case .gallon: return input * 0.0078125
                case .quart: return input * 0.03125
                case .pint: return input * 0.0625
                case .cup: return input * 0.125
                case .ounce: return input
                case .tablespoon: return input * 2
                case .teaspoon: return input * 6
                }
            case .tablespoon:
                switch(outputUnit){
                case .cubicInch: return input * 0.902344
                case .cubicFoot: return input * 0.00052219
                case .cubicMeter: return input * 0.0000147868
                case .milliliters: return input * 14.7868
                case .liters: return input * 0.0147868
                case .gallon: return input * 0.00390625
                case .quart: return input * 0.015625
                case .pint: return input * 0.03125
                case .cup: return input * 0.0625
                case .ounce: return input * 0.5
                case .tablespoon: return input
                case .teaspoon: return input * 3
                }
            case .teaspoon:
                switch(outputUnit){
                case .cubicInch: return input * 0.300781
                case .cubicFoot: return input * 0.000174063
                case .cubicMeter: return input * 0.00000492892
                case .milliliters: return input * 4.92892
                case .liters: return input * 0.00492892
                case .gallon: return input * 0.00130208
                case .quart: return input * 0.00520833
                case .pint: return input * 0.0104167
                case .cup: return input * 0.020833
                case .ounce: return input * 0.16666666667
                case .tablespoon: return input * 0.33333333333
                case .teaspoon: return input
                }
            }
        }
    }
    enum Length {
        case inch, feet, yard, mile, kilometer, meter, centimeter, millimeter, micrometer, nanometer
        
        func convertTo(_ outputUnit:Length, with input:Double) -> Double{
            switch(self){
            case .inch:
                switch(outputUnit){
                case .inch: return input
                case .feet: return input * 0.0833333
                case .yard: return input * 0.0277778
                case .mile: return input * 0.000015783
                case .kilometer: return input * 0.0000254
                case .meter: return input * 0.0254
                case .centimeter: return input * 2.54
                case .millimeter: return input * 25.4
                case .micrometer: return input * 25400
                case .nanometer: return input * 25400000
                }
            case .feet:
                switch(outputUnit){
                case .inch: return input * 12
                case .feet: return input
                case .yard: return input * 0.33333333
                case .mile: return input * 0.000189394
                case .kilometer: return input * 0.0003048
                case .meter: return input * 0.3048
                case .centimeter: return input * 30.48
                case .millimeter: return input * 304.8
                case .micrometer: return input * 304800
                case .nanometer: return input * 304800000
                }
            case .yard:
                switch(outputUnit){
                case .inch: return input * 36
                case .feet: return input * 3
                case .yard: return input
                case .mile: return input * 0.000568182
                case .kilometer: return input * 0.0009144
                case .meter: return input * 0.9144
                case .centimeter: return input * 91.44
                case .millimeter: return input * 914.4
                case .micrometer: return input * 914400
                case .nanometer: return input * 9.14400000
                }
            case .mile:
                switch(outputUnit){
                case .inch: return input * 63360
                case .feet: return input * 5280
                case .yard: return input * 1760
                case .mile: return input
                case .kilometer: return input * 1.60934
                case .meter: return input * 1609.34
                case .centimeter: return input * 160934
                case .millimeter: return input * 1609000
                case .micrometer: return input * 1609000000
                case .nanometer: return input * 1609000000000
                }
            case .kilometer:
                switch(outputUnit){
                case .inch: return input * 39370.1
                case .feet: return input * 3280.84
                case .yard: return input * 1093.61
                case .mile: return input * 0.621371
                case .kilometer: return input
                case .meter: return input * 1000
                case .centimeter: return input * 100000
                case .millimeter: return input * 1000000
                case .micrometer: return input * 1000000000
                case .nanometer: return input * 1000000000000
                }
            case .meter:
                switch(outputUnit){
                case .inch: return input * 39.3701
                case .feet: return input * 3.28084
                case .yard: return input * 1.09361
                case .mile: return input * 0.000621371
                case .kilometer: return input * 0.001
                case .meter: return input
                case .centimeter: return input * 100
                case .millimeter: return input * 1000
                case .micrometer: return input * 1000000
                case .nanometer: return input * 1000000000
                }
            case .centimeter:
                switch(outputUnit){
                case .inch: return input * 0.393701
                case .feet: return input * 0.0328084
                case .yard: return input * 0.0109361
                case .mile: return input * 0.0000062137
                case .kilometer: return input * 0.00001
                case .meter: return input * 0.01
                case .centimeter: return input
                case .millimeter: return input * 10
                case .micrometer: return input * 10000
                case .nanometer: return input * 10000000
                }
            case .millimeter:
                switch(outputUnit){
                case .inch: return input * 0.0393701
                case .feet: return input * 0.00328084
                case .yard: return input * 0.00109361
                case .mile: return input * 0.00000062137
                case .kilometer: return input * 0.000001
                case .meter: return input * 0.001
                case .centimeter: return input * 0.1
                case .millimeter: return input
                case .micrometer: return input * 1000
                case .nanometer: return input * 1000000
                }
            case .micrometer:
                switch(outputUnit){
                case .inch: return input * 0.00003937
                case .feet: return input * 0.0000032808
                case .yard: return input * 0.0000010936
                case .mile: return input * 0.00000000062137
                case .kilometer: return input * 0.000000001
                case .meter: return input * 0.000001
                case .centimeter: return input * 0.0001
                case .millimeter: return input * 0.001
                case .micrometer: return input
                case .nanometer: return input * 1000
                }
            case .nanometer:
                switch(outputUnit){
                case .inch: return input * 0.00000003937
                case .feet: return input * 0.0000000032808
                case .yard: return input * 0.0000000010936
                case .mile: return input * 0.00000000000062137
                case .kilometer: return input * 0.000000000001
                case .meter: return input * 0.000000001
                case .centimeter: return input * 0.0000001
                case .millimeter: return input * 0.000001
                case .micrometer: return input * 0.001
                case .nanometer: return input
                }
            }
        }
    }
    enum Mass {
        case  ounce, pound, ton, metricTon, kilogram, gram, milligram, microgram
        func convertTo(_ outputUnit:Mass, with input:Double) -> Double{
            switch(self){
            case .ounce:
                switch(outputUnit){
                case .ounce: return input
                case .pound: return input * 0.0625
                case .ton: return input * 0.00003125
                case .metricTon: return input * 0.00002835
                case .kilogram: return input * 0.0283495
                case .gram: return input * 28.3495
                case .milligram: return input * 28349.5
                case .microgram: return input * 28350000
                }
            case .pound:
                switch(outputUnit){
                case .ounce: return input * 16
                case .pound: return input
                case .ton: return input * 0.0005
                case .metricTon: return input * 0.000453592
                case .kilogram: return input * 0.453592
                case .gram: return input * 453.592
                case .milligram: return input * 453592
                case .microgram: return input * 453600000
                }
            case .ton:
                switch(outputUnit){
                case .ounce: return input * 32000
                case .pound: return input * 2000
                case .ton: return input
                case .metricTon: return input * 0.907185
                case .kilogram: return input * 907.185
                case .gram: return input * 907185
                case .milligram: return input * 907200000
                case .microgram: return input * 907200000000
                }
            case .metricTon:
                switch(outputUnit){
                case .ounce: return input * 35274
                case .pound: return input * 2204.62
                case .ton: return input * 1.10231
                case .metricTon: return input
                case .kilogram: return input * 1000
                case .gram: return input * 1000000
                case .milligram: return input * 1000000000
                case .microgram: return input * 1000000000000
                }
            case .kilogram:
                switch(outputUnit){
                case .ounce: return input * 35.274
                case .pound: return input * 2.20462
                case .ton: return input * 0.00110231
                case .metricTon: return input * 0.001
                case .kilogram: return input
                case .gram: return input * 1000
                case .milligram: return input * 1000000
                case .microgram: return input * 1000000000
                }
            case .gram:
                switch(outputUnit){
                case .ounce: return input * 0.035274
                case .pound: return input * 0.00220462
                case .ton: return input * 0.0000011023
                case .metricTon: return input * 0.000001
                case .kilogram: return input * 0.001
                case .gram: return input
                case .milligram: return input * 1000
                case .microgram: return input * 1000000
                }
            case .milligram:
                switch(outputUnit){
                case .ounce: return input * 0.000035274
                case .pound: return input * 0.0000022046
                case .ton: return input * 0.0000000011023
                case .metricTon: return input * 0.000000001
                case .kilogram: return input * 0.000001
                case .gram: return input * 0.001
                case .milligram: return input
                case .microgram: return input * 1000
                }
            case .microgram:
                switch(outputUnit){
                case .ounce: return input * 0.000000035274
                case .pound: return input * 0.0000000022046
                case .ton: return input * 0.0000000000011023
                case .metricTon: return input * 0.000000000001
                case .kilogram: return input * 0.000000001
                case .gram: return input * 0.000001
                case .milligram: return input * 0.001
                case .microgram: return input
                }
            }
        }
    }
    enum Temperature {
        case fahrenheit, celsius, kelvin
        func convertTo(_ outputUnit:Temperature, with input:Double) -> Double{
            switch(self){
            case .fahrenheit:
                switch(outputUnit){
                case .fahrenheit: return input
                case .celsius: return (input - 32) * (5/9)
                case .kelvin: return (input + 459.67) * (5/9)
                }
            case .celsius:
                switch(outputUnit){
                case .fahrenheit: return (input * 1.8) + 32
                case .celsius: return input
                case .kelvin: return input + 273.15
                }
            case .kelvin:
                switch(outputUnit){
                case .fahrenheit: return (input * 1.8) - 459.67
                case .celsius: return input - 273.15
                case .kelvin: return input
                }
            }
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
}
