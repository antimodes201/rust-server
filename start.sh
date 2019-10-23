#!/bin/bash

printf "Install Server\n"

/rust/rustserver auto-install

printf "Force Update\n"
/rust/rustserver fu

printf "Start Server\n"
/rust/rustserver start