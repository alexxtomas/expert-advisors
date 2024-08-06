<chart>
id=133669304856819830
symbol=NVDA
description=NVIDIA Corp
period_type=1
period_size=1
digits=2
tick_size=0.000000
position_time=1721898000
scale_fix=0
scale_fixed_min=90.200000
scale_fixed_max=125.100000
scale_fix11=0
scale_bar=0
scale_bar_val=1.000000
scale=16
mode=1
fore=0
grid=1
volume=1
scroll=1
shift=0
shift_size=20.326531
fixed_pos=0.000000
ticker=1
ohlc=0
one_click=0
one_click_btn=1
bidline=1
askline=0
lastline=0
days=0
descriptions=0
tradelines=1
tradehistory=1
window_left=0
window_top=3
window_right=3044
window_bottom=1255
window_type=1
floating=0
floating_left=0
floating_top=0
floating_right=0
floating_bottom=0
floating_type=1
floating_toolbar=1
floating_tbstate=
background_color=0
foreground_color=16777215
barup_color=65280
bardown_color=65280
bullcandle_color=0
bearcandle_color=16777215
chartline_color=65280
volumes_color=3329330
grid_color=10061943
bidline_color=10061943
askline_color=255
lastline_color=49152
stops_color=255
windows_total=1

<expert>
name=EasyOrder
path=Experts\Advisors\EasyOrder.ex5
expertmode=1
<inputs>
StopLossPercentage=0.5
InitialAccountBalance=200000.0
</inputs>
</expert>

<window>
height=100.000000
objects=7

<indicator>
name=Main
path=
apply=1
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.000000
scale_fix_min=0
scale_fix_min_val=0.000000
scale_fix_max=0
scale_fix_max_val=0.000000
expertmode=0
fixed_height=-1
</indicator>
<object>
type=31
name=autotrade #28042175 buy 1.947K NVDA at 102.01, NVDA
hidden=1
color=11296515
selectable=0
date1=1722618541
value1=102.010000
</object>

<object>
type=32
name=autotrade #28042727 sell 1.947K NVDA at 101.45, SL, profit -1 0
hidden=1
descr=[sl 101.50]
color=1918177
selectable=0
date1=1722618619
value1=101.450000
</object>

<object>
type=31
name=autotrade #28704549 buy 1.889K NVDA at 105.87, NVDA
hidden=1
descr=EasyOrder
color=11296515
selectable=0
date1=1722972828
value1=105.870000
</object>

<object>
type=32
name=autotrade #28704820 sell 1.889K NVDA at 105.97, profit 188.90, 
hidden=1
color=1918177
selectable=0
date1=1722972898
value1=105.970000
</object>

<object>
type=2
name=autotrade #28042175 -> #28042727, SL, profit -1 090.32, NVDA
hidden=1
descr=102.01 -> 101.45
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1722618541
date2=1722618619
value1=102.010000
value2=101.450000
</object>

<object>
type=2
name=autotrade #28704549 -> #28704820, profit 188.90, NVDA
hidden=1
descr=105.87 -> 105.97
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1722972828
date2=1722972898
value1=105.870000
value2=105.970000
</object>

<object>
type=103
name=Place Order
descr=Place Order
color=16777215
selectable=0
pos_x=300
pos_y=50
fontsz=10
fontnm=Arial
state=0
size_x=200
size_y=50
bgcolor=5275647
frcolor=-1
refpoint=3
</object>

</window>
</chart>