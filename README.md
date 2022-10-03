# rom-4.0
**QNLM测试:**
`模式设置Lm=1998 & Mm=1521 & N=65 & NAT=2 & NtileI= 40 & NtileJ=30  & NTIMES=2700 & DT=60 &
NHIS=180 & NAVG=180 & NDIA=180 & NDEF(HIS&AVG&DIA)=180，pio_iotasks=45，pio_stride=20，pio_rearr=1(box) ，编译时指定#define PIO_LIB。`
```
1. 当设置inp_lib=1 & out_lib=1时（串行输入输出），io占比为54.6%，总时间为92分钟；
2. 当设置inp_lib=2 & out_lib=2时（scorpio1.1.2），io占比为29.9%，总时间为54分钟；
3. 当设置inp_lib=2 & out_lib=2时（scorpio1.3.2），io占比为13.2%，总时间为47分钟；
4. 在设置pio的基础上（scorpio1.1.2），lfs setstripe -c 16 Output_parallel，io占比为9.6%，总时间为39分钟；
5. 在设置pio的基础上（scorpio1.3.2），lfs setstripe -c 16 Output_parallel，io占比为4.5%，总时间为37分钟.
```
