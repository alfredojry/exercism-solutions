using System;
using System.Globalization;

static class Appointment
{
    public static DateTime Schedule(string appointmentDateDescription)
    {
        CultureInfo cInf = new CultureInfo("en-US");
        return DateTime.Parse(appointmentDateDescription, cInf);
    }

    public static bool HasPassed(DateTime appointmentDate) => appointmentDate < DateTime.Now;

    public static bool IsAfternoonAppointment(DateTime appointmentDate)
    {
        int hour = appointmentDate.Hour;
        return hour >= 12 && hour < 18;
    }

    public static string Description(DateTime appointmentDate)
    {
        string dateStr = appointmentDate.ToString("M/d/yyyy h:mm:ss tt");
        return $"You have an appointment on {dateStr}.";
    }

    public static DateTime AnniversaryDate() => new DateTime(DateTime.Now.Year, 9, 15, 0, 0, 0);
}
