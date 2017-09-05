FROM jamesnetherton/taskwarrior

RUN pip install -y \
	bugwarrior \
	bugwarrior[jira] \
	taskwarrior-blocks-capsule

RUN curl -Sso https://gist.githubusercontent.com/BrianHicks/2769821/raw/7b6adf5b074d9959aafb248cc9c0fd58e047e704/graphdeps.py \
 && chmod +x graphdeps.py

RUN task config alias.graph execute graphdeps.py \
 && task config alias.bugs  execute bugwarrior

