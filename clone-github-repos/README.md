#clone-github-repos

This script will clone all the repos of a given user and sorts them into two directories, `original` and `forked`.

If there are more than 100 repos, you need to include the page number arguement.

eg: repos 1-100 no argument required
    repos 101-200 : page number should be 2

Args:

**username** : Github username
**page number** : Page number (default: 1)
```bash
clone-github-repos <usernme> <page number> 
```
