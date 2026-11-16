###party id proportions overtime graphic
as.numeric(anes_ts$party_id)

anes_ts$party_id <- ifelse(anes_ts$VCF9240 >= 0 & anes_ts$VCF9240 <= 10, anes_ts$VCF9240, NA)

PPartyid_ts <- melt(anes_ts, id.vars = "VCF0004", variable.name = "party_id", value.name = "Count")
PPartyid_ts <- anes_ts %>%
  group_by(VCF0004, party_id) %>%
  summarise(Count = n(), .groups = "drop")

colnames(PPartyid_ts) <- c("Year", "party_id", "Count")
View(PPartyid_ts)

#making wrangling adjustments

PPartyid_ts_filtered <- PPartyid_ts %>%
  filter(Year >= 1996 & Year <= 2020) %>%
  group_by(Year) %>%
  mutate(Proportion = Count / sum(Count)) %>%  # Convert counts to proportions
  ungroup()

PPartyid_ts_filtered <- PPartyid_ts %>%
  filter(Year >= 1996 & Year <= 2020) %>%
  group_by(Year) %>%
  mutate(Proportion = Count / sum(Count)) %>%  # Convert counts to proportions
  ungroup()

PPartyid_ts_filtered_no_na <- PPartyid_ts_filtered %>%
  filter(!is.na(party_id))

# Now plot the graph
ggplot(PPartyid_ts_filtered_no_na, aes(x = Year, y = Proportion, fill = factor(party_id))) + 
  geom_area(position = "stack") +
  labs(title = "Left-Right Placement Scale Proportions Over Time (1996-2020)",
       x = "Year",
       y = "Proportion",
       fill = "Left-Right Placement Scale") +
  theme_minimal() +
  scale_fill_brewer(palette = "Spectral", direction = -1) +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1))


library(dplyr)
library(ggplot2)

library(dplyr)
library(ggplot2)

# Filter out NA party_id BEFORE computing proportions
library(dplyr)
library(ggplot2)

# Step 1: Filter out NA and recalculate proportions per year
clean_data <- PPartyid_ts %>%
  filter(!is.na(party_id)) %>%
  group_by(Year, party_id) %>%
  summarise(count = sum(Count, na.rm = TRUE), .groups = "drop") %>%  # Replace `count_var` with your actual count column
  group_by(Year) %>%
  mutate(Proportion = count / sum(count)) %>%
  ungroup()

# Step 2: Plot
ggplot(clean_data, aes(x = Year, y = Proportion, fill = factor(party_id))) + 
  geom_area(position = "stack") +
  labs(
    title = "Left-Right Placement Scale Proportions Over Time (1996-2020)",
    x = "Year",
    y = "Proportion",
    fill = "Left-Right Placement Scale"
  ) +
  theme_minimal() +
  scale_fill_brewer(palette = "Spectral", direction = -1) +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1))



