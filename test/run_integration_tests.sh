#!/usr/bin/env bash

echo "+ =====  =====  =====  ===== +"
echo "| Running Integration Tests. |"
echo "+ =====  =====  =====  ===== +"

# Utilities (pretty print)
function printspacer() { printf "\n\n---- ---- ----\n\n"; }
function respheader() { printf "[Response] "; }

# API Address & endpoints constants
API_PORT=8080
API_BASE_URL="http://localhost:${API_PORT}"

ARTICLE_ENDPOINT="${API_BASE_URL}/article"
USER_ENDPOINT="${API_BASE_URL}/user"

MOCKUSER1_USERNAME="sampleUser1"
MOCKUSER2_USERNAME="sampleUser2"

# Test Endpoint: All Articles
echo "=> Testing Endpoint: /article/all"
respheader
curl $ARTICLE_ENDPOINT/all

printspacer

# Test Endpoint: User by Username
echo "=> Testing Endpoint: ${USER_ENDPOINT}/username/:username"
echo "==> Get data: $MOCKUSER1_USERNAME"
respheader
curl $USER_ENDPOINT/username/$MOCKUSER1_USERNAME
echo ""

echo "==> Get data: $MOCKUSER2_USERNAME"
respheader
curl $USER_ENDPOINT/username/$MOCKUSER2_USERNAME
echo ""

printspacer

echo "=> Testing Endpoint: ${ARTICLE_ENDPOINT}/username/:username"
echo "==> Get articles written by: $MOCKUSER1_USERNAME"
respheader
curl $ARTICLE_ENDPOINT/username/$MOCKUSER1_USERNAME
echo ""

echo "==> Get articles written by: $MOCKUSER2_USERNAME"
respheader
curl $ARTICLE_ENDPOINT/username/$MOCKUSER2_USERNAME
echo ""
