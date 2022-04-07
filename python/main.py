import os

from exercise1 import plot_absolute_error
from exercise3 import plot_ev_vs_energy, plot_potential, plot_E0, plot_E0_vs_Theoretical

current_path = os.getcwd()

plot_absolute_error(directory=current_path + '/python/csv/absolute_error.csv',
                  name_of_file='AbsoluteError',
                 directory_to_save= current_path + '/python/',name='Absolute Error vs Count')

plot_ev_vs_energy(directory=current_path + '/python/csv/eigen_values.csv', name_of_file='EigenValueErrors',
                      directory_to_save=current_path + '/python/')

plot_potential()

plot_E0(directory=current_path + '/python/csv/eigen_ground.csv')

plot_E0_vs_Theoretical(directory=current_path + '/python/csv/eigen_ground.csv',
                 directory_to_save= current_path + '/python/')