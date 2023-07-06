class RegisterNode:
    """
    Generates a new node for a register number
    """

    def __init__(self, reg_idx, lvl):
        self.register_index = reg_idx
        self.register_level = lvl
        self.label = 'R' + str(reg_idx)

    def get_label(self):
        return self.label

import networkx as nx

G = nx.DiGraph()

nodes = []
nodes.append(RegisterNode(1,1))
nodes.append(RegisterNode(3,2))

G.add_node(nodes[0],level=1)
G.add_node(nodes[1],level=2)

G.add_edge(nodes[0],nodes[1])

labels = {}
labels[nodes[0]] = nodes[0].get_label()
labels[nodes[1]] = nodes[1].get_label()

import matplotlib.pyplot as plt
pos = nx.nx_agraph.graphviz_layout(G, prog="dot")
nx.draw(G, pos=pos, labels=labels, with_labels=True, node_size=600, font_weight='bold')
# nx.draw_networkx_labels(G, pos, labels, font_size=22, font_color="whitesmoke")
plt.show()