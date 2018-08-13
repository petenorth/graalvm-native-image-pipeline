# graalvm-native-image-pipeline

This was inspired by this tweet https://twitter.com/rauchg/status/1024013053153570816 and the accompany code snippet https://t.co/vgHvdGqCy4 .

Unfortunately Openshift doesn't support multi stage docker builds, so I followed https://blog.openshift.com/chaining-builds/ to work around this.

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
