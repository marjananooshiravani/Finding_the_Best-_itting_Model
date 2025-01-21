%%% Minimize De Jong's fifth function, 
%%% a two-dimensional function with many local minima.
clear all
clc
%fun = @dejong5fcn;
%x0 = [0 0];
%x = simulannealbnd(fun,x0)
%% definiation to generate data
nDataPts = 20;
rho = .9;
intercept = .0;

%% generate simulated data
data = zeros(nDataPts,2);
data(:,2) = randn(nDataPts,1);
data(:,1) = randn(nDataPts,1).* sqrt(1-rho^2) + (data(:,2).*rho) + intercept;
X = [ones(nDataPts,1) data(:,2) data(:,2).^2]; % Add squared values of data(:,2)
y = data(:,1);
plot(data(:,2),data(:,1),'O','MarkerFaceColor',[0.4 0.4 0.4],'MarkerEdgeColor','black')
xlabel('X', 'FontSize',18,'FontWeight','b');
ylabel('Y', 'FontSize',18,'FontWeight','b');
set(gca ,'Ytick',-2:2,'Xtick',-2:2)

%% How to Estimate Y (YHat) related to X (input data)

%% do conventional regression analysis and compute parameters
b_MSE = X \ y;

%% assign and display starting values and call parameter?estimation function
startParms = [0.2,-1,0.1]; % Add starting value for the coefficient of the squared term


%% Using simulannealbnd (simulated annealing )
func=@(parms) getregpred(parms, data);
[finalParms,finDiscrepancy] = simulannealbnd(func, startParms);
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
