using System;

static class LogLine
{
    public static string Message(string logLine)
    {
        int indexSpace = logLine.IndexOf(" ");
        int last = logLine.Length;
        string message = logLine.Substring(indexSpace, last - indexSpace);
        return message.Trim();
    }

    public static string LogLevel(string logLine)
    {
        int first = logLine.IndexOf("[") + 1;
        int last = logLine.IndexOf("]");
        string level = logLine.Substring(first, last - first);
        return level.Trim().ToLower();
    }

    public static string Reformat(string logLine)
    {
        string message = LogLine.Message(logLine);
        string level = LogLine.LogLevel(logLine);
        return $"{message} ({level})";
    }
}
