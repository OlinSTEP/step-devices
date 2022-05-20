""" 
Using Markov Chains to model the deterioration of our STEP v0.0 PCB 
author: adi r 
"""

import numpy as np 
import random as rm
# from pydtmc import MarkovChain as mc


from random import (
    choice as _rd_choice,
    getstate as _rd_getstate,
    randint as _rd_randint,
    random as _rd_random,
    seed as _rd_seed,
    setstate as _rd_setstate
)

# Libraries

import matplotlib.pyplot as _mplp
import pytest as _pt

# Internal

from pydtmc import (
    MarkovChain as _MarkovChain,
    plot_eigenvalues as _plot_eigenvalues,
    plot_graph as _plot_graph,
    plot_redistributions as _plot_redistributions,
    plot_walk as _plot_walk
)

# Characterizing our STATE SPACE - we will only be including SoH in discrete increments of 5% here,
# but a complete state space would include system power draw, sensor degredation, etc. This is 
# essentially a probabalistic single cell battery degredation model. 

STATE_SPACE_LENGTH = 20
states = np.arange(80, 101)[20:0:-1]
# states.reverse()
# Transition Matrix - 
state_names = states.astype(str)


# Normal distribution probabiliaties at each percentage point with mean = 80% SOH and std = 4.246% SOH after 500 cycles 
normal_dist = [
    .0941, 
    .0915, 
    .0841,
    .0731,
    .0602,
    .0468,
    .0345,
    .0239,
    .0158, 
    .0100, 
    .0098,
    .0059, 
    .0033, 
    .0017, 
    ]

normal_dist = [x * .04 /.0941 for x in normal_dist]

def apply_normal_dist_state(SOH):
    st = 100 - SOH
    l = [0.0] * STATE_SPACE_LENGTH
    nd_pt = 0
    for i, val in enumerate(l): 
        if i <= st: 
            continue
        else: 
            if nd_pt> len(normal_dist) - 1: 
                l[i] = 0
            else: 
                l[i] = normal_dist[nd_pt]
                nd_pt += 1
    if st<19: 
        l[st] = 1 - sum(l)
    return l

# new_l = (apply_normal_dist_state(88))
# print(new_l)

# generate t matrix 
t_matrix = [apply_normal_dist_state(soh) for soh in states][0:20]
t_matrix[-1][-1] = 1 # absorbing state (SOH cannot fall beyond 80)


# for i in t_matrix: 
#     print(sum(i))
    # print(i)

# print(t_matrix)
# print(len(t_matrix), len(t_matrix[0]))
print(len(state_names))

mc_SOH = _MarkovChain(t_matrix, state_names)
print(mc_SOH)

# _plot_redistributions(mc_SOH, 500, plot_type='heatmap', dpi=300)

# _plot_walk(mc_SOH, 500, plot_type='transitions', dpi=300)

_plot_redistributions(mc_SOH, 100, plot_type='projection', dpi=300)
_mplp.show()