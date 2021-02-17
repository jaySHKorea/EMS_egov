# 🙎‍♀️ EMS_egovframework
웹형 사내인사관리시스템

## ✔️ 주요 기능
- 직원 정보 등록/수정/삭제
- 인증 및 인가

## ✔️ 기술 스택 및 개발 환경
![egov](https://img.shields.io/badge/eGovFramework-3.9.0-blue)
![eclipse](https://img.shields.io/badge/eclipse-4.8.0_Photon-yellow)
![openJDK](https://img.shields.io/badge/open--jdk-8-orange)
![spring](https://img.shields.io/badge/spring-4.3.22-brightgreen)
![hibernate](https://img.shields.io/badge/hibernate-3.6.10-blue)
![JPA](https://img.shields.io/badge/spring_data_JPA-1.9.4-brightgreen)
![oracle](https://img.shields.io/badge/oracle-11g_xe-red)
![log4j](https://img.shields.io/badge/Log4j-2.11.2-yellow)
![Junit](https://img.shields.io/badge/Junit-4-green)

## ✔️ 폴더 구조
```
├─src/main
│	├─ java
│	│	├─ domain
│	│	├─ repository
│	│	├─ service
│	│	└─ web
│	│		└─ dto
│	│		controllers
│	├─ resources
│	│	└─ db (SQL)
│	│		data_oracle.sql
│	│	logback.xml
│	└─webapp
│		├─ WEB-INF
│		│	├─ lib
│		│	└─ views (JSP화면)
│		│	applicationContext.xml
│		│	spring-servlet.xml
│		│	web.xml
│		└─ resources/static
│			├─ common ( nav, header, footer )
│			├─ css
│			├─ fonts
│			├─ images
│			└─ js
│				└─ app
│					index.js
└─ pom.xml
```
