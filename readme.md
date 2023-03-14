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
          token: ${{ secrets.FIREBASE_TOKEN }}
          release-notes: ""       # Optional
          release-notes-file: ""  # Optional
          testers: ""             # Optional
          testers-file: ""        # Optional
          groups: ""              # Optional
          groups-file: ""         # Optional
          debug: false            # Optional: Default false. A flag you can include to print verbose log output.
          cache: true             # Optional: Default true. Whether to cache the firebase tools for next job, keeping this true will speed up the build.
          upgrade: true           # Optional: Default true. Whether to attempt to upgrade firebase tools when cache is on, turning this false will speed up the build.
```

## Limitations and improvements

1. Currently only works on linux (including macos)
2. Pending to support service-credentials-file.