#+ eval = FALSE
install.packages("tidyverse")
install.packages("repurrrsive")
install.packages("gapminder")

#+ eval = TRUE
library(gapminder)
library(tidyverse)

gapminder

gapminder %>%
  count(continent)

# ggplot2 code would go here

#+ eval = FALSE
africa <- gapminder[gapminder$continent == "Africa", ]
africa_mm <- max(africa$lifeExp) - min(africa$lifeExp)

americas <- gapminder[gapminder$continent == "Americas", ]
americas_mm <- max(americas$lifeExp) - min(americas$lifeExp)

asia <- gapminder[gapminder$continent == "Asia", ]
asia_mm <- max(asia$lifeExp) - min(africa$lifeExp)

europe <- gapminder[gapminder$continent == "Europe", ]
europe_mm <- max(europe$lifeExp) - min(europe$lifeExp)

oceania <- gapminder[gapminder$continent == "Oceania", ]
oceania_mm <- max(europe$lifeExp) - min(oceania$lifeExp)

cbind(
  continent = c("Africa", "Asias", "Europe", "Oceania"),
  max_minus_min = c(africa_mm, americas_mm, asia_mm,
                    europe_mm, oceania_mm)
)

#+ eval = TRUE
gapminder %>%
  group_by(continent) %>%
  summarize(max_minus_min = max(lifeExp) - min(lifeExp))

#+ eval = FALSE
filter(gapminder, country == "Canada")
gapminder %>%
  filter (country == "Canada")

mean(x)
x %>% mean()

#+ eval = TRUE
child <- c("Reed", "Wesley", "Eli", "Toby")
age   <- c(    17,       15,    15,      4)

s <- rep_len("", length(child))
for (i in seq_along(s)) {
  s[i] <- paste(child[i], "is", age[i], "years old")
}
s

child <- c("Reed", "Wesley", "Eli", "Toby")
age   <- c(    17,       15,    15,      4)

paste(child, "is", age, "years old")

child <- c("Reed", "Wesley", "Eli", "Toby")
age   <- c(    17,       15,    15,      4)
glue::glue("{child} is {age} years old")

dat <- tibble(child, age)
glue::glue_data(dat, "{child} is {age} years old")

gapminder %>%
  group_by(continent)

sw <- starwars %>%
  slice(1, 4, 10) %>%
  select(name, starships)
sw

sw %>%
  mutate(ships = paste(starships, collapse = "/"))

sw %>%
  rowwise() %>%
  mutate(ships = paste(starships, collapse = "/"))

sw %>%
  rowwise()

sw %>%
  mutate(n_ships = length(starships))

sw %>%
  rowwise() %>%
  mutate(n_ships = length(starships))

billboard

billboard %>%
  mutate(early_rank = min(wk1, wk2, wk3, na.rm = TRUE)) %>%
  select(artist, track, early_rank) %>%
  head(3)

billboard %>%
  rowwise() %>%
  mutate(early_rank = min(wk1, wk2, wk3, na.rm = TRUE)) %>%
  select(artist, track, early_rank) %>%
  head(3)

billboard %>%
  rowwise() %>%
  mutate(avg_rank = mean(c_across(starts_with("wk")), na.rm = TRUE)) %>%
  select(artist, track, avg_rank) %>%
  head(3)
