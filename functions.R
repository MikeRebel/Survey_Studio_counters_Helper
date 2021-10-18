source("init.R", chdir = TRUE, encoding = "UTF8")
source("setup.R", chdir = TRUE, encoding = "UTF8")
options(scipen = 999)
options(max.print = 9999)
counter <- 1
counters_path = "counters/"
SSt_API_link <- "https://api.survey-studio.com/"
Autorisation_header <- paste0("SS-Token = ",Token1)



#передаем в функцию путь к папке и тип файлов. Возвращает все файлы этого типа в папке.
#Не смотрит вложенные директории
get_file_listing = function(file_list_path,file_type) {
     File.list <- list.files(path = file_list_path, full.names = TRUE, rec = F)
     File.list <- File.list[!file.info(File.list)$isdir]
     File.list <- File.list[grepl(file_type, File.list)]
     # File.list <- File.list[!grepl("_status", File.list)]
     # File.list <- File.list[!grepl(".error", File.list)]
     File.list
}


get_counters = function() {
     
     counters <- get_file_listing(counters_path, ".json")
     
     counters      
          
     
}

read_counter = function(counter_to_read){
     
     
     counter <- read_json(counter_to_read)
     counter
}