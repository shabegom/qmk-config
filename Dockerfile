FROM qmkfm/qmk_cli
# test layout ADD layout_src ./layout_src
RUN qmk setup zsa/qmk_firmware -b firmware20 -y
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]