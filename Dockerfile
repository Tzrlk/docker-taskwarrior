FROM jamesnetherton/taskwarrior

WORKDIR /root

RUN apk add --no-cache \
	curl \
	py-pip

RUN pip install \
	bugwarrior \
	bugwarrior[jira] \
	taskwarrior-blocks-capsule

RUN curl -SOs https://gist.githubusercontent.com/BrianHicks/2769821/raw/7b6adf5b074d9959aafb248cc9c0fd58e047e704/graphdeps.py \
 && chmod +x graphdeps.py

COPY taskrc /root/.taskrc
COPY taskbw /root/.config/bugwarrior/bugwarriorrc

RUN touch taskrc .task 

