#!/usr/bin/env bash

java -jar schemaSpy_5.0.0.jar -dp jconn3.jar -t sybase -host sybprd.jcvi.org -port 2025 -db ab4 -u access -p access -s dbo -o ab4
