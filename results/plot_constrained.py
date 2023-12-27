import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from common import *

# Set the font sizes
plt.rcParams['font.size'] = 13
plt.rcParams['axes.labelsize'] = 13
plt.rcParams['xtick.labelsize'] = 12
plt.rcParams['ytick.labelsize'] = 12
plt.rcParams['legend.fontsize'] = 13

# Read csv
df = pd.read_csv('data/constrained.csv')

# Generate plot
fig, axs = plt.subplots(1, 2, figsize=(10, 4.5))

# Find unique S-box names
df['name'] = df['name'].map(design)
names = df['name'].unique()

# Divide all area entries by nand2
df['area (GE)'] = df['area (um)'] / nand2

# For each entry from names plot
j = 0
for i, name in enumerate(names):
    # Get subset of df
    df_subset = df[df['name'] == name]
    if (i < len(color_cycle)):
        # Plot according to target clock on x-axis
        axs[0].semilogy(df_subset['clock (ps)'], df_subset['area (GE)'],'-',color=color_cycle[i],linewidth=2)
    else:
        axs[0].semilogy(df_subset['clock (ps)'], df_subset['area (GE)'],'--',color=color_cycle[j],linewidth=2)
        j += 1
        
# Set limits
axs[0].set_xlim(df['clock (ps)'].min(), df['clock (ps)'].max())
axs[0].set_yticks([100, 1000, 2000])
# Add grid
axs[0].grid(which="both")
# Titles
axs[0].set_xlabel('Target Clock Period (ps)')
axs[0].set_ylabel('Gate Equivalents')
axs[0].yaxis.set_major_formatter(formatter)
axs[0].yaxis.set_major_formatter(ticker.FormatStrFormatter('%d'))
  
# Do the same but for power
j = 0
for i, name in enumerate(names):
    df_subset = df[df['name'] == name]
    if (i < len(color_cycle)):
        axs[1].semilogy(df_subset['clock (ps)'], df_subset['power (mW)'],'-',color=color_cycle[i],linewidth=2)
    else:
        axs[1].semilogy(df_subset['clock (ps)'], df_subset['power (mW)'],'--',color=color_cycle[j],linewidth=2)
        j += 1
        
# Set limits
axs[1].set_yticks([1, 10, 50])
axs[1].set_xlim(df['clock (ps)'].min(), df['clock (ps)'].max())

# Add grid
axs[1].grid()
# Titles
axs[1].set_xlabel('Target Clock Period (ps)')
axs[1].set_ylabel('Power $(mW)$')
axs[1].yaxis.set_major_formatter(formatter)
axs[1].yaxis.set_major_formatter(ticker.FormatStrFormatter('%d'))
  
# Add legend
fig.legend(names, loc='upper center', bbox_to_anchor=(0.5, 1), ncol=3,frameon=False)
# Formatting
fig.tight_layout()
fig.subplots_adjust(top=0.65,bottom=0.15)

# Save to file
fig.savefig('fig/constrained.pdf')