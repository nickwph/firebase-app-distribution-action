# Distribute To Firebase App Distribution

A very simplified version of Github Action that does the job fast.

## Super fast prepation and upload time - ~17s

Only the binary will be downloaded so it is super fast, it will be used immediately after 
downloading and installing, the whole process is just ~17s.

![super-fast-prepation-time](.docs/assets/super-fast-prepation-time.png?raw=true)

## Even faster with cache

Nothing is needed to config, after the first run the firebase tools will be cached and reused 
the next time. Version checking will be executed automatically so it will be updated on next 
run as well.