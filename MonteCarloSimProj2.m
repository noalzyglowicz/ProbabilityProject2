clc, clear
%--------------------------Random Variable X Info--------------------------
tau = 57;
a = 1 / tau;
EX = (1/a)*sqrt(pi/2)
VarX = (4-pi)/(2*(a^2))
stdX = sqrt(VarX)

%--------------------------Monte Carlo Sim---------------------------------
nums = 1:1:229900;
n_values = [10, 30, 50, 100, 150, 250, 500, 1000];
Mean_values = zeros([1, 880]);
randNums = RandNumGen(nums); %Primary array of random numbers to chose from

randNums(51)
randNums(52)
randNums(53)

index1 = 1; %indexes for accessing random numbers and spot in final calling times array
indexM = 1;
distance = 0; %temporary variable for distance dropped from target T
hundo_times = zeros([1, 110]);

for n = n_values%for every n
    for l = hundo_times %run one hundo ten times
        for l2 = zeros([1, n]) %then run the length of n based on changed vector size
            distance = distance + RandVarGen(randNums(1, index1));
            index1 = index1 + 1;
        end
    Mean_values(1, indexM) = distance/n;
    indexM = indexM + 1;
    distance = 0;
    end
end
Mean_values;
%--------------------------4.2 Plotting------------------------------------
%{
x = [ones([1, 110])*10 ones([1, 110])*30 ones([1, 110])*50 ones([1, 110])*100 ones([1, 110])*150 ones([1, 110])*250, ones([1, 110])*500 ones([1, 110])*1000];
plot(x, Mean_values, '.k','MarkerSize',10)
x1 = [0, 1000];
y1 = [(1/a)*sqrt(pi/2), (1/a)*sqrt(pi/2)];
hold on
plot(x1, y1)
xlabel('Sample Size n')
ylabel('\mu_x')
title('Monte Carlo Simulated Mean Values vs. Sample Size n')
legend_strings{1} = 'Sample Mean Estimates';
legend_strings{2} = 'E(x) = \mu_x';
legend(legend_strings);
%}
%---------------------------5.2 Plotting-----------------------------------
Means_10 = Mean_values(1:110); %means for n = 10
Means_30 = Mean_values(111:220); %means for n = 30
Means_50 = Mean_values(221:330); %means for n = 50
Means_100 = Mean_values(331:440); %means for n = 100
Means_150 = Mean_values(441:550); %means for n = 150
Means_250 = Mean_values(551:660); %means for n = 250
Means_500 = Mean_values(661:770); %means for n = 500
Means_1000 = Mean_values(771:880); %means for n = 1000%

Fn =zeros([8, 7]);
%--------------------------------N = 10------------------------------------
z_k = ((Means_10 - EX) / ((stdX)/sqrt(10))); %change numbers for n
z_lt_j1 = 0; %z <= -1.4
z_lt_j2 = 0; %z <= -1.0
z_lt_j3 = 0; %z <= -0.5
z_lt_j4 = 0; %z <= 0
z_lt_j5 = 0; %z <= 0.5
z_lt_j6 = 0; %z <= 1.0
z_lt_j7 = 0; %z <= 1.4
for z = z_k
    if(z <= -1.4)
        z_lt_j1 = z_lt_j1 + 1;
    end
    if(z <= -1.0)
        z_lt_j2 = z_lt_j2 + 1;
    end
    if(z <= -0.5)
        z_lt_j3 = z_lt_j3 + 1;
    end
    if(z <= 0)
        z_lt_j4 = z_lt_j4 + 1;
    end
    if(z <= 0.5)
        z_lt_j5 = z_lt_j5 + 1;
    end
    if(z <= 1.0)
        z_lt_j6 = z_lt_j6 + 1;
    end
    if(z <= 1.4)
        z_lt_j7 = z_lt_j7 + 1;
    end
end
z_lt_j1 = z_lt_j1/110;
z_lt_j2 = z_lt_j2/110;
z_lt_j3 = z_lt_j3/110;
z_lt_j4 = z_lt_j4/110;
z_lt_j5 = z_lt_j5/110;
z_lt_j6 = z_lt_j6/110;
z_lt_j7 = z_lt_j7/110;
z_results = [z_lt_j1, z_lt_j2, z_lt_j3, z_lt_j4, z_lt_j5, z_lt_j6, z_lt_j7];
Fn(1, 1:7) = z_results;
%--------------------------------N = 30------------------------------------
z_k = ((Means_30 - EX) / ((stdX)/sqrt(30))); %change numbers for n
z_lt_j1 = 0; %z <= -1.4
z_lt_j2 = 0; %z <= -1.0
z_lt_j3 = 0; %z <= -0.5
z_lt_j4 = 0; %z <= 0
z_lt_j5 = 0; %z <= 0.5
z_lt_j6 = 0; %z <= 1.0
z_lt_j7 = 0; %z <= 1.4
for z = z_k
    if(z <= -1.4)
        z_lt_j1 = z_lt_j1 + 1;
    end
    if(z <= -1.0)
        z_lt_j2 = z_lt_j2 + 1;
    end
    if(z <= -0.5)
        z_lt_j3 = z_lt_j3 + 1;
    end
    if(z <= 0)
        z_lt_j4 = z_lt_j4 + 1;
    end
    if(z <= 0.5)
        z_lt_j5 = z_lt_j5 + 1;
    end
    if(z <= 1.0)
        z_lt_j6 = z_lt_j6 + 1;
    end
    if(z <= 1.4)
        z_lt_j7 = z_lt_j7 + 1;
    end
end
z_lt_j1 = z_lt_j1/110;
z_lt_j2 = z_lt_j2/110;
z_lt_j3 = z_lt_j3/110;
z_lt_j4 = z_lt_j4/110;
z_lt_j5 = z_lt_j5/110;
z_lt_j6 = z_lt_j6/110;
z_lt_j7 = z_lt_j7/110;
z_results = [z_lt_j1, z_lt_j2, z_lt_j3, z_lt_j4, z_lt_j5, z_lt_j6, z_lt_j7];
Fn(2, 1:7) = z_results;
%--------------------------------N = 50------------------------------------
z_k = ((Means_50 - EX) / ((stdX)/sqrt(50))); %change numbers for n
z_lt_j1 = 0; %z <= -1.4
z_lt_j2 = 0; %z <= -1.0
z_lt_j3 = 0; %z <= -0.5
z_lt_j4 = 0; %z <= 0
z_lt_j5 = 0; %z <= 0.5
z_lt_j6 = 0; %z <= 1.0
z_lt_j7 = 0; %z <= 1.4
for z = z_k
    if(z <= -1.4)
        z_lt_j1 = z_lt_j1 + 1;
    end
    if(z <= -1.0)
        z_lt_j2 = z_lt_j2 + 1;
    end
    if(z <= -0.5)
        z_lt_j3 = z_lt_j3 + 1;
    end
    if(z <= 0)
        z_lt_j4 = z_lt_j4 + 1;
    end
    if(z <= 0.5)
        z_lt_j5 = z_lt_j5 + 1;
    end
    if(z <= 1.0)
        z_lt_j6 = z_lt_j6 + 1;
    end
    if(z <= 1.4)
        z_lt_j7 = z_lt_j7 + 1;
    end
end
z_lt_j1 = z_lt_j1/110;
z_lt_j2 = z_lt_j2/110;
z_lt_j3 = z_lt_j3/110;
z_lt_j4 = z_lt_j4/110;
z_lt_j5 = z_lt_j5/110;
z_lt_j6 = z_lt_j6/110;
z_lt_j7 = z_lt_j7/110;
z_results = [z_lt_j1, z_lt_j2, z_lt_j3, z_lt_j4, z_lt_j5, z_lt_j6, z_lt_j7];
Fn(3, 1:7) = z_results;
%--------------------------------N = 100------------------------------------
z_k = ((Means_100 - EX) / ((stdX)/sqrt(100))); %change numbers for n
z_lt_j1 = 0; %z <= -1.4
z_lt_j2 = 0; %z <= -1.0
z_lt_j3 = 0; %z <= -0.5
z_lt_j4 = 0; %z <= 0
z_lt_j5 = 0; %z <= 0.5
z_lt_j6 = 0; %z <= 1.0
z_lt_j7 = 0; %z <= 1.4
for z = z_k
    if(z <= -1.4)
        z_lt_j1 = z_lt_j1 + 1;
    end
    if(z <= -1.0)
        z_lt_j2 = z_lt_j2 + 1;
    end
    if(z <= -0.5)
        z_lt_j3 = z_lt_j3 + 1;
    end
    if(z <= 0)
        z_lt_j4 = z_lt_j4 + 1;
    end
    if(z <= 0.5)
        z_lt_j5 = z_lt_j5 + 1;
    end
    if(z <= 1.0)
        z_lt_j6 = z_lt_j6 + 1;
    end
    if(z <= 1.4)
        z_lt_j7 = z_lt_j7 + 1;
    end
end
z_lt_j1 = z_lt_j1/110;
z_lt_j2 = z_lt_j2/110;
z_lt_j3 = z_lt_j3/110;
z_lt_j4 = z_lt_j4/110;
z_lt_j5 = z_lt_j5/110;
z_lt_j6 = z_lt_j6/110;
z_lt_j7 = z_lt_j7/110;
z_results = [z_lt_j1, z_lt_j2, z_lt_j3, z_lt_j4, z_lt_j5, z_lt_j6, z_lt_j7];
Fn(4, 1:7) = z_results;
%--------------------------------N = 150-----------------------------------
z_k = ((Means_150 - EX) / ((stdX)/sqrt(150))); %change numbers for n
z_lt_j1 = 0; %z <= -1.4
z_lt_j2 = 0; %z <= -1.0
z_lt_j3 = 0; %z <= -0.5
z_lt_j4 = 0; %z <= 0
z_lt_j5 = 0; %z <= 0.5
z_lt_j6 = 0; %z <= 1.0
z_lt_j7 = 0; %z <= 1.4
for z = z_k
    if(z <= -1.4)
        z_lt_j1 = z_lt_j1 + 1;
    end
    if(z <= -1.0)
        z_lt_j2 = z_lt_j2 + 1;
    end
    if(z <= -0.5)
        z_lt_j3 = z_lt_j3 + 1;
    end
    if(z <= 0)
        z_lt_j4 = z_lt_j4 + 1;
    end
    if(z <= 0.5)
        z_lt_j5 = z_lt_j5 + 1;
    end
    if(z <= 1.0)
        z_lt_j6 = z_lt_j6 + 1;
    end
    if(z <= 1.4)
        z_lt_j7 = z_lt_j7 + 1;
    end
end
z_lt_j1 = z_lt_j1/110;
z_lt_j2 = z_lt_j2/110;
z_lt_j3 = z_lt_j3/110;
z_lt_j4 = z_lt_j4/110;
z_lt_j5 = z_lt_j5/110;
z_lt_j6 = z_lt_j6/110;
z_lt_j7 = z_lt_j7/110;
z_results = [z_lt_j1, z_lt_j2, z_lt_j3, z_lt_j4, z_lt_j5, z_lt_j6, z_lt_j7];
Fn(5, 1:7) = z_results;
%--------------------------------N = 250-----------------------------------
z_k = ((Means_250 - EX) / ((stdX)/sqrt(250))); %change numbers for n
z_lt_j1 = 0; %z <= -1.4
z_lt_j2 = 0; %z <= -1.0
z_lt_j3 = 0; %z <= -0.5
z_lt_j4 = 0; %z <= 0
z_lt_j5 = 0; %z <= 0.5
z_lt_j6 = 0; %z <= 1.0
z_lt_j7 = 0; %z <= 1.4
for z = z_k
    if(z <= -1.4)
        z_lt_j1 = z_lt_j1 + 1;
    end
    if(z <= -1.0)
        z_lt_j2 = z_lt_j2 + 1;
    end
    if(z <= -0.5)
        z_lt_j3 = z_lt_j3 + 1;
    end
    if(z <= 0)
        z_lt_j4 = z_lt_j4 + 1;
    end
    if(z <= 0.5)
        z_lt_j5 = z_lt_j5 + 1;
    end
    if(z <= 1.0)
        z_lt_j6 = z_lt_j6 + 1;
    end
    if(z <= 1.4)
        z_lt_j7 = z_lt_j7 + 1;
    end
end
z_lt_j1 = z_lt_j1/110;
z_lt_j2 = z_lt_j2/110;
z_lt_j3 = z_lt_j3/110;
z_lt_j4 = z_lt_j4/110;
z_lt_j5 = z_lt_j5/110;
z_lt_j6 = z_lt_j6/110;
z_lt_j7 = z_lt_j7/110;
z_results = [z_lt_j1, z_lt_j2, z_lt_j3, z_lt_j4, z_lt_j5, z_lt_j6, z_lt_j7];
Fn(6, 1:7) = z_results;
%--------------------------------N = 500-----------------------------------
z_k = ((Means_500 - EX) / ((stdX)/sqrt(500))); %change numbers for n
z_lt_j1 = 0; %z <= -1.4
z_lt_j2 = 0; %z <= -1.0
z_lt_j3 = 0; %z <= -0.5
z_lt_j4 = 0; %z <= 0
z_lt_j5 = 0; %z <= 0.5
z_lt_j6 = 0; %z <= 1.0
z_lt_j7 = 0; %z <= 1.4
for z = z_k
    if(z <= -1.4)
        z_lt_j1 = z_lt_j1 + 1;
    end
    if(z <= -1.0)
        z_lt_j2 = z_lt_j2 + 1;
    end
    if(z <= -0.5)
        z_lt_j3 = z_lt_j3 + 1;
    end
    if(z <= 0)
        z_lt_j4 = z_lt_j4 + 1;
    end
    if(z <= 0.5)
        z_lt_j5 = z_lt_j5 + 1;
    end
    if(z <= 1.0)
        z_lt_j6 = z_lt_j6 + 1;
    end
    if(z <= 1.4)
        z_lt_j7 = z_lt_j7 + 1;
    end
end
z_lt_j1 = z_lt_j1/110;
z_lt_j2 = z_lt_j2/110;
z_lt_j3 = z_lt_j3/110;
z_lt_j4 = z_lt_j4/110;
z_lt_j5 = z_lt_j5/110;
z_lt_j6 = z_lt_j6/110;
z_lt_j7 = z_lt_j7/110;
z_results = [z_lt_j1, z_lt_j2, z_lt_j3, z_lt_j4, z_lt_j5, z_lt_j6, z_lt_j7];
Fn(7, 1:7) = z_results;
%--------------------------------N = 1000----------------------------------
z_k = ((Means_1000 - EX) / ((stdX)/sqrt(1000))); %change numbers for n
z_lt_j1 = 0; %z <= -1.4
z_lt_j2 = 0; %z <= -1.0
z_lt_j3 = 0; %z <= -0.5
z_lt_j4 = 0; %z <= 0
z_lt_j5 = 0; %z <= 0.5
z_lt_j6 = 0; %z <= 1.0
z_lt_j7 = 0; %z <= 1.4
for z = z_k
    if(z <= -1.4)
        z_lt_j1 = z_lt_j1 + 1;
    end
    if(z <= -1.0)
        z_lt_j2 = z_lt_j2 + 1;
    end
    if(z <= -0.5)
        z_lt_j3 = z_lt_j3 + 1;
    end
    if(z <= 0)
        z_lt_j4 = z_lt_j4 + 1;
    end
    if(z <= 0.5)
        z_lt_j5 = z_lt_j5 + 1;
    end
    if(z <= 1.0)
        z_lt_j6 = z_lt_j6 + 1;
    end
    if(z <= 1.4)
        z_lt_j7 = z_lt_j7 + 1;
    end
end
z_lt_j1 = z_lt_j1/110;
z_lt_j2 = z_lt_j2/110;
z_lt_j3 = z_lt_j3/110;
z_lt_j4 = z_lt_j4/110;
z_lt_j5 = z_lt_j5/110;
z_lt_j6 = z_lt_j6/110;
z_lt_j7 = z_lt_j7/110;
z_results = [z_lt_j1, z_lt_j2, z_lt_j3, z_lt_j4, z_lt_j5, z_lt_j6, z_lt_j7];
Fn(8, 1:7) = z_results;

zs = [-1.4, -1.0, -0.5, 0, 0.5, 1.0, 1.4];
z_values = [(1-0.9192) (1-0.8413) (1-0.6915) 0.5000 0.6915 0.8413 0.9192];

absolute_diff = zeros([8, 7]);
absolute_diff(1, 1:7) = abs(Fn(1,1:7) - z_values);
absolute_diff(2, 1:7) = abs(Fn(2, 1:7) - z_values);
absolute_diff(3, 1:7) = abs(Fn(3, 1:7) - z_values);
absolute_diff(4, 1:7) = abs(Fn(4, 1:7) - z_values);
absolute_diff(5, 1:7) = abs(Fn(5, 1:7) - z_values);
absolute_diff(6, 1:7) = abs(Fn(6, 1:7) - z_values);
absolute_diff(7, 1:7) = abs(Fn(7, 1:7) - z_values);
absolute_diff(8, 1:7) = abs(Fn(8, 1:7) - z_values);

mad10 = max(absolute_diff(1, 1:7));
mad30 = max(absolute_diff(2, 1:7));
mad50 = max(absolute_diff(3, 1:7));
mad100 = max(absolute_diff(4, 1:7));
mad150 = max(absolute_diff(5, 1:7));
mad250 = max(absolute_diff(6, 1:7));
mad500 = max(absolute_diff(7, 1:7));
mad1000 = max(absolute_diff(8, 1:7));

madn = [mad10; mad30; mad50; mad100; mad150; mad250; mad500; mad1000]

plot(zs, z_results, '.k','Markersize', 10) %Move to N value section to graph
hold on
xcdf = linspace(-2.5, 2.5);
ycdf = normcdf(xcdf);
plot(xcdf, ycdf)
xlabel('z')
ylabel('Probability (Z \leq z)')
title('N = 1000')
legend_strings{1} = 'Sample Mean Z Value Estimates';
legend_strings{2} = 'Normal CDF';
legend(legend_strings);


