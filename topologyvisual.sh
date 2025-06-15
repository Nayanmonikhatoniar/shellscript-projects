#!/bin/bash

# Topology Visualizer Script
# Made for WSL and Your YouTube Math Channel!

clear
echo -e "\e[1;34m📘 Welcome to the Topologist's Diary (WSL Bash Edition)\e[0m"
echo ""
echo -e "Choose a Topological Space to Visualize:"
echo "1) Discrete Topology"
echo "2) Trivial Topology"
echo "3) Cofinite Topology"
echo "4) Finite Complement Topology"
read -p "Enter your choice [1-4]: " choice

# Define the base set
base_set=(a b c d e)

show_set() {
    echo -e "\n🧮 Base Set: { ${base_set[*]} }"
}

discrete_topology() {
    show_set
    echo -e "\n📂 Discrete Topology: All subsets of the set."
    echo "Example Open Sets:"
    echo "{}"
    echo "{a}"
    echo "{a, b}"
    echo "{a, b, c}"
    echo "{a, b, c, d, e}"
}

trivial_topology() {
    show_set
    echo -e "\n📂 Trivial Topology: Only the empty set and the whole set."
    echo "Example Open Sets:"
    echo "{}"
    echo "{a, b, c, d, e}"
}

cofinite_topology() {
    show_set
    echo -e "\n📂 Cofinite Topology: A set is open if its complement is finite."
    echo "Example Open Sets:"
    echo "{}"
    echo "{a, b, c, d, e}"
    echo "{a, b}"     # complement: {c, d, e}
    echo "{c, d, e}"  # complement: {a, b}
}

finite_complement_topology() {
    show_set
    echo -e "\n📂 Finite Complement Topology: Any set whose complement is finite is open."
    echo "Example Open Sets:"
    echo "{}"
    echo "{a, b, c, d, e}"
    echo "{b, c, d}"   # complement: {a, e}
    echo "{c, d, e}"   # complement: {a, b}
}

echo ""
case $choice in
    1) discrete_topology ;;
    2) trivial_topology ;;
    3) cofinite_topology ;;
    4) finite_complement_topology ;;
    *) echo -e "\e[31mInvalid choice.\e[0m" ;;
esac

echo -e "\n📌 \e[1;32mFun Fact:\e[0m These topologies help us understand continuity, convergence, and separation — even beyond Euclidean space!"
echo -e "\n🎬 Use this in your video to visually explain abstract topology using bash and logic!\n"

