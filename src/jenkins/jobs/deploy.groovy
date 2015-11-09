def giturl = 'https://github.com/warden/testapps'

job("deploy"){
    steps {
        shell("docker rm -f app1 app2 | :")
        shell("docker run --name app1 -h app1 -d -p 4001:8484 test/app:latest ")
        shell("docker run --name app2 -h app2 -d -p 4002:8484 test/app:latest ")
    }
}