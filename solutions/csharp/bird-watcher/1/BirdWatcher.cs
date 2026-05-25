using System;

class BirdCount
{
    private int[] birdsPerDay;
    private int minForBusy = 5;

    public BirdCount(int[] birdsPerDay)
    {
        this.birdsPerDay = birdsPerDay;
    }

    public static int[] LastWeek()
    {
        int[] birdsLastWeek = {0, 2, 5, 3, 7, 8, 4};
        return birdsLastWeek;
    }

    public int Today() => this.birdsPerDay[this.birdsPerDay.Length - 1];

    public void IncrementTodaysCount()
    {
        int index = this.birdsPerDay.Length - 1;
        this.birdsPerDay[index] = this.Today() + 1;
    }

    public bool HasDayWithoutBirds()
    {
        foreach (int birds in this.birdsPerDay)
        {
            if (birds == 0)
            {
                return true;
            }
        }
        return false;
    }

    public int CountForFirstDays(int numberOfDays)
    {
        int count = 0;
        for (int day = 1; day <= numberOfDays; day++)
        {
            count += this.birdsPerDay[day - 1];
        }
        return count;
    }

    public int BusyDays()
    {
        int count = 0;
        foreach (int birds in this.birdsPerDay)
        {
            if (birds >= this.minForBusy)
            {
                count++;
            }
        }
        return count;
    }
}
