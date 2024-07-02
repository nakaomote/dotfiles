# Rancher desktop and brew
export PATH="/Users/william.fletcher/.rd/bin:/usr/local/bin:$PATH"

if [[ -n "${VIRTUAL_ENV}" ]]; then
    export PATH="${VIRTUAL_ENV}/bin:$PATH"
fi
