%Machine Learning KNN Algortihm
%Project 1

split_train = (1/10);

%% Read and Process CSV file
Data_ingest = readtable('adult_data.csv');

%Convert Booleans and  
Data_ingest = table2cell(Data_ingest);
Data = adult_data(Data_ingest);

%sizing of training and testing matrices
Num_datapoints = int64(max(size(Data)));
Num_attributes = int64(min(size(Data))) - 1;
size_train = fix(split_train*Num_datapoints);
size_test = Num_datapoints - size_train;

%Truth set
validation = Data;
validation(:,[1:Num_attributes]) = [];

%training set and testing set definition
trainingset = Data(:,[1:Num_attributes]);
trainingset([1:(size_test-1)],:) = [];
truth_train = validation;
truth_train([1:(size_test-1)],:) = [];

testingset = Data(:,[1:Num_attributes]);
testingset([size_test:Num_datapoints],:) = []; 
truth_test = validation;
truth_test([size_test:Num_datapoints],:) = [];


%% KNN ALGORITHM IMPLEMENTATION
%Compute Euclidean distance
 n = 1; k = 1;
 dist = zeros([max(size(testingset)), max(size(trainingset))]);
   for n = 1:max(size(testingset))
        for k = 1:max(size(trainingset))
            dist(n,k) = sqrt(sum((trainingset(k,:) - testingset(n,:)).^2));
            k = k+1;
        end
    disp(n)
    n = n + 1;
    k = 1;
    end
% 
% Sort Euclidean Distance and assign truth value
 K = 1;
 i = 1; n =1;
 assign = zeros(max(size(truth_test)),4);
 for i = [1:max(size(truth_test))]
     n = 1;
     A = sort(dist(i,:)); %take ith column of distance matrix and sort it by value
     B = A(1:K);          %find first K values
     while n<=K
     [R,C(i,n)] = ismember(B(n), dist(i,:));
     assign(i,n) = truth_train(C(i,n),1);
        if sum(assign(i,:))>= (K/2+0.5)
         assign(i,n+1) = 1;
        end
     n = n+1;
     end
     i = i+1;
 end
 
 final = assign(:,(K+1)); 
 Error_set = final - truth_test;
 Error = sum(abs(final - truth_test)*(1/0.0113));
 Error_final = (max(size(truth_test) - Error)/max(size(truth_test)));
 Error_percent = 100*Error_final;
 X = ['The algorithm is correct ',num2str(Error_percent),'% of the time'];
 disp(X);
 
 
 
