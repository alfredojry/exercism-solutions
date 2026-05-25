using System;

class RemoteControlCar
{
    private int speed;
    private int batteryDrain;
    private int battery = 100;
    private int distance = 0;
    
    public RemoteControlCar(int speed, int batteryDrain)
    {
        this.speed = speed;
        this.batteryDrain = batteryDrain;
    }

    public bool BatteryDrained() => this.battery < this.batteryDrain;

    public int DistanceDriven() => this.distance;

    public void Drive()
    {
        if (!this.BatteryDrained())
        {
            this.battery -= this.batteryDrain;
            this.distance += this.speed;
        }
    }

    public static RemoteControlCar Nitro() => new RemoteControlCar(50, 4);
}

class RaceTrack
{
    private int distance;

    public RaceTrack(int distance)
    {
        this.distance = distance;
    }

    public bool TryFinishTrack(RemoteControlCar car)
    {
        while (!car.BatteryDrained())
        {
            car.Drive();
            if (car.DistanceDriven() >= this.distance)
            {
                return true;
            }
        }
        return false;
    }
}
