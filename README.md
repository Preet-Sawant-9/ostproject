#!/bin/bash

# Function to display the menu
display_menu() {
    echo "Personal Expense Manager"
    echo "1. Add Expense"
    echo "2. View Expenses"
    echo "3. Total Expense"
    echo "4. Cash in Hand"
    echo "5. Exit"
    echo -n "Choose an option: "
}

# Function to add an expense
add_expense() {
    echo -n "Enter the amount: "
    read amount
    echo -n "Enter the occasion: "
    read occasion
    date=$(date '+%Y-%m-%d')
    echo "$date - $amount - $occasion" >> expenses.txt
    echo "Expense added successfully!"
}

# Function to view all expenses
view_expenses() {
    if [ -f expenses.txt ]; then
        cat expenses.txt
    else
        echo "No expenses recorded yet."
    fi
}

# Function to calculate total expenses
total_expense() {
    if [ -f expenses.txt ]; then
        awk '{ sum += $3 } END { print "Total Expense: " sum }' expenses.txt
    else
        echo "No expenses recorded yet."
    fi
}

# Function for cash in hand
cash_in_hand() {
    echo -n "Enter the total cash in hand: "
    read cash
    total_spent=$(awk '{ sum += $3 } END { print sum }' expenses.txt)
    remaining=$(echo "$cash - $total_spent" | bc)
    echo "Remaining cash: $remaining"
}

# Main loop
while true; do
    display_menu
    read choice
    case $choice in
        1) add_expense ;;
        2) view_expenses ;;
        3) total_expense ;;
        4) cash_in_hand ;;
        5) exit ;;
        *) echo "Invalid option, please try again." ;;
    esac
done
