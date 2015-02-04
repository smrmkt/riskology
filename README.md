# riskology

### About
- R implementation of risk simulation in "[Waltzing with Bears](http://www.amazon.com/Waltzing-With-Bears-Managing-Software/dp/0932633609)"

### Usage
- set parameter in Conf.R suitable for your project
- execute riskology.R
- result will be shown in console and delay histgram saved in ```img/histgram_of_delays.png```

### Execute in commandline

```
git clone https://github.com/smrmkt/riskology.git
cd riskology
R --vanilla --slave < riskology.R
```