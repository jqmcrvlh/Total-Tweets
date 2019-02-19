
library(rtweet)

# get user IDs of accounts followed by CNN
tmls  <- get_timelines(c( "facebook", "Twitter", "instagram", "YouTube"), n = 5000)


## plot the frequency of tweets for each user over time
dt_inicio <- "2019-01-01"
dt_fim <- "2019-01-31"
tmls %>%
  dplyr::filter(created_at > dt_inicio & created_at < dt_fim ) %>%
  dplyr::group_by(screen_name) %>%
  ts_plot("days", trim = 1L) +
  ggplot2::geom_point() +
  ggplot2::theme_minimal() +
  ggplot2::theme(
    legend.title = ggplot2::element_blank(),
    legend.position = "bottom",
    plot.title = ggplot2::element_text(face = "bold")) +
  ggplot2::labs(
    x = NULL, y = NULL,
    title = "Twitters published by top social networks in January or 2019.",
    subtitle = "Twitter status (tweet) from 2019-01-01 to 2019-01-31",
    caption = "\nSource: Data collected from Twitter's REST API via rtweet"
  )