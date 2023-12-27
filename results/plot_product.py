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

# Import csv
df = pd.read_csv('data/product.csv')

# Create a new entry called gate equivalents
df['area (GE)'] = df['area (um)'] / nand2

# Get unique names
df['name'] = df['name'].map(design)
names = df['name'].unique()

# Create a figure with two subplots side by side
fig, axs = plt.subplots(1, 2, figsize=(10, 4.5))

# For each entry from names plot
j = 0
for i, name in enumerate(names):
    # Get subset of df
    df_subset = df[df['name'] == name]
    if (i < len(color_cycle)):
        # Plot according to target clock on x-axis on the first subplot
        axs[0].semilogx(df_subset['area (GE)'],df_subset['delay (ps)'],'o', color=color_cycle[i],markersize=9)    
    else:
        axs[0].semilogx(df_subset['area (GE)'],df_subset['delay (ps)'],markers[name], color=color_cycle[j],markersize=9)    
        j += 1
        
# Create legend for each name and place beneath title
axs[0].set_xticks([100, 1000, 10000])
axs[0].grid(which="both")
axs[0].set_ylabel('Critical Path Delay (ps)')
axs[0].set_xlabel('Gate Equivalents')
axs[0].xaxis.set_major_formatter(formatter)
axs[0].xaxis.set_major_formatter(ticker.FormatStrFormatter('%d'))
  
# Do the same but with area power product
j = 0
for i, name in enumerate(names):
    df_subset = df[df['name'] == name]
    if (i < len(color_cycle)):
        axs[1].semilogx(df_subset['area (GE)'],df_subset['power (mW)'],'o', color=color_cycle[i], markersize=9)
    else:
        axs[1].semilogx(df_subset['area (GE)'],df_subset['power (mW)'],markers[name], color=color_cycle[j], markersize=9)
        j += 1
        
axs[1].set_xticks([100, 1000, 10000])
axs[1].grid(which="both")
axs[1].set_ylabel('Power $(mW)$')
axs[1].set_xlabel('Gate Equivalents')
axs[1].xaxis.set_major_formatter(formatter)
axs[1].xaxis.set_major_formatter(ticker.FormatStrFormatter('%d'))
  
fig.legend(names, loc='upper center', bbox_to_anchor=(0.5, 1), ncol=3,frameon=False)
fig.tight_layout()
fig.subplots_adjust(top=0.65,bottom=0.15)

fig.savefig('fig/product.pdf')