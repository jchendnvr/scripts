# Here are some common troubleshooting utlities. 
# Author: Jesse Chenhalls
# Created Date: 20230731

# CPU and MEMORY

## top 
- Top is a part of procps-ng. 
- You can add fields with f
- You can save your configuration with W
	- This saves to ~/.config/procps/toprc by default
- Top can run in batch mode with -b and -n to specify the iterations. Specify -d to set the delay to iterations. 
	- This would run for 4 seconds with 4 second delay. 
```sh
top -bn 4 -d 4 > output.txt
```
- E will set the memory scale, eg KB, MB, GB, etc
- i    doesn't display items that haven't used CPU since last update
- U  filter the specified user. 
- p  monitor a specified PID 
- = can exit PID specific monitoring
- z can display colors, Z to edit the colors 
- R  Renice, You can renice a process with R. Positive values make it lower priority, negative values make it higher priority. 
- C displays the number of lines total and what lines you are on. 
- t and m toggle different CPU and Memory displays
- c   toggles between command name and path
- V  shows process relationships in a "forest" view. 
- n  can be used to enter the number of tasks to display
- You can filter by the command name with capital O. Eg:  Command=top

```sh
wa : time waiting for I/O completion
hi : time spent servicing hardware interrupts
si : time spent servicing software interrupts
st : time stolen from this vm by the hypervisor
```

- You can supress zeros to clean up the display by pressing 0 

Top has 3 windows
1. Default
2. Jobs
3. Memory
4. User


## htop	
similar to top, but in color. 

## bashtop
Like top, but shows network traffic as well 

## bpytop
Bashtop written in python

## btop 
Bashtop written in C++. Has more options than bashtop, bpytop.

## atop
Like top with more details, has views like d disk and n network

## glances
Another system monitor

## saidar
Saidar will display infromation about the processes and system. 
- add color with -c
```
saidar -c 
``` 

## hwloc
Shows CPU and Drive topology
Run 
```
lstopo --of ascii 
```

## vmstat 
- Will display virtual memory stats
```sh
vmstat 4 2

 vmstat [options] [delay [count]] 
Options: 
 -a, --active           active/inactive memory 
 -f, --forks            number of forks since boot 
 -m, --slabs            slabinfo 
 -n, --one-header       do not redisplay header 
 -s, --stats            event counter statistics 
 -d, --disk             disk statistics 
 -D, --disk-sum         summarize disk statistics 
 -p, --partition <dev>  partition specific statistics 
 -S, --unit <char>      define display unit 
 -w, --wide             wide output 
 -t, --timestamp        show timestamp
```

# Disk

## iostat
- You can run iostat once with no argument. 
- You can run it continuously at a set interval with a single number argument. 
- You can run it at set intervals for a given number of iterations with two arguments. 
- Part of the sysstat package
```sh
iostat
iostat 2    #2 second intervals
iostat 2 4   # 2 second intervals, 4 intervals before quiting. 
```

## iotop 
- Displays total in and out and well as disk speed

## ioping
Measure disk latency
```
sudo ioping /dev/sda3
```


## sar
- Part of sysstat
- You can pass an interval to display information or create report
```sh
# in the below 2 is the interval and 5 is the count of intervals to collect. 
sar -o report 2 5 >/dev/null 2>&1 &
```

## dstat
- View network sand disk stats


## statgrab
- will pull 700 stat lines by default
- you can specify the stat with STATNAME and .
```sh
statgrab net.
statgrab disk.
```


# Network

## Nethogs
Nethogs will list programs actively using network traffic and their speed. 
- r    sort by received
- s     sort by sent
- m    switch between KB, MB, GB, Bytes
- l    display the command
- run with -t for tracemode output
- C    tcp and udp
- c number    the number of captures
- d the delay of the captures
- a monitors all devices including stopped and loopback

## lsof -i
lsof -i will display listening files. 

## nmon
- Can display different types of information. when you first launch it tells you to toggle things on and off with the corresponding key.
- h displays more options. 
- You can turn things on and off. 

## nload
Network load displays quick up and down of network traffic for each interface. 

## net-tools
```
This package includes the important tools for controlling the network subsystem of the Linux kernel.  This includes arp, ifconfig, netstat, rarp, nameif and route.  Additionally, this package contains utilities relating to particular network hardware types (plipconfig, slattach,  mii-tool) and advanced aspects of IP configuration (iptunnel, ipmaddr)
```



# Install above
```sh
apt install htop bashtop bpytop btop hwloc atop nethogs nmon glances net-tools nload iotop ioping sysstat saidar statgrab dstat
```

# Test above
- Do these one at a time
```
top
htop
bashtop
bpytop
btop
atop
glances
saidar -c 
lstopo --of ascii
vmstat 4 2
iostat 2 4
iotop
sudo ioping /dev/sda3
sar 2 -d
dstat
statgrab
sudo nethogs 
sudo lsof -i
nmon
nload
netstat --tulpn
```