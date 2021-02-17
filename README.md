# 사내인사관리시스템
전자정부 프레임워크, 스프링을 활용한 웹 사내인사관리시스템

## ✔️ 기술 스택 및 개발 환경
https://img.shields.io/badge/-eGovFramework-3.9.0-blue

https://img.shields.io/badge/eclipse-4.8.0 Photon-yellow
  https://img.shields.io/badge/<open-jdk>-<8>-<orange>
  https://img.shields.io/badge/<spring>-<4.3.22>-<brightgreen>
  https://img.shields.io/badge/<hibernate>-<3.6.10>-<blue>
  https://img.shields.io/badge/<spring data JPA>-<1.9.4>-<brightgreen>
  https://img.shields.io/badge/<oracle DB>-<11g xe>-<red>
  https://img.shields.io/badge/<Log4j>-<2.11.2>-<yellow>
  https://img.shields.io/badge/<Junit>-<4>-<green>


https://img.shields.io/badge/<egovframework>-<3.9.0>-<brightgreen>
- 전자정부프레임워크 3.9 ( spring4 )
- maven
- JPA/hibernate
- oracle Database 11g xe
- jsp / html / js

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
