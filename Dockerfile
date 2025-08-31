FROM cirrusci/flutter:2.10.5
WORKDIR /app
COPY . .
RUN flutter pub get
RUN flutter build apk --release --ignore-deprecation
FROM alpine:latest
COPY --from=0 /app/build/app/outputs/flutter-apk/app-release.apk /
