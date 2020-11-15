# Build
mvn clean package && docker build -t com.jason-pollard/blog-site .

# RUN

docker rm -f blog-site || true && docker run -d -p 8080:8080 -p 4848:4848 --name blog-site com.jason-pollard/blog-site 

# System Test

Switch to the "-st" module and perform:

mvn compile failsafe:integration-test