# Container image that runs your code
FROM containers.pkg.github.com/github/pages/pages-actions AS pages

ADD . /

RUN ls
RUN source ./load_env_file.sh &\
    printenv &\
    ./install.sh &\
    ./build.sh &\
    ./archive.sh

