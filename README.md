# Edge detector

In this workshop we will containerize and test a simple app: the Edge Detector. This app is written in three programming languages: `Shell`, `C++` and `Python 3`.

The `Shell` version is complete: application developed, Dockerfile written, the Github Acions pipeline is working, and all tests are passing.

The `C++` version is not complete: application developed, but Dockerfile not yet written.

The `Python 3` version is not complete either: application is not yet developed.

## Tasks

1. Copy this repository under your github account.
2. Complete the `Dockerfile` for the `C++` version. You can find it in `cpp/Dockerfile`. Use multistage build in your `Dockerfile` to compile the code then move the executable to a new clean container image. Modify the `Dockerfile` such, that it runs your program when run with `docker run ...`.
3. Uncomment the `C++` test lines in the Github Actions workflow located in `.github/workflows/test.yaml`. Watch the `Shell` and `C++` jobs as they run in parallel. Fix any error that comes up.
4. Complete the `Python 3` code located in `python3/edge-detector.py` and then complete the `Dockerfile` at the same location and uncomment the `Python 3` test lines in the workflow file.

You can move inside a code directory (i.e. `cd sh`) then run `../docker-build.sh` to build the image locally.

You can run `./run-tests.sh` from the repository root folder to test your program locally, after you've built its docker image.

You can check the content of the the build and run scripts but it would be better not to change them. They are used to build and run all application versions.

## Signal edge detector

* Read a line with 2 to 100 integer values from standard input
* For each value
    * Compare it to previous value
    * Write "1" if the value differs by more then 10 to the previous
    * If not, write "0"
    * The first output is always "0"
* The output values should be separated by a single space
* Input values are integers between 0 and 100

### Example

```
Input:
 0 32 30 27 24 28 37 33 24 13  9 13  9 13 12 14
Output:
 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0
```
