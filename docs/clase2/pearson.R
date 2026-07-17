library(tidyverse)

padres.hijos <- read.table("http://stat-www.berkeley.edu/users/juliab/141C/pearson.dat",sep=" ")
plot(padres.hijos[,-1], xlab="Estatura de los padres", ylab="Estatura de los hijos")

library(UsingR)

padres_hijos <- father.son

ggplot(padres_hijos, aes(x = fheight, y = sheight)) +
  geom_point(alpha = 0.4, position = position_jitter(width = 0.3, height = 0.3)) +
 geom_smooth(method = "lm", se = TRUE, color = "steelblue") +
  geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "gray50") +
  labs(
    title = "Estatura de padres vs. estatura de hijos",
    subtitle = "n = 1078",
    x = "Estatura del padre",
    y = "Estatura del hijo"
  ) +
  theme_minimal()


promedios <- padres_hijos %>%
  mutate(fheight_redondeado = round(fheight)) %>%
  group_by(fheight_redondeado) %>%
  summarise(hijo_prom = mean(sheight, na.rm = TRUE), n = n())

ggplot(padres_hijos, aes(x = fheight, y = sheight)) +
  geom_point(alpha = 0.4, position = position_jitter(width = 0.3, height = 0.3)) +
  #geom_smooth(method = "lm", se = TRUE, color = "steelblue") +
  #geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "gray50") +
  #geom_point(data = promedios, aes(x = fheight_redondeado, y = hijo_prom),
             color = "red", size = 3) +
  labs(
    title = "Estatura de padres vs. estatura de hijos",
    subtitle = "n = 1078 | puntos rojos = promedio de hijos por cada valor de estatura del padre",
    x = "Estatura del padre",
    y = "Estatura del hijo"
  ) +
  theme_minimal()
