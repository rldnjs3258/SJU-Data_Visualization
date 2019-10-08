# 런던의 자전거 공유 시스템 데이터 2
#  - 1. Station ID 열을 기준으로 stations 파일에 start_station과 End_station 파일을 합친다.
#  - 2. Nan값을 확인하고 삭제한다.


# 1. 데이터 로드
raw_stations <- read.csv(file.choose())
raw_start_station <- read.csv(file.choose())
raw_End_station <- read.csv(file.choose())


# 2. 데이터 전처리 1 : 열 선택
#  - 파일 중 사용할 열만 선택한다.
station <- data.frame(raw_stations$Station.ID, raw_stations$Latitude, raw_stations$Longitude, raw_stations$Station.Name)
start_station <- data.frame(raw_start_station$start_unique, raw_start_station$frequency)
end_station <- data.frame(raw_End_station$end_unique, raw_End_station$frequency)


# 3. 데이터 전처리 2 : 열 이름 변경
colnames(station) = c("Station_ID", "Latitude", "Longitude", "Name")
colnames(start_station) = c("Station_ID", "Start_frequency")
colnames(end_station) = c("Station_ID", "End_frequency")


# 4. 데이터 전처리 3 : 열 기준 파일 합치기
#  - Station ID 열을 기준으로 stations 파일에 start_station과 End_station 파일을 합친다.
library(dplyr) # 라이브러리 로드

final_data <- left_join(station, start_station, by="Station_ID") # Station_ID 기준으로 station 파일에 start_station을 합친다.
final_data <- left_join(final_data, end_station, by="Station_ID") # Station_ID 기준으로 final_data 파일에 end_station을 합친다.
head(final_data)


# 5. Nan 확인
#  - Nan 값이 없음을 확인한다.


# 6. 저장
write.csv(final_data, "C:/Users/JIHYE/Desktop/HW2-데이터시각화_런던자전거/final.csv")
