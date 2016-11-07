import matplotlib.pyplot as plt
import numpy as np

def plot_weights(w, feature_names, label_names):
    plt.matshow(w, cmap='hot', interpolation='nearest')
    plt.xticks(np.arange(len(feature_names)), feature_names, rotation=90)
    plt.yticks(np.arange(len(label_names)), label_names)
    # plt.legend()
    plt.show()
