using System;

static class SavingsAccount
{
    public static float InterestRate(decimal balance)
    {
        if (balance < 0)
        {
            return 3.213f;
        } else if (balance < 1_000)
        {
            return .5f;
        } else if (balance < 5_000)
        {
            return 1.621f;
        } else
        {
            return 2.475f;
        }
    }

    public static decimal Interest(decimal balance) => balance * (decimal) (SavingsAccount.InterestRate(balance) / 100f);

    public static decimal AnnualBalanceUpdate(decimal balance) => balance + SavingsAccount.Interest(balance);

    public static int YearsBeforeDesiredBalance(decimal balance, decimal targetBalance)
    {
        int years = 0;
        while(balance < targetBalance)
        {
            years++;
            balance = SavingsAccount.AnnualBalanceUpdate(balance);
        }
        return years;
    }
}
