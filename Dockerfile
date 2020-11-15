FROM jpollard91/payara-mysql-8

USER payara

COPY .env ${SCRIPT_DIR}/.env

COPY create_jdbc_elements.sh ${SCRIPT_DIR}/create_jdbc_elements.sh
COPY entrypoint.sh ${SCRIPT_DIR}/entrypoint.sh

COPY ./target/blog-site.war $DEPLOY_DIR