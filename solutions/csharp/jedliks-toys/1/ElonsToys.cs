using System;

class RemoteControlCar
{
    private int _step = 20;
    private int _distance = 0;
    private int _battery = 100;
    
    public static RemoteControlCar Buy() => new RemoteControlCar();

    public string DistanceDisplay() => $"Driven {this._distance} meters";

    public string BatteryDisplay() => this._battery != 0 ? $"Battery at {this._battery}%" : "Battery empty";

    public void Drive()
    {
        if (this._battery != 0)
        {
            this._distance += this._step;
            this._battery -= 1;
        }
        System.Console.WriteLine(this.BatteryDisplay());
    }
}
