#!/bin/bash

USER_LV2_DIR="$HOME/.lv2"

rm -vrf "$USER_LV2_DIR"/subout.lv2 && \
mkdir -vp "$USER_LV2_DIR" && \
cp -va subout.lv2 "$USER_LV2_DIR"
