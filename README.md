# EasyOrder EA for Metatrader 5

## How to it works
This EA displays a Place Order button on the chart. When you click the button, the EA will place a market order with the following parameters:

- Symbol: The symbol of the chart (it works with stocks)
- Volume: Based on the initial balance set in the EA input it will calculate the volume to trade. The volume is calculated as the initial balance divided by the price of the stock. So, if the initial balance is 1000 and the price of the stock is 10, the volume will be 100.
- Stop Loss: Based on the stop loss percentage set in the EA input it will calculate the stop loss price. The stop loss is calculated based on the initial balance so if the initial balance is 1000 and the stop loss percentage is 0,5%, then the maximum loss that we can have is 5. So, if the price of the stock is 10, the stop loss price will be 9,5.

## How to use it

1. Copy the code from the file `EasyOrder.mq5`
2. Open Metatrader 5
3. Go to Tools -> MetaQuotes Language Editor
4. Go to File -> New -> Expert Advisor
5. Select Expert Advisor (generate) and click on Next
6. In the field `name` type the name you want to give to the Expert Advisor, it can be for example EasyOrder and click on Next
7. In this step leave all boxes unchecked and click on Next
8. In this step you must also leave all the boxes unchecked and click on Finish
9. Now you will see the code of the Expert Advisor, delete all the code and paste the code that you copied from the file `EasyOrder.mq5`
10. Click on the Compile button.
11. Close the MetaQuotes Language Editor
12. Go to your Metatrader 5 and open the chart of the stock that you want to trade
13. Drag and drop the Expert Advisor to the chart
14. In the Inputs tab you can set the initial balance and the stop loss percentage
15. Click on OK
16. The EA is ready! Now you will see a Place Order button on the chart
