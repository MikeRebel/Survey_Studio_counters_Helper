source("functions.R", chdir = TRUE, encoding = "UTF8")

# Установить ID проекта со счетчиками
projectID <- "18658"

# JSON Counters

counters <- get_counters()
counters
My_counter <- read_counter(counters[1])
My_counter
My_counter_content <- fromJSON(counters[1])
view(My_counter_content)

# API counters extraction


Headers <- NA

Headers <- add_headers("SS-Token" = "7a8c55b30e844b09b595dbfae436fb55")
Headers
PID_counter_list <- GET(paste0(SSt_API_link,"projects/",projectID,"/counters"), config = Headers)
PID_counter_list
PID_counter_list_decode <- content(PID_counter_list)
PID_counter_list_decode 
PID_counter_list_R <- as.data.table(PID_counter_list_decode$body)
PID_counter_list_R <- t(PID_counter_list_R)
View(PID_counter_list_R)

# Все проекты со счетчиками

Headers <- NA

Headers <- add_headers("SS-Token" = "7a8c55b30e844b09b595dbfae436fb55","Content-Type" =  "application/json")
Headers

json_config <- paste0("{\"projectIds\":[",projectID,"],\"includeHidden\":true}")
json_config

PID_counter_value_list <- POST(paste0(SSt_API_link,"projects/","counters"),Headers, body = json_config)
PID_counter_value_list
PID_counter_value_list_decode <- content(PID_counter_list)
PID_counter_value_list_decode
PID_counter_value_list_R <- as.data.table(PID_counter_value_list_decode$body[[1]]$counters) %>% 
     t() %>% 
     as.data.table() 
# PID_counter_value_list_R <- t(PID_counter_value_list_R)
# PID_counter_value_list_R <- as.data.table(PID_counter_value_list_R)

PID_counter_value_list_R <- PID_counter_value_list_R[,.(counteID = unlist(V1), 
                                                      counter_Name = unlist(V2), 
                                                      counter_Quota = unlist(V4),
                                                      counter_Done = unlist(V5)
                                                      
                                                       )]


compute(PID_counter_value_list_R, { 
     counter_Remain = ifelse(counter_Quota>counter_Done,counter_Quota-counter_Done,counter_Quota)
     
     })
View(PID_counter_value_list_R)
