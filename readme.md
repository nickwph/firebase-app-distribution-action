# Distribute To Firebase App Distribution

A very optimized version of Github Action that does the job fast.

## Super fast prepation and upload time - ~17s

Only the binary will be downloaded so it is super fast, it will be used immediately after 
downloading and installing, the whole process is just ~17s.

![super-fast-prepation-time](.docs/assets/super-fast-prepation-time.png?raw=true)

## Even faster with cache

Nothing is needed to config, after the first run the firebase tools will be cached and reused 
the next time. Version checking will be executed automatically so it will be updated on next 
run as well.

![even-faster-with-cache](.docs/assets/even-faster-with-cache.png?raw=true)

## Usage

Add the following step to your workflow.

```yml
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: nickwph/firebase-app-distribution-action@v1
        with:
          file: app-debug.apk
          app: ${{ secrets.FIREBASE_APP_ID }}
          credentials: ${{ secrets.FIREBASE_CREDENTIALS }}            # Optional: This overrides "credentials-file" and `GOOGLE_APPLICATION_CREDENTIALS`
          credentials-file: ${{ secrets.FIREBASE_CREDENTIALS_FILE }}  # Optional: This overrides environment `GOOGLE_APPLICATION_CREDENTIALS`
          release-notes: ""                    # Optional
          release-notes-file: ""               # Optional
          testers: ""                          # Optional
          testers-file: ""                     # Optional
          groups: ""                           # Optional
          groups-file: ""                      # Optional
          debug: false                         # Optional: Default false. A flag you can include to print verbose log output.
          cache: true                          # Optional: Default true. Whether to cache the firebase tools for next job, keeping this "true" will speed up the build.
          upgrade: true                        # Optional: Default true. Whether to attempt to upgrade firebase tools when cache is "true", turning this "false" will speed up the build.
          token: ${{ secrets.FIREBASE_TOKEN }} # Deprecated
```

## Google service account

According to Google, we have to start using [service account for authenticating with Firebase](https://firebase.google.com/docs/app-distribution/authenticate-service-account?platform=ios). 

### Download credentials from Firebase

To get the credentials you can go to your Firebase project -> Project settings -> Service account -> Generate new private key.

![even-faster-with-cache](.docs/assets/google-service-account.png?raw=true)

### Use credentials in this action

#### 1. Define `credentials` in this action (recommended)

Extract the content of the file and configure it as action secret `FIREBASE_CREDENTIALS`, use it on the parameter `credentials`. This action will set up the environment variable `GOOGLE_APPLICATION_CREDENTIALS` for you.

```yml
credentials: ${{ secrets.FIREBASE_CREDENTIALS }}
```

#### 2. Define `credentials-file` to use credentials in project file

Check in the credentials file in the project and configure it's path as action secret `FIREBASE_CREDENTIALS_FILE`, use it on the parameter `credentials-file`. This action will set up the environment variable `GOOGLE_APPLICATION_CREDENTIALS` for you.

```yml
credentials-file: ${{ secrets.FIREBASE_CREDENTIALS_FILE }}
```

## Limitations and improvements

1. Currently only works on linux (including macos)