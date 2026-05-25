using System;
using System.Text;

public static class Identifier
{
    public static string Clean(string identifier)
    {
        StringBuilder sb = new StringBuilder("", 10000);
        bool camelCase = false;
        foreach (char ch in identifier)
        {
            if (Char.IsWhiteSpace(ch))
            {
                sb.Append('_');
            } else if (Char.IsControl(ch))
            {
                sb.Append("CTRL");
            } else if(ch == '-')
            {
                camelCase = true;
            } else if(camelCase)
            {
                sb.Append(Char.ToUpper(ch));
                camelCase = false;
            } else if (Char.IsLetter(ch) && !Char.IsBetween(ch, 'α', 'ω'))
            {
                sb.Append(ch);
            }
        }
        return sb.ToString();
    }
}
