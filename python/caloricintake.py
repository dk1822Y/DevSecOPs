# Set the age, height, and weight
age = 18
height = 64
weight = 180

# Calculate the BMR (Basal Metabolic Rate)
bmr = 66 + (6.23 * weight) + (12.7 * height) - (6.8 * age)

# Calculate the daily caloric intake
calories = bmr * 1.55

# Print the daily caloric intake
print("Daily caloric intake: " + str(calories) + " calories")
