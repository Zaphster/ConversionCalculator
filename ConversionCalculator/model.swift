//
//  model.swift
//  ConversionCalculator
//
//  Created by Jared Bruemmer on 10/3/17.
//  Copyright © 2017 Cameron Barker. All rights reserved.
//

import Foundation

class Converter {
    
    enum unitType {
        case speed, volume, length, mass, temperature
    }
    
    enum speed {
        case milesPerHour
        case kilometersPerHour
        case feetPerSecond
        case metersPerSecond
        case knot
    }
    enum volume {
        case gallon
        case quart
        case pint
        case cup
        case ounce
        case tablespoon
        case teaspoon
        case cubicMeter
        case cubicFoot
        case cubicInch
        case liters
        case milliliters
    }
    enum length {
        case kilometer
        case meter
        case centimeter
        case millimeter
        case micrometer
        case nanometer
        case mile
        case yard
        case feet
        case inch
        case nauticalMile
    }
    enum mass {
        case metricTon
        case kilogram
        case gram
        case milligram
        case microgram
        case ton
        case pound
        case ounce
    }
    enum temperature {
        case celsius
        case fahrenheit
        case kelvin
    }
    struct speedUnits {
        var inputType: unitType = .speed
        var specificInputUnit: speed = .milesPerHour
        var specificOutputUnit: speed = .kilometersPerHour
    }
    struct volumeUnits {
        var inputType: unitType = .volume
        var specificInputUnit: volume = .quart
        var specificOutputUnit: volume = .gallon
    }
    struct lengthUnits {
        var inputType: unitType = .length
        var specificInputUnit: length = .feet
        var specificOutputUnit: length = .inch
    }
    struct massUnits {
        var inputType: unitType = .mass
        var specificInputUnit: mass = .pound
        var specificOutputUnit: mass = .ounce
    }
    struct temperatureUnits {
        var inputType: unitType = .temperature
        var specificInputUnit: temperature = .celsius
        var specificOutputUnit: temperature = .fahrenheit
    }
    var inputValue: String = ""
    var outputValue: Double = 0.0
    var input: Double {
        return Double(inputValue) ?? 0.0
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
    



































}

