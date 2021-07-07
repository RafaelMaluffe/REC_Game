@echo
call mvnw clean
call mvnw install -DskipTests
cd target
call java -jar recgame-0.0.1-SNAPSHOT.jar
pause