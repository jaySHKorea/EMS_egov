# 사내인사관리시스템
전자정부 프레임워크, 스프링을 활용한 웹 사내인사관리시스템

## 기술 스택
- 전자정부프레임워크 3.9 ( spring4 )
- maven
- JPA/hibernate
- oracle Database 11g xe
- jsp / html / js

## 폴더 구조
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
