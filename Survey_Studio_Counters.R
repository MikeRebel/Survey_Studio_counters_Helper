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

Headers <- add_headers(Autorisation_header,"accept: application/json")

# Headers <- add_headers(auth_token = Autorisation_header)
Headers
PID_counter_list <- GET(paste0(SSt_API_link,"projects/",projectID,"/counters"), config=Headers)
PID_counter_list
PID_counter_list_decode <- content(PID_counter_list)
PID_counter_list_decode 
View(PID_counter_list_decode)
