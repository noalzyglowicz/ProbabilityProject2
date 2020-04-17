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

zvalues = [-1.4, -1.0, -0.5, 0, 0.5, 1.0, 1.4];
z_results = [z_lt_j1, z_lt_j2, z_lt_j3, z_lt_j4, z_lt_j5, z_lt_j6, z_lt_j7];

plot(zvalues, z_results, '.k','Markersize', 10) 
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

