import os

import numpy as np
from matplotlib import pyplot as plt

from utils import extract_file
from mpl_toolkits.mplot3d import axes3d

from ast import literal_eval

current_path = os.getcwd()


def plot_ev_vs_energy(directory, name_of_file,
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
    energy_level = data[0].values
    computed_eigen_value = data[2].values
    relative_error = data[3].values

    # plot coupled data
    fig, axs = plt.subplots(2, 1)
    fig.suptitle('Eigenvalue vs Energy level', fontsize=14)

    axs[0].set_title('Energy vs Eigenvalue')
    axs[0].set_xlabel('Theoretical')
    axs[0].set_ylabel('Computed')
    axs[0].plot(energy_level, computed_eigen_value, color='orange')

    axs[1].set_title('Energy vs Relative Error')
    axs[1].set_xlabel('Theoretical')
    axs[1].set_xlabel('Relative Error')
    axs[1].plot(energy_level, relative_error, color='orange')

    fig.tight_layout()
    plt.plot()
    plt.savefig(directory_to_save + name_of_file)
    plt.close()


def plot_potential():
    """
    :param directory: Directory to csv file you wish to plot
    :param name_of_file: name of file you wish to save
    :param directory_to_save: directory to save file
    :return: None
    """

    # plot data
    fig = plt.figure(figsize=(10, 10))
    ax1 = fig.add_subplot(111, projection='3d')
    x = np.arange(-5, 5, 0.2)
    y = np.arange(-5, 5, 0.2)
    X, Y = np.meshgrid(x, y)
    Z = 0.5 * (X ** 2 + Y ** 2)

    mycmap = plt.get_cmap('gnuplot')
    ax1.set_title('Figure 3.03: Potential Funtion of QHO')
    ax1.set_xlabel('x')
    ax1.set_ylabel('y')
    ax1.set_zlabel('V(x, y)')
    surf1 = ax1.plot_surface(X, Y, Z, cmap=mycmap)
    fig.colorbar(surf1, ax=ax1, shrink=0.5, aspect=10)

    plt.show()


def plot_E0(directory):
    data = extract_file(directory)

    fig = plt.figure(figsize=(10, 10))
    ax1 = fig.add_subplot(111, projection='3d')

    x = np.arange(-4.8, 5, 0.2)
    y = np.arange(-4.8, 5, 0.2)
    X, Y = np.meshgrid(x, y)
    Z = data

    cmapsit = plt.get_cmap('gnuplot')
    ax1.set_title('Ground State energy')
    ax1.set_xlabel('x')
    ax1.set_ylabel('y')
    ax1.set_zlabel('Energy')
    surf1 = ax1.plot_surface(X, Y, Z, cmap=cmapsit)
    fig.colorbar(surf1, ax=ax1, shrink=0.5, aspect=10)

    plt.show()




def plot_E0_vs_Theoretical(directory,
                           directory_to_save):
    data = extract_file(directory)

    fig = plt.figure(figsize=(10, 10))
    ax1 = fig.add_subplot(111, projection='3d')

    x = np.arange(-4.8, 5, 0.2)
    y = np.arange(-4.8, 5, 0.2)
    X, Y = np.meshgrid(x, y)
    Z = data - 0.5 * (1 / np.pi) * np.exp((-X) ** 2 + (-Y) ** 2)

    cmapsit = plt.get_cmap('gnuplot')
    ax1.set_title('Ground State energy')
    ax1.set_xlabel('x')
    ax1.set_ylabel('y')
    ax1.set_zlabel('Energy')
    surf1 = ax1.plot_surface(X, Y, Z, cmap=cmapsit)
    fig.colorbar(surf1, ax=ax1, shrink=0.5, aspect=10)
    plt.show()
