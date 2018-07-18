# HexColor
android支持8位16进制色值，此扩展方法可以让iOS、android使用同一套色值。

16进制web颜色，支持#+6位和#+8位显示，字母支持大小写。

>>#+6位，色值。如：#ff4500。
  #+8位，透明度+色值，前两位表示透明度，后6位表示色值。如：#4dff4500。
  #+8位参考了android的色值表示形式，对应关系如下：
  
//百分比-开头字母
//100% FF
//95% — F2
//90% — E6
//85% — D9
//80% — CC
//75% — BF
//70% — B3
//65% — A6
//60% — 99
//55% — 8C
//50% — 80
//45% — 73
//40% — 66
//35% — 59
//30% — 4D
//25% — 40
//20% — 33
//15% — 26
//10% — 1A
//5% — 0D
//0% — 00
