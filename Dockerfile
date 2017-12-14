# Galaxy - metagenomics training material
#
# to build the docker image, go to root of training repo and
#    docker build -t <your_tag> -f topics/<your_topic>/docker/Dockerfile .
#
# to run image:
#    docker run -p "8080:80" -t <your_tag>

FROM bgruening/galaxy-stable

MAINTAINER Saskia Hiltemann (zazkia@gmail.com)

ENV GALAXY_CONFIG_BRAND "MYcrobiota"


# fix for hg clone (signal only works in main thread) error for some tools (from dev branch nov 2017)
ADD hg_util.py $GALAXY_ROOT/lib/tool_shed/util/hg_util.py

# install everything for tutorials
ADD install.sh /home/galaxy/install/install.sh
ADD tools.yaml /home/galaxy/install/tools.yaml
ADD workflows /home/galaxy/install/
ADD data-manager.yaml /home/galaxy/install/data-manager.yaml

# TODO: fix?
#ADD data-library.yaml /home/galaxy/install/data-library.yaml

RUN /home/galaxy/install/install.sh
