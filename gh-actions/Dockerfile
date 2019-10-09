FROM alpine/helm

LABEL "name"="Helm test & release action"
LABEL "maintainer"="Aleksandr Beshkenadze <beshkenadze@gmail.com>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="green"
LABEL "com.github.actions.name"="Helm test & release"
LABEL "com.github.actions.description"="This is an Action to test and package and publish Helm charts to GitHub Pages."

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]