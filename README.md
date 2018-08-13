# graalvm-native-image-pipeline

This was inspired by this tweet https://twitter.com/rauchg/status/1024013053153570816 and the accompany code snippet https://t.co/vgHvdGqCy4 .

Initially (as can be seen in the Jenkinsfile) I wanted the slave to be a GraalVM enabled slave capable of producing the native image that I could then copy into a scratch image. The problem with runnning the native image executable on the slave is that the scratch image requires a statically linked executable (it will be missing a lot of the dynamically linked libraries) and it seems that the native-image executable when run with the --static flag doesn't know where to find stuff on RHEL/Centos (even after installing lots of stuff!) 

The inspiration above used multi stage docker builds which Openshift doesn't support, so I followed https://blog.openshift.com/chaining-builds/ to work around this.



## Deploying

You need to start minishift

    oc create graalvm-native-image-ubuntu-is.yaml
    oc create graalvm-native-image-scratch-is.yaml
    oc create graalvm-native-image-ubuntu-bc.yaml
    oc create graalvm-native-image-scratch-bc.yaml
    oc create -f pipeline.yaml
    
The first builds will fail, you will need to run the pipeline

    oc start-build graalvm-listdir-pipeline
    
Or via the Jenkins browser application or via the Openshift browser application.
