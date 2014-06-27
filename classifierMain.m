% =========================== 1-Training Phase ================================ %

X = load('preProcessedTrainDATA.txt');
y = load('preProcessedLabelsOfTrainDATA.txt');
  
%save malwareTrain.mat X y 
%load('malwareTrain.mat');

fprintf('\nTraining Linear SVM (Malware Classification)\n')
fprintf('(this may take 1 to 2 minutes) ...\n')

C = 0.1;
model = svmTrain(X, y, C, @linearKernel);

pause;

% ============================================================================ %

% ========================== 2-Prediction Phase ============================== %


fprintf('(1 indicates Malicious, 0 indicates Benign)\n\n');


predictMatrix = load('maliciousPredict.txt');

fid = fopen('results.txt', 'a+');

for i = [1:498]
     tempVector = predictMatrix(i,:);
	 transposeTempVector = tempVector';
	 p = svmPredict(model, transposeTempVector);
	 fprintf(fid, '%d\n', p);
%	 fprintf('%d\n',p);
end

fclose(fid);

% ============================================================================ %

