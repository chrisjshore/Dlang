FROM opensuse/leap

WORKDIR /home

# gcc11-d (gdc-11) is built with D v2.076.1 as of 12/20/2021
RUN zypper install -y gcc11 gcc11-32bit gcc11-d gcc11-d-32bit libcurl4-32bit curl neovim

# dmd looks for cc when compiling
RUN ln -s /usr/bin/gcc-11 /usr/bin/cc
RUN curl -O https://s3.us-west-2.amazonaws.com/downloads.dlang.org/releases/2021/dmd-2.098.1-0.openSUSE.x86_64.rpm

# dmd package looks for gcc and gcc-32bit as dependencies, use --nodeps to ignore
RUN rpm --nodeps -i dmd-2.098.1-0.openSUSE.x86_64.rpm
RUN rm dmd-2.098.1-0.openSUSE.x86_64.rpm
