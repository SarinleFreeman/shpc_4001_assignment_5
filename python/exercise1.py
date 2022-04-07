import os

from matplotlib import pyplot as plt

from utils import extract_file
from ast import literal_eval


current_path = os.getcwd()

def plot_absolute_error(directory, name, name_of_file,
                        directory_to_save=current_path + '/python/'):
    """
    :param directory: Directory to csv file you wish to plot
    :param name_of_file: name of file you wish to save
    :param directory_to_save: directory to save file
    :return: None
    """
    # import data
    data = extract_file(directory)

    # extract relevant information
    count = data[1].values
    eigen_values = [complex(literal_eval(element)[0],literal_eval(element)[1]) for element in data[0].values]
    real_eigen_value = eigen_values[-1]
    absolute_errors = [abs(eigen_value - real_eigen_value) for eigen_value in eigen_values]

    # plot coupled data
    plt.title('Absolute Error vs Count')
    plt.xlabel('count')
    plt.ylabel('absolute error')
    plt.plot(count, absolute_errors, color='orange')
    plt.plot()
    plt.savefig(directory_to_save + name_of_file)
    plt.close()
