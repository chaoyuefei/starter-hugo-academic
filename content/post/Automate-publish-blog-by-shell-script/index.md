---
title: How to auto publish your personal website by using shell script?
subtitle: Building your first personal website using hexo and github pages is a straightforward process. However, it can become tedious to repeatedly enter multiple commands in the terminal for even minor modifications. So I came up with an idea to employ a shell script as a life-saving measure 🥳.

# Summary for listings and search engines
summary: Building your first personal website using hexo and github pages is a straightforward process. However, it can become tedious to repeatedly enter multiple commands in the terminal for even minor modifications. So I came up with an idea to employ a shell script as a life-saving measure 🥳.

# Link this post with a project
projects: []

# Date published
date: '2023-07-04T00:00:00Z'

# Date updated
lastmod: '2023-07-04T00:00:00Z'

# Is this an unpublished draft?
draft: false

# Show this page in the Featured widget?
featured: false

# Featured image
# Place an image named `featured.jpg/png` in this page's folder and customize its options here.
# image:
#   caption: 'Image credit: [**Unsplash**](https://unsplash.com/photos/CpkOjOcXdUY)'
#   focal_point: ''
#   placement: 2
#   preview_only: false

authors:
  - admin
#   - 吳恩達

tags:
  - Academic
  - 开源
  - Tricks

categories:
  - Tricks
  - 教程
---
Here is the script. 
```shell
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
```
Detailed steps: 
1. Go to your website's folder and create a script file `script.sh`
2. Add the following code to the file:
```shell
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
```
3. Save the file and close it.
4. Make the script executable with `chmod +x script.sh`
5. Run the script with `./script.sh`