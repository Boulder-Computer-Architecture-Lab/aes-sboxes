import numpy as np
import pareto
import matplotlib.pyplot as plt 
import pandas as pd

nand2 = 0.196608
df = pd.read_csv('results/15product.csv')
df['gate equivalents'] = df['area (um)'] / nand2
# Sort by smallest to biggest gate equivalents
df = df.sort_values(by=['gate equivalents'])
df_subset = df[['gate equivalents','delay (ps)']]

nondominated = pareto.eps_sort([list(df_subset.itertuples(False))])
df_pareto = pd.DataFrame.from_records(nondominated, columns=list(df['gate equivalents'].values))
print(df_pareto)
# plt.plot(df_pareto['gate equivalents'],df_pareto['delay (ps)'],'o', color="red",markersize=9)
plt.show()
plt.savefig("test.png")