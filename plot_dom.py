import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

# Nangate15nm library NAND2_X1
nand2 = 0.196608

plt.rcParams['font.size'] = 13
plt.rcParams['axes.labelsize'] = 13
plt.rcParams['xtick.labelsize'] = 12
plt.rcParams['ytick.labelsize'] = 12
plt.rcParams['legend.fontsize'] = 13

# Create subplots
fig, axs = plt.subplots(1, 2, figsize=(10, 3))

df = pd.read_csv('results/aesdom_asic15.csv')

# Divide area by nand2
df['gate equivalents'] = df['area (um)'] / nand2

# Plot order on x-axis and area on y-axis
axs[0].plot(df['order'], df['gate equivalents'], '-o',color= "#56B4E9")
axs[0].set_xlabel('Masking Order')
axs[0].set_xlim(df['order'].min(), df['order'].max())
axs[0].set_xticks(df['order'])
axs[0].set_ylabel('Gate Equivalents')
axs[0].grid()
df = pd.read_csv('results/aesdom_fpga.csv')
# add luts and ffs together
df['luts+ffs'] = df['luts'] + df['ffs']
axs[1].plot(df['order'], df['luts+ffs'], '-o',color= "#56B4E9")
axs[1].set_xlabel('Masking Order')
axs[1].set_xlim(df['order'].min(), df['order'].max())

# Show all x ticks
axs[1].set_xticks(df['order'])
axs[1].set_ylabel('LUTs + FFs')
axs[1].grid()

fig.tight_layout()

fig.savefig('fig/dom.pdf')