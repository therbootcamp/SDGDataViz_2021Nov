
library(tidyverse)
library(gganimate)


# read in
basel <- read_csv('_sessions/NextSteps/1_Data/taxation.csv')
basel_map = sf::read_sf('_sessions/NextSteps/1_Data/map')

plot = basel_map %>% 
  
  # original code
  left_join(basel, by = c('TYPE' = 'quarter')) %>% 
  ggplot(aes(x = year, col = TYPE)) + 
  geom_point(aes(y = wealth_mean)) + 
  geom_line(aes(y = wealth_mean)) + 
  guides(col = FALSE) +
  theme_minimal() + 
  
  # add animation
  transition_reveal(year)

plot %>% 
  animate(renderer = gganimate::gifski_renderer())
anim_save('_sessions/NextSteps/image/lines_anim.gif')



plot = basel_map %>% 
  left_join(basel, by = c('TYPE' = 'quarter')) %>% 
  ggplot(aes(fill = wealth_mean)) + 
  geom_sf(col = 'white') + 
  guides(fill = FALSE) + 
  theme_void() +
  ggtitle("{closest_state}") +
  theme(plot.title = element_text(hjust = 0.5,size=20)) +
  transition_states(year)

plot %>% 
  animate(renderer = gganimate::gifski_renderer())

animate(p, renderer = gganimate::gifski_renderer())
anim_save('_sessions/NextSteps/image/map_anim.gif')




plot <- basel_map %>% 
  left_join(basel, 
            by = c('TYPE' = 'quarter')) %>% 
  ggplot(aes(
    x = year, col = TYPE,
    text = paste0("Quarter;",quarter,"<br>",
                  "Wealth",wealth_mean))) + 
  geom_point(aes(y = wealth_mean)) + 
  geom_line(aes(y = wealth_mean)) + 
  guides(col = FALSE) +
  theme_minimal() 

# plotlify
ggplot(plot)









