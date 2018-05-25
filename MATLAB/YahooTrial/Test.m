clear all
close all
addpath('Data','Classes','Functions')

c='AAPL';
n=350;

C=Company(c,n);
C.QPlot
