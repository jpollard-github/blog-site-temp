#!/bin/bash
cd ${SCRIPT_DIR}

set -a
source .env
set +a

envsubst < create_jdbc_elements.sh > create_jdbc_env_enriched.sh
sh create_jdbc_env_enriched.sh

for f in ${SCRIPT_DIR}/init_* ${SCRIPT_DIR}/init.d/*; do
      case "$f" in
        *.sh)  echo "[Entrypoint] running $f"; . "$f" ;;
        *)     echo "[Entrypoint] ignoring $f" ;;
      esac
      echo
done

exec ${SCRIPT_DIR}/startInForeground.sh $PAYARA_ARGS 