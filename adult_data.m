function [output_matrix] = adult_data(data)
%Change data to numbers

%% Work class: change to numeric
Data_2 = data(:,[2]);
j = 1;
for j = 1:length(Data_2)
    if isequal(Data_2(j),{'Private'})
        Data_2{j} = 9;
        j = j+1;
    elseif isequal(Data_2(j),{'Self-emp-not-inc'})
        Data_2{j} = 3;
        j = j+1;
    elseif isequal(Data_2(j),{'?'})
        Data_2{j} = 1;
        j = j+1;
    elseif isequal(Data_2(j),{'Without-pay'})
        Data_2{j} = 4;
        j = j+1;
    elseif isequal(Data_2(j),{'Never-worked'})
        Data_2{j} = 2;
        j = j+1;
    elseif isequal(Data_2(j),{'Local-gov'})
        Data_2{j} = 6;
        j = j+1;
    elseif isequal(Data_2(j),{'State-gov'})
        Data_2{j} = 7;
        j = j+1;
    elseif isequal(Data_2(j),{'Federal-gov'})
        Data_2{j} = 8;
        j = j+1;
    else
        Data_2{j} = 0;
        j = j+1; 
    end
end
data(:,[2]) = Data_2;

%% Education change to numeric
Data_4 = data(:,[4]);
j = 1;
for j = 1:length(Data_4)
    if isequal(Data_4(j),{'Preschool'})
        Data_4{j} = 1;
        j = j+1;
    elseif isequal(Data_4(j),{'1st-4th'})
        Data_4{j} = 2;
        j = j+1;
    elseif isequal(Data_4(j),{'7th-8th'})
        Data_4{j} = 3;
        j = j+1;
    elseif isequal(Data_4(j),{'9th'})
        Data_4{j} = 4;
        j = j+1;
   elseif isequal(Data_4(j),{'10th'})
        Data_4{j} = 5;
        j = j+1;
   elseif isequal(Data_4(j),{'11th'})
        Data_4{j} = 6;
        j = j+1;
   elseif isequal(Data_4(j),{'12th'})
        Data_4{j} = 7;
        j = j+1;
   elseif isequal(Data_4(j),{'HS-grad'})
        Data_4{j} = 8;
        j = j+1;
   elseif isequal(Data_4(j),{'Some-college'})
        Data_4{j} = 9;
        j = j+1;
   elseif isequal(Data_4(j),{'Assoc-voc'})
        Data_4{j} = 10;
        j = j+1;
   elseif isequal(Data_4(j),{'Prof-school'})
        Data_4{j} = 11;
        j = j+1;
   elseif isequal(Data_4(j),{'Assoc-acdm'})
        Data_4{j} = 12;
        j = j+1;
   elseif isequal(Data_4(j),{'Bachelors'})
        Data_4{j} = 13;
        j = j+1;
   elseif isequal(Data_4(j),{'Masters'})
        Data_4{j} = 13;
        j = j+1;
   elseif isequal(Data_4(j),{'Doctorate'})
        Data_4{j} = 13;
        j = j+1;
    else
        Data_4{j} = 0;
        j = j+1; 
    end
end
data(:,[4]) = Data_4;

%%
Data_6 = data(:,[6]);
j = 1;
for j = 1:length(Data_6)
    if isequal(Data_6(j),{'Married-civ-spouse'})
        Data_6{j} = 1;
        j = j+1;
    elseif isequal(Data_6(j),{'Divorced'})
        Data_6{j} = 2;
        j = j+1;
    elseif isequal(Data_6(j),{'Separated'})
        Data_6{j} = 3;
        j = j+1;
    elseif isequal(Data_6(j),{'Widowed'})
        Data_6{j} = 4;
        j = j+1;
    elseif isequal(Data_6(j),{'Married-spouse-absent'})
        Data_6{j} = 5;
        j = j+1;
    elseif isequal(Data_6(j),{'Married-AF-spouse'})
        Data_6{j} = 6;
        j = j+1;
    elseif isequal(Data_6(j),{'Never-married'})
        Data_6{j} = 7;
        j = j+1;
    else
        Data_6{j} = 0;
        j = j+1;
    end
end
data(:,[6]) = Data_6;

%%
Data_7 = data(:,[7]);
for j = 1:length(Data_7)
    if isequal(Data_7(j),{'Tech-support'})
        Data_7{j} = 1;
        j = j+1;
    elseif isequal(Data_7(j),{'Craft-repair'})
        Data_7{j} = 2;
        j = j+1;
    elseif isequal(Data_7(j),{'Other-service'})
        Data_7{j} = 3;
        j = j+1;       
    elseif isequal(Data_7(j),{'Sales'})
        Data_7{j} = 4;
        j = j+1;       
    elseif isequal(Data_7(j),{'Exec-managerial'})
        Data_7{j} = 5;
        j = j+1;
    elseif isequal(Data_7(j),{'Prof-specialty'})
        Data_7{j} = 6;
        j = j+1; 
    elseif isequal(Data_7(j),{'Handlers-cleaners'})
        Data_7{j} = 7;
        j = j+1; 
    elseif isequal(Data_7(j),{'Machine-op-inspct'})
        Data_7{j} = 8;
        j = j+1; 
     elseif isequal(Data_7(j),{'Adm-clerical'})
        Data_7{j} = 9;
        j = j+1; 
     elseif isequal(Data_7(j),{'Farming-fishing'})
        Data_7{j} = 10;
        j = j+1; 
      elseif isequal(Data_7(j),{'Transport-moving'})
        Data_7{j} = 11;
        j = j+1; 
      elseif isequal(Data_7(j),{'Priv-house-serv'})
        Data_7{j} = 12;
        j = j+1;
      elseif isequal(Data_7(j),{'Protective-serv'})
        Data_7{j} = 13;
        j = j+1;
      elseif isequal(Data_7(j),{'Armed-Forces'})
        Data_7{j} = 14;
        j = j+1;
    else
        Data_7{j} = 0;
        j = j+1;
    end
end
data(:,[7]) = Data_7;

%%
Data_8 = data(:,[8]);
for j = 1:length(Data_8)
    if isequal(Data_8(j),{'Wife'})
        Data_8{j} = 1;
        j = j+1;
    elseif isequal(Data_8(j),{'Own-child'})
        Data_8{j} = 2;
        j = j+1;
   elseif isequal(Data_8(j),{'Husband'})
        Data_8{j} = 3;
        j = j+1;
   elseif isequal(Data_8(j),{'Not-in-family'})
        Data_8{j} = 4;
        j = j+1;
   elseif isequal(Data_8(j),{'Other-relative'})
        Data_8{j} = 5;
        j = j+1;
   elseif isequal(Data_8(j),{'Unmarried'})
        Data_8{j} = 6;
        j = j+1;
    else
        Data_8{j} = 0;
        j = j+1;
    end
end
data(:,[8]) = Data_8;

%%
Data_9 = data(:,[9]);
for j = 1:length(Data_9)
    if isequal(Data_9(j),{'White'})
        Data_9{j} = 1;
        j = j+1;
    elseif isequal(Data_9(j),{'Asian-Pac-Islander'})
        Data_9{j} = 2;
        j = j+1;
    elseif isequal(Data_9(j),{'Amer-Indian-Eskimo'})
        Data_9{j} = 3;
        j = j+1;
     elseif isequal(Data_9(j),{'Other'})
        Data_9{j} = 4;
        j = j+1;
    elseif isequal(Data_9(j),{'Black'})
        Data_9{j} = 5;
        j = j+1;
    else
        Data_9{j} = 0;
        j = j+1;
    end
end
data(:,[9]) = Data_9;

%%
Data_10 = data(:,[10]);
for j = 1:length(Data_10)
    if isequal(Data_10(j),{'Female'})
        Data_10{j} = 1;
        j = j+1;
    elseif isequal(Data_10(j),{'Male'})
        Data_10{j} = 2;
        j = j+1;
    else
        Data_10{j} = 0;
        j = j+1;
    end
end
data(:,[10]) = Data_10;


%% NEED TO EDIT LATER
Data_14 = data(:,[14]);
for j = 1:length(Data_14)
    if isequal(Data_14(j),{'United-States'})
        Data_14{j} = 1;
        j = j+1;
    else
        Data_14{j} = 0;
        j = j+1;
    end
end
data(:,[14]) = Data_14;

%% BOOLEAN
Data_15 = data(:,[15]);
for j = 1:length(Data_15)
    if isequal(Data_15(j),{'>50K'})
        Data_15{j} = 1;
        j = j+1;
    else
        Data_15{j} = 0;
        j = j+1;
    end
end
data(:,[15]) = Data_15;

output_matrix_unfixed = cell2mat(data);
output_matrix = normc(output_matrix_unfixed(:,[1:14]));
end



