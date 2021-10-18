source("functions.R", chdir = TRUE, encoding = "UTF8")


# JSON Counters

counters <- get_counters()
counters
My_counter <- read_counter(counters[1])
My_counter
My_counter_content <- fromJSON(counters[1])
view(My_counter_content)

# API counters extraction

# Установить ID проекта со счетчиками
projectID <- "18658"
Headers <- NA

Headers <- add_headers("SS-Token" = "7a8c55b30e844b09b595dbfae436fb55")
Headers
PID_counter_list <- GET(paste0(SSt_API_link,"projects/",projectID,"/counters"), Headers)
PID_counter_list
PID_counter_list_decode <- content(PID_counter_list)
PID_counter_list_decode 
View(PID_counter_list_decode)
PID_counter_list_R <- as.data.table(PID_counter_list_decode)
