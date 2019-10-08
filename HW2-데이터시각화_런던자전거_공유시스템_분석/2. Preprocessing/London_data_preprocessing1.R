# 런던의 자전거 공유 시스템 데이터
#  - 1. 데이터 중 사용할 열을 선택하여 정제한다.
#  - 2. 사람들이 자전거를 타기 시작한 지역의 빈도수를 확인한다.
#  - 3. 사람들이 자전거를 반납한 지역의 빈도수를 확인한다.


# 1. 데이터 로드
rawdata <- read.csv(file.choose()) #데이터 로드
summary(rawdata) # summary
head(rawdata) # head


# 2. 데이터 정제 1 : 열 선택
#  - 데이터 중 사용할 열을 선택하여 정제한다.
#  - 'Journey.Duration, Journey.ID, Start.Station.ID, End.Station.ID' 열만 남기기
data <- data.frame(rawdata$Journey.Duration, rawdata$Journey.ID, rawdata$Start.Station.ID, rawdata$End.Station.ID)
summary(data)
head(data)
str(data)


# 3. 데이터 정제 2 : 열 이름 변경
colnames(data) = c("Journey.Duration", "Journey.ID", "Start.Station.ID", "End.Station.ID")
head(data)


# 4. 데이터 정제 3 : 오름정렬
#  - 'Start.Station.ID' 기준으로 오름정렬
data <- data[c(order(data$Start.Station.ID)),]
head(data)


# 5. 데이터 정제 4-1 : Start Unique 찾기
#  - 사람들이 자전거를 타기 시작한 지역의 빈도수를 확인한다.
start_unique <- unique(data$Start.Station.ID) # Start Station ID의 Unique 값
start_data <- data.frame(start_unique) # 데이터프레임 만들기


# 6. 데이터 정제 4-2
#  - unique 값이 원래 데이터에서 몇 번 나왔나 카운트하기
#  - Start Station ID의 Unique 값 카운트!
cnt = 1
for (i in start_unique){
  sum <- length(which(data$Start.Station.ID == i))
  start_data$frequency[cnt] <- sum
  cnt = cnt + 1
}
start_data
summary(start_data)


# 7. 데이터 정제 5-1 : End Unique 찾기
#  - 사람들이 자전거를 반납한 지역의 빈도수를 확인한다.
end_unique <- unique(data$End.Station.ID)
end_data <- data.frame(end_unique) # 데이터프레임 만들기


# 8. 데이터 정제 5-2
#  - unique 값이 원래 데이터에서 몇 번 나왔나 카운트하기
#  - End Station ID의 Unique 값 카운트!
cnt = 1
for (i in end_unique){
  sum <- length(which(data$End.Station.ID == i))
  end_data$frequency[cnt] <- sum
  cnt = cnt + 1
}
end_data
summary(end_data)


# 9. 저장
write.csv(start_data, "C:/Users/JIHYE/Desktop/HW - 데이터시각화_런던자전거/Start_station.csv")
write.csv(end_data, "C:/Users/JIHYE/Desktop/HW - 데이터시각화_런던자전거/End_station.csv")
