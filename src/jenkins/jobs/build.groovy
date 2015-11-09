def giturl = 'https://github.com/warden/testapps'

job("build"){
    wrappers {
        golang('Go 1.5.1')
    }
    scm{
        git{
            remote {
                url(giturl)
            }
            createTag(false)
        }
    }
    steps {
        shell("go build app.go")
        shell("docker build -t test/app .")
    }
    publishers {
        downstream("deploy")
    }
}