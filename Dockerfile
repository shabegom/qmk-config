FROM qmkfm/qmk_cli
# test layout ADD layout_src ./layout_src
# TODO would be nice to make this whole action more reusable parameterising `qmk setup`
RUN qmk setup zsa/qmk_firmware -b firmware20 -y
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]