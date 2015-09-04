---
layout: post
title:  "炉石传说应该开哪个包"
date:   2015-09-04 23:34:01
categories: game
tages: game hearthstone
---

很多游戏都不玩了，觉的收益太低。不过炉石传说偶尔还会玩一玩，花点钱直接买卡包，然后就可以探索组卡的乐趣。不是很花时间:smile:。

前前后后也买了不少卡包了，因此目前三种卡包，开哪个最合算就成了问题。 经典包 ， 地精包， 冠军包。

那么首先是开一包的收益如何计算。我认为可以用实际获得的粉来计算。如果开出了自己没有的卡牌，那就是获得了对应卡牌合成价格的粉，如果开出了重复的那就是获得了，分解价值的粉。

+ 然后一张卡的类型概率如下：

```
普通 = 70%
稀有 = 21.4%
史诗 = 4.28%
传说 = 1.08%

金色普通 = 1.47%
金色稀有 = 1.37%
金色史诗 = 0.308%
金色传说 = 0.111%
```

+ 一张卡合成和分解的粉如下：

```
普通牌(白色)——分解得到5点奥术之尘/合成需要40点奥术之尘
稀有牌(蓝色)——分解得到20点奥术之尘/合成需要100点奥术之尘
史诗牌(紫色)——分解得到100点奥术之尘/合成需要400点奥术之尘
传说牌(橙色)——分解得到400点奥术之尘/合成需要1600点奥术之尘

普通金色牌——分解得到50点奥术之尘/合成需要400点奥术之尘
稀有金色牌——分解得到100点奥术之尘/合成需要800点奥术之尘
史诗金色牌——分解得到400点奥术之尘/合成需要1600点奥术之尘
传说金色牌——分解得到1600点奥术之尘/合成需要3200点奥术之尘
```

因此我们假设 对于经典卡包有普通 稀有 史诗 传说 以及金色卡牌总数为:
> total_normal
> total_rare
> total_epic
> total_legend
> total_gold_normal
> total_gold_rare
> total_gold_epic
> total_gold_legend

假设我们拥有 普通 稀有 史诗 传说 以及金色卡牌的数量为：
> current_normal
> current_rare
> current_epic
> current_legend
> current_gold_normal
> current_gold_rare
> current_gold_epic
> current_gold_legend

那么我们一包的期望收益就是:

```
70% * (current_normal / total_normal) * 5  + 70% * (1 - current_normal / total_normal) * 40 +
21.4% * (current_rare / total_rare) * 20 + 21.4% * (1 - current_rare / total_rare) * 100 +
4.28% * (current_epic / total_epic) * 100 + 4.28% * (current_epic / total_epic) * 400 +
1.08% * (current_legend / total_legend) * 400 + 1.08% * (current_legend / total_legend) * 1600 +
1.47% * (current_gold_normal / total_gold_normal) * 50 + 1.47% * (current_gold_normal / total_gold_normal) * 400 +
1.37% * (current_gold_rare / total_gold_rare) * 100 + 1.37% * (current_gold_rare / total_gold_rare) * 800 +
0.308% * (current_gold_epic / total_gold_epic) * 400 + 0.308% * (current_gold_epic / total_gold_epic) * 1600 +
0.111% * (current_gold_legend / total_gold_legend) * 1600 + 0.111% * (current_gold_legend / total_gold_legend) * 3200
```

最后在附上目前三套卡的数量：

```
经典包
普通: 94张
稀有: 81张
史诗: 37张
传说: 33张

地精包
普通：40张
稀有：37张
史诗：26张
传说：20张

冠军包
普通：49张
稀有：36张
史诗：27张
传说：20张
```

让我们见计算一下第一次开包的收益：

```
70%  * 40 + 21.4% * 100 + 4.28% * 400 + 1.08% * 1600 + 1.47% * 400 + 1.37% * 800 + 0.308% * 1600 + 0.111% * 3200 = 109.12
```

让我们算一下普通蓝白卡齐全史诗和传说一张都没有以后开一包的收益吧：

```
70%  * 5 + 21.4% * 20 + 4.28% * 400 + 1.08% * 1600 + 1.47% * 400 + 1.37% * 800 + 0.308% * 1600 + 0.111% * 3200 = 67.5
```

最后算一下全卡后的收益：

```
70%  * 5 + 21.4% * 20 + 4.28% * 100 + 1.08% * 400 + 1.47% * 50 + 1.37% * 100 + 0.308% * 400 + 0.111% * 1600 = 21.493
```

也就是说最开始开包的平均收益是一张稀有，蓝白卡齐全以后收益是一张半的普通。全卡后的收益只有半张普通。

换一种眼光来看，第一次开包平均16包能获得等同于一张普通传说价值的收益。
到了中期需要24包换取等同于传说的卡。

到了全卡则要接近80包。。。。。。:cry:



