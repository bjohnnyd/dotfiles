#!/bin/bash
#basic newsboat bookmark plugin for evernote using geeknote: https://github.com/pipakin/geeknote

url="$1"
title="$2"
description="$3"
feed_title="$4"

bookmark_file="${HOME}/dotfiles/newsboat/bookmarks/$(date +%F)_bookmarks.txt"

if [ ! -d $(dirname "${bookmark_file}") ]
then
	mkdir -p $(dirname "${bookmark_file}")
fi

touch "${bookmark_file}"

echo -e "${url}\t${title}\t${description}\t${feed_title}" >> "${bookmark_file}"
