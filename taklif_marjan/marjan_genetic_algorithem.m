%%%
clear vars
clc
%% definiation to generate data
%A = [2 1; -1 5; 2 1];
%b = [2; 6; 3];
%lb = zeros(7,1);
%% Genetic Algorithm
%[x,fval,exitflag] = ga(@lincontest6,2,A,b,[],[],lb)
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
%b_MSE = X \ y;

%% assign and display starting values and call parameter?estimation function
startParms = [0.2,-1,0.3];
%% definiation to generate data
A = [1 2; -1 -2; 2 2];
b = [2; 4; 3];
lb = zeros(2,1);
%% Genetic Algorithm
func=@(parms) getregpred(parms, data);
[x,fval,exitflag] = ga(@lincontest6,2,A,b,[],[],lb)
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
