# SATrafficLight
TrafficLight with Red,Yellow,Green Light Similar to trafficLights on Roads.

Contain Module - TrafficLight
1)Model Class -> SATrafficLight
with configurable trafficLightTime enum of type TimeInterval(in seconds) :
enum trafficLightTime : TimeInterval {
    case red  = 3
    case yellow = 2
    case green = 1
}

2) View -> SATrafficLightView 
 Updates Traffic Light view for trafficLight State


Usage: 
a)Invoke startTrafficLight() function of SATrafficLight" Model class.
b)Conform to SATrafficLightProtocol to update trafficLightState.

example Usage  is written into ViewController






