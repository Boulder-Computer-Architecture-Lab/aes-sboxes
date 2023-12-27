import matplotlib.ticker as ticker
  
# Nangate15nm library NAND2_X1
nand2 = 0.196608

# Color-blind friendly palette
color_cycle = ["#999999", "#000000", "#E69F00", "#56B4E9", "#0072B2", "#D55E00", "#CC79A7","#009E73"]

design = {
    "sbox_full_lut": "Full LUT",
    "sbox_inv_lut": "Inversion LUT",
    "sbox_canright": "Canright",
    "sbox_depth16": "Boyar & Peralta",
    "sbox_maximov": "Maximov & Ekdahl",
    "sbox_new_area": "Reyhani-Masoleh et al.",
    "sbox_bdd": "BDD",
    "sbox_pprm": "PPRM",
    "sbox_canright_masked": "Canright & Batina",
    "sbox_dom1": "DOM $1^{st}$ Order",
    "sbox_dom2": "DOM $2^{nd}$ Order",
    "sbox_nullfresh": "NullFresh",
    "sbox_sesym1": "SESYM $1^{st}$ Order",
    "sbox_sesym2": "SESYM $2^{nd}$ Order"
}

markers = {
    "Canright & Batina": "D",
    "DOM $1^{st}$ Order": "X",
    "DOM $2^{nd}$ Order": "X",
    "NullFresh": "^",
    "SESYM $1^{st}$ Order":"s",
    "SESYM $2^{nd}$ Order":"s"
}

formatter = ticker.ScalarFormatter()

