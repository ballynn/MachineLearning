%Machine Learning KNN Algortihm
%Project 1
clear
split_train = (7/10);

%% Read and Process CSV file
%Data_ingest = readtable('Mammographic Data Normalized.txt');
Data_ingest = readtable('adult_data.csv');


%Convert to booleans/normalize
Data_ingest = table2cell(Data_ingest);
%Data = cell2mat(Data_ingest);
Data = adult_data(Data_ingest);
%

%sizing of training and testing matrices
Num_datapoints = int64(max(size(Data)));
Num_attributes = int64(min(size(Data))) - 1;
size_train = fix(split_train*Num_datapoints);
size_test = Num_datapoints - size_train;

%Truth set
validation = Data;
validation(:,[1:Num_attributes]) = [];

%Training set and testing set definition
trainingset = Data(:,[1:Num_attributes]);
trainingset([1:(size_test-1)],:) = [];
truth_train = validation;
truth_train([1:(size_test-1)],:) = [];

testingset = Data(:,[1:Num_attributes]);
testingset([size_test:Num_datapoints],:) = []; 
truth_test = validation;
truth_test([size_test:Num_datapoints],:) = [];

trainingset_nominal = trainingset;
truth_train_nominal = truth_train;

%Remove redundant examples
%[trainingset, truth_train] = redundant(trainingset, truth_train);
%training_redundant = trainingset;
%truth_train_redundant = truth_train;

%Remove tomek links
[trainingset, truth_train] = tomek(trainingset, truth_train);

%training_tomek = trainingset;
%truth_train_tomek = truth_train;

%% KNN ALGORITHM IMPLEMENTATION
K = 4;
[assign,Error] = knnclassify(testingset, trainingset, truth_train, truth_test, K);

Y = ['K =', num2str(K)];
disp(Y);
X = ['The algorithm is correct ',num2str(Error*100),'% of the time'];
disp(X);

 
