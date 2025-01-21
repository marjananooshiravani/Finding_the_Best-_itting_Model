# Finding_the_Best_fitting_Model

This repository contains MATLAB code and materials from my coursework on **Computational Cognitive Modeling**, with a primary focus on **finding the best-fitting model** for given data. The project explores different optimization techniques to estimate regression parameters, compare model performance, and interpret results.  

# Computational Cognitive Modeling: Finding the Best Fitting Model  

## Project Overview  
The goal of this project is to identify the most accurate and efficient model for cognitive data by applying various **parameter estimation and optimization techniques.** The implemented methods include:  
- **Genetic Algorithms (GA)** – Evolutionary optimization technique  
- **Nelder-Mead Simplex Method** – Direct search for local optimization  
- **Simulated Annealing (SA)** – Probabilistic technique for global optimization  
These techniques are applied to simulated datasets to determine which approach yields the best model fit, balancing accuracy and computational efficiency.  
## Code Overview  
- **`genetic_algorithm.m`**  
  - Implements a genetic algorithm to optimize model parameters by minimizing the prediction error function.  
  - Utilizes evolutionary strategies to explore the parameter space.  
- **`simplex_method.m`**  
  - Applies the Nelder-Mead Simplex algorithm (`fminsearch`) to optimize regression parameters.  
  - A direct search method useful for local optimization.  
- **`simulated_annealing.m`**  
  - Uses simulated annealing to optimize parameters by probabilistically exploring the search space and avoiding local minima.  
- **`getregpred.m`**  
  - Objective function for the optimization algorithms, calculating model predictions based on the provided parameters.  
