#!/usr/bin/env bash

# Utilities (pretty print)
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
function printspacer() { printf "\n---- ---- ----\n\n"; }
function respheader() { printf "${CYAN}[Response]${NC} "; }
function echospace() { printf "\n\n"; }
function curl_json() { curl -s $1 | python -m json.tool; }
function print_blue() { printf "${BLUE}$1${NC}\n"; }
function print_green() { printf "${GREEN}$1${NC}\n"; }
function print_yellow() { printf "${YELLOW}$1${NC}\n"; }

echo ""
print_blue "+ =====  =====  =====  ===== +"
print_blue "| Running Integration Tests. |"
print_blue "+ =====  =====  =====  ===== +"
echo ""

# API Address & endpoints constants
API_PORT=8080
API_BASE_URL="http://localhost:${API_PORT}"

ARTICLE_ENDPOINT="${API_BASE_URL}/articles"
USER_ENDPOINT="${API_BASE_URL}/users"

MOCKUSER1_USERNAME="sampleUser1"
MOCKUSER2_USERNAME="sampleUser2"

# Test Endpoint: User by Username
print_green "=> TESTING ENDPOINT: ${USER_ENDPOINT}/:username (User data by username)"
print_yellow "==> Get user data: $MOCKUSER1_USERNAME"
respheader
curl_json $USER_ENDPOINT/$MOCKUSER1_USERNAME
echospace

print_yellow "==> Get user data: $MOCKUSER2_USERNAME"
respheader
curl_json $USER_ENDPOINT/$MOCKUSER2_USERNAME

printspacer

# Test Endpoint: /users/:username/articles (all articles for a given user)
print_green "=> TESTING ENDPOINT: ${USER_ENDPOINT}/:username/articles (All articles for a given user)"
print_yellow "==> Get articles data for user: $MOCKUSER1_USERNAME"
respheader
curl_json $USER_ENDPOINT/$MOCKUSER1_USERNAME/articles
echospace

print_yellow "==> Get articles data for user: $MOCKUSER2_USERNAME"
respheader
curl_json $USER_ENDPOINT/$MOCKUSER2_USERNAME/articles

printspacer

# Test Endpoint: /articles (all articles)
print_green "=> TESTING ENDPOINT: ${ARTICLE_ENDPOINT} (all articles)"
respheader
curl_json $ARTICLE_ENDPOINT

printspacer

# Test Endpoint: /articles?username=[username] (all articles, filtered by a given username)
print_green "=> TESTING ENDPOINT: ${ARTICLE_ENDPOINT}?username=[username] (All articles, filtered by a given username)"
print_yellow "==> Get articles filtered by username: $MOCKUSER1_USERNAME"
respheader
curl_json $ARTICLE_ENDPOINT?username=$MOCKUSER1_USERNAME
echospace

print_yellow "==> Get articles filtered by username: $MOCKUSER2_USERNAME"
respheader
curl_json $ARTICLE_ENDPOINT?username=$MOCKUSER2_USERNAME
echo ""