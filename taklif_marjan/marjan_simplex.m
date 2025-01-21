%%% The aim of this file is Computing and Estimating Regression Parameters
%%%
clear vars
clc
%% definiation to generate data
nDataPts = 20;
rho = .9;
intercept = .1;

%% generate simulated data
data = zeros(nDataPts,2);
data(:,2) = randn(nDataPts,1);
data(:,1) = randn(nDataPts,1).* sqrt(2-rho^2) + (data(:,2).*rho) + intercept;
X = [ones(nDataPts,1) data(:,2) data(:,2).^2];
y = data(:,1);
plot(data(:,2),data(:,1),'O','MarkerFaceColor',[0.4 0.4 0.4],'MarkerEdgeColor','black')
xlabel('X', 'FontSize',18,'FontWeight','b');
ylabel('Y', 'FontSize',18,'FontWeight','b');
set(gca ,'Ytick',-2:2,'Xtick',-2:2)

%% How to Estimate Y (YHat) related to X (input data)

%% do conventional regression analysis and compute parameters
b_MSE = X \ y;

%% assign and display starting values and call parameter?estimation function
startParms = [0.2,-1,3];


%% Using fminsearch (Simplex )
func=@(parms) getregpred(parms, data);
[finalParms,finDiscrepancy] = fminsearch(func, startParms);
%%% plot current predictions and data and wait for keypress
figure()
plot(data(:,2), data(:,1),'o','MarkerFaceColor',[0.4 0.4 0.4], 'MarkerEdgeColor','black');
hold on
x_fit = linspace(min(data(:,2)), max(data(:,2)), 100);
y_fit = finalParms(1)+(finalParms(2).*x_fit)+finalParms(3).*x_fit.^2;
plot(x_fit, y_fit, 'k', 'LineWidth', 2);
xlabel('X', 'FontSize',18,'FontWeight','b');
ylabel('Y', 'FontSize',18,'FontWeight','b');
set(gca,'Ytick',-2:2,'Xtick',-2:2)

