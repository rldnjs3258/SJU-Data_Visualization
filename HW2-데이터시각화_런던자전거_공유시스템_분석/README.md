# 런던 자전거 공유 시스템 보고서

# 1. 서론
## (1) 문제 제기
 - 런던의 자전거 공유 시스템인 BSS, Santander Cycles, Barclays Cycle Hire의 데이터는 2010 ~ 2018년 사이의 자전거에 대한 관찰치를 2분 간격으로 기록했다. 이 데이터를 이용해 자전거 쉐어링 이용을 극대화 할 수 있는 방법을 찾아본다.

<br>

## (2) 가설
 - 런던의 자전거 공유 시스템은 런던 중심지에서 많이 이용되고, 런던 중심지에서 멀어질수록 이용 빈도가 줄어들 것이다.

<br>

## (3) 데이터 전처리
  - 데이터 전처리는 R을 이용해서 진행했으며, 자세한 코드는 이 레포지터리에서 확인할 수 있다.
#####  1) ‘journey.csv’ 파일에서 ‘Journey.Duration’, ‘Journey.ID’, ‘Start.Station.ID’, ‘End.Station.ID’ 열만 남긴다.
#####  2) ‘journey.csv’ 파일의 열 이름을 ‘Journey.Duration’, ‘Journey.ID’, ‘Start.Station.ID’, ‘End.Station.ID’로 변경한다.
#####  3) ‘journey.csv’ 파일을 'Start.Station.ID' 기준으로 오름 정렬 한다.
#####  4) ‘journey.csv’ 파일에서 사람들이 자전거를 타기 시작한 지역의 빈도수를 확인한다.
#####  5) ‘journey.csv’ 파일에서 사람들이 자전거를 반납한 지역의 빈도수를 확인한다.
#####  6) ‘stations.csv’ 파일에 ‘Station_ID’ 열을 기준으로 앞의 두 빈도수를 left join 한다.
#####  7) ‘stations.csv’ 파일의 결측치, 이상치, 중복값을 처리한다.
#####  8) 전처리를 완료한 데이터 프레임을 ‘final.csv’로 저장한다.

<br>
<hr>
<br>

# 2. 본론
## (1) 시각화
#####  1) Start Station Frequency
   - 사람들이 자전거를 타기 시작한 지역 중 가장 높은 빈도수는 Hyde Park Corner, Hyde Park 지역, 15,240회, 런던 중심지와 2.61km 떨어진 지점이었다.
   - 사람들이 자전거를 타기 시작한 지역 중 가장 낮은 빈도수는 Castalia Square, Cubitt Town 지역, 176회, 런던 중심지와 8.26km 떨어진 지점이었다.

<br>

#####  2) End Station Frequency
   - 사람들이 자전거를 반납한 지역 중 가장 높은 빈도수는 Hyde Park Corner, Hyde Park 지역, 15,353회, 런던 중심지와 2.61km 떨어진 지점이었다.
   - 사람들이 자전거를 반납한 지역 중 가장 낮은 빈도수는 Grant Road Central, Clapham Junction 지역, 73회, 런던 중심지와 5.65km 떨어진 지점이었다.

<br>

#####  3) Start Station Frequency 3 highs and 3 lows
   - 사람들이 자전거를 타기 시작한 지역 중 가장 높은 빈도수는 Hyde Park Corner, Hyde Park 지역, 15,240회, 런던 중심지와 2.61km 떨어진 지점이었다.
   - 사람들이 자전거를 타기 시작한 지역 중 두 번째로 높은 빈도수는 Belgrove Street, King's Cross 지역, 13,086회, 런던 중심지와 2.41km 떨어진 지점이었다.
   - 사람들이 자전거를 타기 시작한 지역 중 세 번째로 높은 빈도수는 Waterloo Station 2, Waterloo 지역, 10,582회, 런던 중심지와 1.15km 떨어진 지점이었다.
   - 사람들이 자전거를 타기 시작한 지역 중 가장 낮은 빈도수는 Castalia Square, Cubitt Town 지역, 176회, 런던 중심지와 8.26km 떨어진 지점이었다.
   - 사람들이 자전거를 타기 시작한 지역 중 두 번째로 낮은 빈도수는 Lord's, St. John's Wood 지역, 177회, 런던 중심지와 4.01km 떨어진 지점이었다.
   - 사람들이 자전거를 타기 시작한 지역 중 세 번째로 낮은 빈도수는 Teviot Street, Poplar 지역, 202회, 런던 중심지와 8.22km 떨어진 지점이었다.

<br>

##### 4) End Station Frequency 3 highs and 3 lows
   - 사람들이 자전거를 반납한 지역 중 가장 높은 빈도수는 Hyde Park Corner, Hyde Park 지역, 15,353회, 런던 중심지와 2.61km 떨어진 지점이었다.
   - 사람들이 자전거를 반납한 지역 중 두 번째로 높은 빈도수는 Belgrove Street, King's Cross 지역, 12,826회, 런던 중심지와 2.41km 떨어진 지점이었다.
   - 사람들이 자전거를 반납한 지역 중 세 번째로 높은 빈도수는 Albert Gate, Hyde Park 지역, 10,570회, 런던 중심지와 2.60km 떨어진 지점이었다.
   - 사람들이 자전거를 반납한 지역 중 가장 낮은 빈도수는 Grant Road Central, Clapham Junction 지역, 73회, 런던 중심지와 5.65km 떨어진 지점이었다.
   - 사람들이 자전거를 반납한 지역 중 두 번째로 낮은 빈도수는 Lord's, St. John's Wood 지역, 126회, 런던 중심지와 4.01km 떨어진 지점이었다.
   - 사람들이 자전거를 반납한 지역 중 세 번째로 낮은 빈도수는 Malmesbury Road, Bow 지역, 193회, 런던 중심지와 7.35km 떨어진 지점이었다.

<br>

## (2) 패턴 발견
  - 사람들이 자전거를 타기 시작한 지역 중 높은 빈도수의 지역은 런던 중심지와 1.15 ~ 2.61km 떨어져 있었다.
  - 사람들이 자전거를 반납한 지역 중 높은 빈도수의 지역은 런던 중심지와 2.41 ~ 2.61km 떨어져 있었다.
  - 사람들이 자전거를 타기 시작한 지역 중 낮은 빈도수의 지역은 런던 중심지와 4.01 ~ 8.26km 떨어져 있었다.
  - 사람들이 자전거를 반납한 지역 중 낮은 빈도수의 지역은 런던 중심지와 4.01 ~ 7.35km 떨어져 있었다.

<br>
<hr>
<br>

3. 결론
 - 런던의 자전거 공유 시스템은 런던 중심지에서 많이 이용되고, 런던 중심지에서 멀어질수록 이용 빈도가 줄어들었다. 런던의 자전거 쉐어링 이용을 극대화 하려면 런던 중심지에 자전거를 많이 배치하고, 런던 중심지에서 멀어질수록 적게 배치하는 것이 효율적이다.
