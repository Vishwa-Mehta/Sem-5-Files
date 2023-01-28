"""
You can create any other helper funtions.
Do not modify the given functions
"""
import queue
import copy

def A_star_Traversal(cost, heuristic, start_point, goals):
    """
    Perform A* Traversal and find the optimal path 
    Args:
        cost: cost matrix (list of floats/int)
        heuristic: heuristics for A* (list of floats/int)
        start_point: Staring node (int)
        goals: Goal states (list of ints)
    Returns:
        path: path to goal state obtained from A*(list of ints)
    """
    visited = [0 for i in range(len(cost))]
    frontier = queue.PriorityQueue()
    frontier.put((heuristic[start_point], ([start_point], start_point, 0)))
    while(frontier.qsize() != 0):
        nodes = frontier.get()[1]
        path = nodes[0]
        node = nodes[1]
        node_cost = nodes[2]
        if visited[node] == 0:
            visited[node] = 1
            if node in goals:
                return path
            for neighbour in range(1, len(cost)):
                if cost[node][neighbour] > 0 and visited[neighbour] == 0:
                    total_cost = node_cost + cost[node][neighbour]
                    estimated_total = total_cost + heuristic[neighbour]
                    path_till_neighbour = copy.deepcopy(path)
                    path_till_neighbour.append(neighbour)
                    frontier.put((estimated_total, (path_till_neighbour, neighbour, total_cost)))
    return []

def recursive_dfs(start_point, next_node, goals, cost, visited, p):
    visited.append(start_point)
    if cost[start_point][next_node] != 0 and cost[start_point][next_node] != -1 and next_node not in visited and next_node not in goals:
        p.append(start_point)
        recursive_dfs(next_node, next_node+1, goals, cost, visited, p)
    elif cost[start_point][next_node] == 0 or cost[start_point][next_node] == -1:
        recursive_dfs(start_point, next_node+1, goals, cost, visited, p)
    elif next_node in goals:
        p.append(start_point)
        p.append(next_node)
    return p


def DFS_Traversal(cost, start_point, goals):
    """
    Perform DFS Traversal and find the optimal path 
        cost: cost matrix (list of floats/int)
        start_point: Staring node (int)
        goals: Goal states (list of ints)
    Returns:
        path: path to goal state obtained from DFS(list of ints)
    """
    path = []
    visited = []
    p = []
    for i in cost[start_point]:
        if i != 0 and i != -1:
            next_node = cost[start_point].index(i)
            break
    path = recursive_dfs(start_point, next_node, goals, cost, visited, p)
    return path
