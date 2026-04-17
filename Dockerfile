# 1단계: 빌드 환경 (개발 도구와 라이브러리를 포함)

FROM node:18 AS build-env
WORKDIR /app
COPY main.js .

# 2단계: 실행 환경 (오직 실행에 필요한 파일만을 가짐)
FROM gcr.io/distroless/nodejs:18
COPY --from=build-env /app /app
WORKDIR /app
CMD [ "main.js" ]
