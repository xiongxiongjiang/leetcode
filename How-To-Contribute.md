# Step 1
- Fork `https://github.com/MatrixCN/leetcode`

# Step 2
## Define a local working directory:
- `working_dir=~/workspace/github/leetcode`
- `user={your github profile name}`
- `mkdir -p $working_dir`
- `cd $working_dir`

## Clone the project which you fork
- `git clone git@github.com:$user/leetcode.git`
- `cd $working_dir/leecode`
- `git remote -v`

```json

origin	git@github.com:$user/leetcode.git (fetch)
origin	git@github.com:$user/leetcode.git (push)

```

## Add remote upstream
- `git remote add upstream git@github.com:MatrixCN/leetcode.git`
- `git remote -v`

```json

origin	git@github.com:hundredlee/leetcode.git (fetch)
origin	git@github.com:hundredlee/leetcode.git (push)
upsteam	git@github.com:MatrixCN/leetcode.git (fetch)
upsteam	git@github.com:MatrixCN/leetcode.git (push)

```


## Never push to upstream master since you do not have write access
- `git remote set-url --push upstream no_push`
- `git remote -v`

```json

origin	git@github.com:$user/leetcode.git (fetch)
origin	git@github.com:$user/leetcode.git (push)
upstream	git@github.com:MatrixCN/leetcode.git (fetch)
upstream	no_push (push)

```

# Step 3
> Keep branches synchronized

## While on your myfeature branch.
- `git fetch upstream`
- `git checkout master`
- `git rebase upstream/master`

## Now you can start writing
- `git checkout -b myfeature`

## When you finish writing
> Keep branches synchronized

- `git fetch upstream`
- `git rebase upstream/master`
- `git commit`
- `git push -f origin myfeature`

# Step
## Create a pull request in you github page.
- visit https://github.com/$user/leetcode
- Click the Compare & pull request button next to the `myfeature` branch
