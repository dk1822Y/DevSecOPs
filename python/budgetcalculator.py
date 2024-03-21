# Set the annual income
income = 50000

# Calculate the monthly income
monthly_income = income / 12

# Set the percentage of income to be allocated to each category
housing = 0.30
transportation = 0.15
food = 0.10
entertainment = 0.05
savings = 0.10

# Calculate the monthly budget for each category
monthly_housing = round(housing * monthly_income, 2)
monthly_transportation = round(transportation * monthly_income, 2)
monthly_food = round(food * monthly_income, 2)
monthly_entertainment = round(entertainment * monthly_income, 2)
monthly_savings = round(savings * monthly_income, 2)

# Print the monthly budget
print("===Monthly Budget===")
print("Housing: $" + str(monthly_housing))
print("Transportation: $" + str(monthly_transportation))
print("Food: $" + str(monthly_food))
print("Entertainment: $" + str(monthly_entertainment))
print("Savings: $" + str(monthly_savings))
