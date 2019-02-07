function [S, Sval] =redundant(training, validation)
%Removes redundant examples

A = ([training validation]);
[a1, a2] = size(A);
n = 1;
S = zeros(2, min(size(training)));
Sval = zeros(2,1);

%Find one positive and one negative example from S
while (n <= a1)
    if isequal(A(n,a2),0) && isequal(S(1,:),zeros(1, min(size(training))))
        S(1,:) = A(n,[1:(a2-1)]);
        A(n,:) = [];                %remove the row placed in S
        Sval(1) = validation(n,:);
        validation(n,:) = [];
        n = n+1;
    elseif isequal(A(n,a2),1) && isequal(S(2,:),zeros(1, min(size(training))))
        S(2,:) = A(n,[1:(a2-1)]);    
        A(n,:) = [];                %remove the row placed in S
        Sval(2) = validation(n,:);
        validation(n,:) = [];
    elseif isequal(S(2,:),zeros(1, min(size(training)))) || isequal(S(1,:),zeros(1, min(size(training))))
        n = n+1;
    else
    break
    end
end

K = 1;
training = A(:,[1:(a2-1)]);
val = A(:,a2);
S1 = zeros(2, length(S));
j = 1;

for j = 1:1000000000
if j>1
    val(A_store,:) = [];
    training(A_store,:) = [];
end
[classify, Error] = knnclassify(training, S, Sval, val, K);
Q = (classify - val);
    if Q == zeros(length(Q))
        return
    else
        A_store = [];
        i = 1;
        j = j+1;
        while i <= length(Q)
            if Q(i) == 0
                i = i+1;
            elseif abs(Q(i)) == 1
                S = [S;A(i,[1:(a2-1)])];
                A_store = [A_store; i];
                Sval = [Sval;validation(i,:)];
                i = i+1;
            end
        end
    end
end
outputmatrix = S;
disp('Redundant removal is complete')
end

