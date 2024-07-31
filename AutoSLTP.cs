//+------------------------------------------------------------------+
//|                                                     AutoSLTP.mq5 |
//|                        Copyright 2023, MetaQuotes Software Corp. |
//|                                       https://www.metaquotes.net |
//+------------------------------------------------------------------+
#property strict

#include <Trade\Trade.mqh>
CTrade trade;

double GetAccountBalancePercentage(double percentage)
{
    return (AccountInfoDouble(ACCOUNT_BALANCE) * percentage / 100.0);
}

void SetSLTPForOpenOrders()
{
    double sl_amount = GetAccountBalancePercentage(0.5);
    double tp_amount = GetAccountBalancePercentage(0.5);

    for (int i = PositionsTotal() - 1; i >= 0; i--)
    {
        if (PositionSelectByIndex(i))
        {
            if (PositionGetString(POSITION_SYMBOL) == Symbol())
            {
                long ticket = PositionGetInteger(POSITION_TICKET);
                double open_price = PositionGetDouble(POSITION_PRICE_OPEN);
                double sl = PositionGetDouble(POSITION_SL);
                double tp = PositionGetDouble(POSITION_TP);
                double tick_value = SymbolInfoDouble(Symbol(), SYMBOL_TRADE_TICK_VALUE);
                double tick_size = SymbolInfoDouble(Symbol(), SYMBOL_TRADE_TICK_SIZE);

                double sl_points = sl_amount / tick_value / tick_size;
                double tp_points = tp_amount / tick_value / tick_size;

                if (PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY)
                {
                    if (sl <= 0 || tp <= 0)
                    {
                        trade.PositionModify(ticket, open_price - sl_points * Point, open_price + tp_points * Point);
                    }
                }
                else if (PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_SELL)
                {
                    if (sl <= 0 || tp <= 0)
                    {
                        trade.PositionModify(ticket, open_price + sl_points * Point, open_price - tp_points * Point);
                    }
                }
            }
        }
    }
}

void OnTick()
{
    SetSLTPForOpenOrders();
}
