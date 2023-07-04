#!/bin/bash
git add .
git commit -m "update"
git push
hugo
cd public
git add .
git commit -m "Update something"
git push
cd ..