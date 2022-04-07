import pandas


def extract_file(directory):
    """
    :param directory: Directory to csv file you wish to plotting_system
    :return:
    """
    output_file = pandas.read_csv(directory, header=None, delim_whitespace=True,
                                  )

    return output_file

