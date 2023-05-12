
import Foundation
import AppKit

class ScrollPlayPauseController: Controller
{
    var lastClick = Date().timeIntervalSince1970
    
    func onDown() {
        
    }
    
    func onUp() {
        
        let clickDelay = Date().timeIntervalSince1970 - lastClick
        
        // Next song on double click
        if (clickDelay < 0.5) {
            // Undo pause sent on first click
       //     HIDPostAuxKey(key: NX_KEYTYPE_PLAY, modifiers: [], _repeat: 1)
            
         //   HIDPostAuxKey(key: NX_KEYTYPE_NEXT, modifiers: [])
        }
        else { // Play / Pause on single click
            
            HIDPostAuxKey(key: NX_KEYTYPE_PLAY, modifiers: [], _repeat: 1)
        }
        
        lastClick = Date().timeIntervalSince1970
    }
    
    var lastRotate: TimeInterval = Date().timeIntervalSince1970
    
    func onRotate(_ rotation: Dial.Rotation,_ scrollDirection: Int) {
        var steps = 0
        switch rotation {
        case .Clockwise(let d):
            steps = d
        case .CounterClockwise(let d):
            steps = -d
        }
        
        steps *= scrollDirection;
        
        let diff = (Date().timeIntervalSince1970 - lastRotate) * 1000
        let multiplifer = Int(1 + ((150 - min(diff, 150)) / 40))
        
        
        let event = CGEvent(scrollWheelEvent2Source: nil, units: .line, wheelCount: 1, wheel1: Int32(steps * multiplifer), wheel2: 0, wheel3: 0)
        
        event?.post(tap: .cghidEventTap)
        
        lastRotate = Date().timeIntervalSince1970
    }
}
