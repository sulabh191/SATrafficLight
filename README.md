# SATrafficLight -
* Language Used - swift 3.0
* TrafficLight with Red,Yellow,Green Light Similar to trafficLights on Roads.

Contain Module - TrafficLight
* i)Model Class -> SATrafficLight 
with configurable trafficLightTime enum of type TimeInterval(in seconds) :

```javascript
enum trafficLightTime : TimeInterval {
    case red  = 3
    case yellow = 2
    case green = 1
}
````

* 2) View -> SATrafficLightView 
 Updates Traffic Light view for trafficLight State


* Usage: 
  * a)Invoke startTrafficLight() function of SATrafficLight" Model class. 
  * b)Conform to SATrafficLightProtocol to update trafficLightState.

* example Usage  is written into ViewController


![alt text](https://s1.postimg.org/a78s3df9r/Traffic_Light.png)



