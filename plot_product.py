import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import matplotlib
from paretoset import paretoset

# Nangate15nm library NAND2_X1
nand2 = 0.196608

design = {
    "sbox_bdd": "BDD",
    "sbox_canright": "Canright",
    "sbox_depth16": "Boyar & Peralta",
    "sbox_full_lut": "Full LUT",
    "sbox_inv_lut": "Inverse LUT",
    "sbox_maximov": "Maximov & Ekdahl",
    "sbox_new_area": "Reyhani-Masoleh et al.",
    "sbox_pprm": "PPRM",
}

# Set the font sizes
plt.rcParams['font.size'] = 13
plt.rcParams['axes.labelsize'] = 13
plt.rcParams['xtick.labelsize'] = 12
plt.rcParams['ytick.labelsize'] = 12
plt.rcParams['legend.fontsize'] = 13

# Import csv
df = pd.read_csv('results/15product.csv')

# Create a new entry called gate equivalents
df['gate equivalents'] = df['area (um)'] / nand2

# Get unique names
df['name'] = df['name'].map(design)
names = df['name'].unique()


# Create a figure with two subplots side by side
fig, axs = plt.subplots(1, 2, figsize=(10, 3.75))

# Use seaborn-v0_8-colorblind or tableau-colorblind10 colors
# style_settings = matplotlib.style.library['viridis']

# Extract the color cycle from the style settings
# color_cycle = style_settings['axes.prop_cycle'].by_key()['color']
color_cycle = ["#999999", "#000000", "#E69F00", "#56B4E9", "#0072B2", "#D55E00", "#CC79A7","#009E73","#F0E442"]

# For each entry from names plot
for i, name in enumerate(names):
    # Get subset of df
    df_subset = df[df['name'] == name]
    # Plot according to target clock on x-axis on the first subplot
    axs[0].plot(df_subset['gate equivalents'],df_subset['delay (ps)'],'o', color=color_cycle[i],markersize=9)    



# Create legend for each name and place beneath title
axs[0].grid()
axs[0].set_ylabel('Critical Path Delay (ps)')
axs[0].set_xlabel('Gate Equivalents')

# Multiply power by 1e6
df['power (mW)'] = df['power (W)'] * 1e3

# Do the same but with area power product
# plt.figure()
for i, name in enumerate(names):
    df_subset = df[df['name'] == name]
    axs[1].plot(df_subset['gate equivalents'],df_subset['power (mW)'],'o', color=color_cycle[i], markersize=9)
    
# plt.legend(names, loc='upper center', bbox_to_anchor=(0.5, 1.25), ncol=3,frameon=False)
axs[1].grid()
axs[1].set_ylabel('Power $(mW)$')
axs[1].set_xlabel('Gate Equivalents')


fig.legend(names, loc='upper center', bbox_to_anchor=(0.5, 1), ncol=3,frameon=False)
fig.tight_layout()
fig.subplots_adjust(top=0.75,bottom=0.15)

fig.savefig('fig/15product.pdf')

# Print the area-delay product
df['area-delay'] = df['area (um)'] * df['delay (ps)']
print(df.sort_values(by='area-delay'))
# Print the area-power product
df['area-power'] = df['area (um)'] * df['power (mW)']
print(df.sort_values(by='area-power'))