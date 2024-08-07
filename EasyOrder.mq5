#include <Trade\Trade.mqh>

input double StopLossPercentage = 0.5; // Stop Loss percentage (0,5% by default)
input double InitialAccountBalance = 200000; // Initial Account Balance (200.000 by default)

CTrade trade;

double assetPrice;
double volume;
double stopLossPrice;
  
 //+------------------------------------------------------------------+
//| Function to truncate all decimal values                          |
//+------------------------------------------------------------------+
double TruncateToInteger(double value)
  {
   return (double)((int)value);
  }
  
  
 //+------------------------------------------------------------------+
//| Function to truncate a double to two decimal places              |
//+------------------------------------------------------------------+
double TruncateToTwoDecimals(double value)
  {
   // Scale up by 100 (to preserve two decimal places), truncate, and scale down
   return MathFloor(value * 100) / 100;
  }


// Function to calculate the lot size based on account balance and stop loss percentage
void CalculateOrderInfo(double stopLossPercentage, double initialAccountBalance) {
    assetPrice = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
    volume = TruncateToInteger(initialAccountBalance / assetPrice);
    double positionAmount = volume * assetPrice;
    double riskAmount = initialAccountBalance * stopLossPercentage / 100.0;
    double stopLossPerShare = riskAmount / volume; 
    stopLossPrice = TruncateToTwoDecimals(assetPrice - stopLossPerShare);
}

void OnInit() {
    // Create the "Place Order" button
    CreateButton(300, 50, 200, 50, "Place Order");
}

// Function to create a button on the chart
void CreateButton(int x, int y, int width, int height, string label) {
    if (!ObjectCreate(0, label, OBJ_BUTTON, 0, 0, 0)) {
        Print("Failed to create button: ", GetLastError());
        return;
    }
    ObjectSetInteger(0, label, OBJPROP_CORNER, CORNER_RIGHT_UPPER);
    ObjectSetInteger(0, label, OBJPROP_XSIZE, width);
    ObjectSetInteger(0, label, OBJPROP_YSIZE, height);
    ObjectSetInteger(0, label, OBJPROP_XDISTANCE, x);
    ObjectSetInteger(0, label, OBJPROP_YDISTANCE, y);
    ObjectSetInteger(0, label, OBJPROP_COLOR, clrWhite);
     ObjectSetInteger(0, label,OBJPROP_BGCOLOR , clrGreen);
    
    ObjectSetInteger(0, label, OBJPROP_HIDDEN, false);
    ObjectSetString(0, label, OBJPROP_TEXT, label);
}

void OnChartEvent(const int id, const long &lparam, const double &dparam, const string &sparam) {
    if (id == CHARTEVENT_OBJECT_CLICK && sparam == "Place Order") {
        // calculate order infoΩ
        CalculateOrderInfo(StopLossPercentage, InitialAccountBalance);
        

         // Place a market order with the calculated lot size and stop loss
        if (trade.Buy(volume, _Symbol, assetPrice, stopLossPrice, 0.0, "EasyOrder")) {
           Print("Order placed successfully!");
        } else {
           Print("Failed to place order: ", GetLastError());
      }
    }
}

void OnDeinit(const int reason) {
    // Delete the button when the EA is removed
    ObjectDelete(0, "Place Order");
}