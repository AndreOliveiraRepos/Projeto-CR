function net = GUI_createNN( layersN, unitsN, transfFnc1, transfFnc2, trFcn,epochsN, divFnc,outputFnc,trainSeg,valSeg,testSeg)
%GUI_CREATENN Summary of this function goes here
%   Detailed explanation goes here
if(layersN == 1)
 net = feedforwardnet(unitsN);
else
    net = feedforwardnet([unitsN,unitsN]);
end
 net.trainFcn = trFcn;
 net.layers{1}.transferFcn = transfFnc1;
if(layersN == 1)
     net.layers{2}.transferFcn = outputFnc;
else
    net.layers{2}.transferFcn = transfFnc2;
    net.layers{3}.transferFcn = outputFnc;
end

net.divideParam.trainRatio = trainSeg;
net.divideParam.valRatio = valSeg;
net.divideParam.testRatio = testSeg;
 
 net.trainParam.epochs = epochsN;

 net.divideFcn = divFnc;


end

