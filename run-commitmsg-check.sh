#! /usr/bin/env bash

input_file=".git/COMMIT_EDITMSG"
start_line=`cat ${input_file} | head -n 1`
type="feat|fix|perf|docs|style|refactor|test|build|defect"

passed=false

if [[ $start_line =~ (${type})(\(.*\))(\!)?(\: )(.*) ]]; then
	passed=true
fi

if [ $passed = "false" ]; then
	echo -e "\e[31m----------------------- Invalid commit message -----------------------\e[0m"
	echo -e "commit message: \e[31m${start_line}\e[0m"
	echo -e "correct format: \e[33m<type>(<scope>): <subject>\e[0m\n"
	echo -e "Allowed type values:"
	echo -e "\e[35mfeat:\e[0m         for a new feature for the user, not a few feature for build script."
	echo -e "\e[35mfix:\e[0m          for a bug fix for the user, not a fix to a build script."
	echo -e "\e[35mperf:\e[0m         for performance improvements."
	echo -e "\e[35mdocs:\e[0m         for changes to the documentation."
	echo -e "\e[35mstyle:\e[0m        for formatting changes, missing semicolons, etc."
	echo -e "\e[35mrefactor\e[0m      for refactoring production code, e.g., renaming a variable."
	echo -e "\e[35mtest:\e[0m         for adding missing tests, refactoring tests; no production code change."
	echo -e "\e[35mbuild:\e[0m        for updating build configuration, development tools or other changes irrelevant to the user."
	echo -e "\e[35mdefect:\e[0m       for fixing changes from QA feedback."
	echo -e "\e[31m----------------------------------------------------------------------\e[0m"
	exit 1
fi
