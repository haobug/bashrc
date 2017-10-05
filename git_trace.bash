#!/bin/bash
git_trace()
{
set -x
export REPOT_TRACE=1
export GIT_CURL_VERBOSE=1
export GIT_TRACE=2
set +x
}

nogit_trace()
{
set -x
unset REPOT_TRACE
unset GIT_CURL_VERBOSE
unset GIT_TRACE
set +x
}
