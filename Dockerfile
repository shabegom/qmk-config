FROM qmkfm/qmk_firmware

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]