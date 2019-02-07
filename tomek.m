function [training, validation] =tomek(training, validation)
j=1;
K=1;

while j<5
    %initialize all variables
    n = 1; k = 1; m = 1;
    
    if j>1
        Z = transpose(unique(sort([ii;CC])));
        training(Z,:) = [];
        validation(Z,:) = [];
    end
    
    [r,~] = size(training);
    clear dist ii CC
    dist = zeros([r, r]);
    ii = [];
    CC = [];
    
    %Compute Euclidean distance for training vs itself
    for n = 1:r
         for k = 1:r
                dist(n,k) = sqrt(sum((training(k,:) - training(n,:)).^2));
                k = k+1;
         end
    n = n + 1;
    k = 1;
    end

    %replace the diagonal with a very high number (since we want to ignore
    %items with a high number
    I=300*eye(size(dist));
    dist = dist + I;

    % 
    % Sort Euclidean Distance and assign nearest neighbor classifier
     i = 1; n =1;
     assign = zeros(r,4);
     for i = 1:r
         n = 1;
         A = sort(dist(i,:)); %take ith column of distance matrix and sort it by value
         B = A(1:K);          %find first K values
         while n<=K
             [R,C(i,n)] = ismember(B(n), dist(i,:));
             assign(i,n) = validation(C(i,n),1);
                if sum(assign(i,:))>= (K/2+0.5)
                    assign(i,n+1) = 1;
                end
             n = n+1;
         end
         i = i+1;
     end
     classify = assign(:,(K));
    
    %Determine error between classified values and validated values
    Q = (classify - validation);
    if Q == zeros(length(Q))
        j = 101;
    end
    
    %Find 
    i = 1;
    while i < length(Q)
       if abs(Q(i)) == 1
           A = sort(dist(i,:));
           [R,C] = ismember(A(1), dist(i,:));
           B = sort(dist(C,:));
           [R,D] = ismember(B(1),dist(C,:));
           if D == i
               CC = [CC; C];
               ii = [ii; i];
               i = i+1;
           end
           i = i+1;
       else
           i = i+1;
       end
    end
    j = j+1;
end
disp('Tomek calculation is complete')
end

