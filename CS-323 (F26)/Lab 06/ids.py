CUTOFF = "cutoff"   # depth limit reached; a goal may still exist deeper down
FAILURE = None      # sub-tree completely explored; no goal inside it

def depth_limited_search(graph, node, goal, limit, path, visit_order):
    """Recursive DFS that goes at most `limit` edges below `node`."""

    visit_order.append(node)

    if node == goal:                                  # goal test
        return list(path)

    children = [c for c in graph.get(node, []) if c not in path]  # skip cycles

    if limit == 0:
        # Limit reached: report CUTOFF only if there are deeper nodes we skip.
        return CUTOFF if children else FAILURE

    cutoff_occurred = False
    for child in children:
        path.append(child)
        result = depth_limited_search(graph, child, goal, limit - 1,
                                      path, visit_order)
        path.pop()                                    # backtrack

        if result == CUTOFF:
            cutoff_occurred = True
        elif result is not FAILURE:                   # a solution path came back
            return result

    return CUTOFF if cutoff_occurred else FAILURE

def iterative_deepening_search(graph, start, goal, max_depth=50):
    """Call DLS with limits 0, 1, 2, ... until the goal is found."""

    total_visits = 0

    for limit in range(max_depth + 1):
        visit_order = []
        result = depth_limited_search(graph, start, goal, limit,
                                      [start], visit_order)
        total_visits += len(visit_order)
        line = f"Depth limit {limit}: {' '.join(map(str, visit_order))}"

        if result == CUTOFF:                 # not found yet -> go deeper
            print(line)
            continue

        if result is FAILURE:                # whole graph explored, no goal
            print(f"{line}   <- no goal in the whole graph")
            print(f"\nGoal {goal} is NOT reachable from {start}.")
        else:                                # goal found
            print(f"{line}   <- GOAL FOUND")
            print(f"\nPath found : {' -> '.join(map(str, result))}")
            print(f"Goal depth : {len(result) - 1}")
        print(f"Nodes visited over all iterations: {total_visits}")
        return result

    print(f"\nGoal not found within max depth {max_depth}.")
    return None

def run_example(title, graph, start, goal):
    print("=" * 64)
    print(title)
    print("=" * 64)
    iterative_deepening_search(graph, start, goal)
    print()

def main():
    tree = {
        "A": ["B", "C", "D"],
        "B": ["E", "F"],
        "C": ["G"],
        "D": ["H", "I"],
        "E": ["J", "K"],
        "G": ["L"],
        "I": ["M"],
    }

    run_example("Example: tree, start = A, goal = M", tree, "A", "M")

if __name__ == "__main__":
    main()