clear vars;
close all;
clc;

path = "C:\Users\BDK\Desktop\Nanotechnologie\FRESCO\meetdata\brianjulia\"
SpectrumFile = path+"chip14_P4_poort5 droog_20191204_1_01.mat" % fill it in
ShiftFile       =  path+"chip14_P4_poort5 water_20191211_beker1_1_result.mat" % fill it in

% spectra
if true
% load ring data
    load(SpectrumFile);

    % extract power and wavelength
    Chn1      	= ISW_measurements.chn_1;
    Chn2      	= ISW_measurements.chn_2;
    l1          = ISW_measurements.settings.scan.start_nm;
    l2          = ISW_measurements.settings.scan.stop_nm;
    dl          = ISW_measurements.settings.scan.step_pm/1000;
    lambda      = l1:dl:l2;  

    % plot only the spectrum halfway the measurement session
    NrSpectra   = size(Chn1,1);
    PlotNr      = round(NrSpectra/2);

    % plot ring data
    figure();
    hold on;   
    save('Chn1.txt', 'Chn1', '-ASCII','-append');
    save('lambda.txt', 'lambda', '-ASCII','-append');
    plot(lambda,Chn1(PlotNr,:),'r');
    plot(lambda,Chn2(PlotNr,:),'b');
    grid on;
end
    
% shift
if true
    j = 1; % sensor number
    load(ShiftFile);    
    t 	= ISW_result.time;
    figure();         
    plot(t,ISW_result.sensor(:,j),'r');
    grid on;
end
    


