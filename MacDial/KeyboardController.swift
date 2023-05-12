

import Foundation
import AppKit
import CoreGraphics
import Carbon

let backtickKeyCode = CGKeyCode(50)
let semicolonKeyCode = CGKeyCode(41)
let apostropheKeyCode = CGKeyCode(39)
// This ensures a very unique key combination to reduce the
// likelihood of a clash with another program's shortcut keys
// Modifiers can be: .maskShift, .maskControl, .maskCommand, .maskAlternate (Option)
let modifiers: CGEventFlags = []

func CGPostForKB( key: CGKeyCode, modifiers: CGEventFlags) {
    let keyDownEvent = CGEvent(keyboardEventSource: nil, virtualKey: key, keyDown: true)
    keyDownEvent?.flags = modifiers
    keyDownEvent?.post(tap: .cghidEventTap)
    let keyUpEvent = CGEvent(keyboardEventSource: nil, virtualKey: key, keyDown: false)
    keyUpEvent?.flags = modifiers
    keyUpEvent?.post(tap: .cghidEventTap)
}


class KeyboardController : Controller {
    
    var lastClick = Date().timeIntervalSince1970
    
    func onDown() {
        
    }
    
    func onUp() {
        CGPostForKB(key: backtickKeyCode, modifiers: modifiers)
    }
    
    
    
    func onRotate(_ rotation: Dial.Rotation,_ scrollDirection: Int) {
        
        switch (rotation) {
        case .Clockwise(_):
            CGPostForKB(key: apostropheKeyCode, modifiers: modifiers)
            break
        case .CounterClockwise(_):
            CGPostForKB(key: semicolonKeyCode, modifiers: modifiers)
            break
        }
    }
}
