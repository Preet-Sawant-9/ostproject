#!/bin/bash
# File to store expenses
EXPENSE_FILE="expenses.txt"
CASH_FILE="cash.txt"
# Function to add an expense
add_expense() {
echo "Enter the date (YYYY-MM-DD):"
read DATE
echo "Enter the expense description:"
read DESCRIPTION
echo "Enter the amount:"
read AMOUNT
# Save the expense to the file
echo "ŞDATE | $DESCRIPTION | SAMOUNT" >> "$EXPENSE_FILE"
echo "Expense added successfully."
}
#Function to view expenses
view_expenses() {
if [ -f "$EXPENSE_FILE"]]; then
echo "No expenses recorded."
return
fi
echo "Date | Description | Amount"
echo
cat "$EXPENSE_FILE"
}
# Function to generate a summary of total expenses total_expenses() {
if [ -f "$EXPENSE_FILE"]]; then echo "No expenses recorded."
return
fi
total=0
while IFS='|' read r date description amount; do
total=$(echo "$total + $amount" | bc)
done < "$EXPENSE_FILE"
}
echo "Total Amount Spent: $total"
# Function to manage cash in hand and savings
manage_cash() {
echo "Enter cash in hand:"
read CASH_IN_HAND
echo "Enter savings amount:"
read SAVINGS
# Function to manage cash in hand and savings manage_cash() {
echo "Enter cash in hand:"
read CASH_IN_HAND
echo "Enter savings amount:"
read SAVINGS
# Save cash details to the file
echo "Cash in Hand: $CASH_IN_HAND" > "$CASH_FILE"
echo "Savings: $SAVINGS" >> "$CASH_FILE"
echo "Cash details updated successfully."
+
}
# Function to view cash in hand and savings
view_cash() {
if [ -f "$CASH_FILE"]]; then
echo "No cash details recorded."
return
fi
echo "Cash Details:"
cat "ŞCASH_FILE"
}
# Main menu
while true; do
echo "Personal Expense Tracker"
echo "1. Add Expense"
echo "2. View Expenses"
echo "3. Total Amount Spent"
echo "4. Manage Cash in Hand and Savings"
echo "5. View Cash in Hand and Savings"
echo "6. Exit"
read -p "Select an option: option
case $option in
1) add_expense ;;
2) view_expenses ;;
3) total_expenses ;;
4) manage_cash;; 5) view_cash;;
6) echo "Goodbye!"; exit;;
*) echo "Invalid option. Please try again." ;;
esac
echo
done
