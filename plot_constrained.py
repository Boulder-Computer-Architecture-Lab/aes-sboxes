import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

# Nangate15nm library NAND2_X1
nand2 = 0.196608
# Color-blind friendly palette
color_cycle = ["#999999", "#000000", "#E69F00", "#56B4E9", "#0072B2", "#D55E00", "#CC79A7","#009E73","#F0E442"]

# Set the font sizes
plt.rcParams['font.size'] = 13
plt.rcParams['axes.labelsize'] = 13
plt.rcParams['xtick.labelsize'] = 12
plt.rcParams['ytick.labelsize'] = 12
plt.rcParams['legend.fontsize'] = 13

# Read csv
df = pd.read_csv('results/15constrained.csv')

# Generate plot
fig, axs = plt.subplots(1, 2, figsize=(10, 3.75))

# Find unique S-box names
names = df['name'].unique()

# Divide all area entries by nand2
df['gate equivalents'] = df['area (um)'] / nand2

# For each entry from names plot
for i, name in enumerate(names):
    # Get subset of df
    df_subset = df[df['name'] == name]
    # Plot according to target clock on x-axis
    axs[0].plot(df_subset['target clock (ps)'], df_subset['gate equivalents'],'-',color=color_cycle[i],linewidth=2)
    
# Set limits
axs[0].set_xlim(df['target clock (ps)'].min(), df['target clock (ps)'].max())
# Add grid
axs[0].grid()
# Titles
axs[0].set_xlabel('Target Clock Period (ps)')
axs[0].set_ylabel('Gate Equivalents')

# Multiply all power entries by 1e6 in df by 1e6
df['power (uW)'] = df['power (W)'] * 1e6

# Do the same but for power
for i, name in enumerate(names):
    df_subset = df[df['name'] == name]
    axs[1].plot(df_subset['target clock (ps)'], df_subset['power (uW)'],'-',color=color_cycle[i],linewidth=2)

# Set limits
axs[1].set_xlim(df['target clock (ps)'].min(), df['target clock (ps)'].max())
# Add grid
axs[1].grid()
# Titles
axs[1].set_xlabel('Target Clock Period (ps)')
axs[1].set_ylabel('Power $(\mu W)$')

# Add legend
fig.legend(names, loc='upper center', bbox_to_anchor=(0.5, 1), ncol=3,frameon=False)
# Formatting
fig.tight_layout()
fig.subplots_adjust(top=0.75,bottom=0.15)

# Save to file
fig.savefig('fig/15constrained.pdf')