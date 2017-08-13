
## Basic Usage

This typically is installed via ansible. However, you could do a simpler install.


### Simple Install (no longer used)

1. Clone this repository into `~/.dotfiles/`
2. Run `scripts/make-symlinks.sh` to back up your old files and add symlinks to the files here.


### Branch Unification Concerns


### Future

1. Goal: Share dotfiles/ on github
2. Blockers
    - Branches should be condensed to one


### Branches

Never rebase a branch into master. Master is `shared` code between branches.

You should always be able to rebase master into a branch.

These branches are permanent and need to be constantly rebased from master once changes are committed to master. Branches should never have conflicts, they are more like 'addons' and 'uncomments' and 'tweaks' of master.

Rebase example: checkout `macos` and `$ git rebase master` and `$ git push -f`


#### `macos` branch

Never manage this branch from a non-macos device.

Manages some changes for a macos laptop.


#### `server` branch

Manages changes for some ubuntu servers.


#### `master` branch

Never manage this branch from a non-ubuntu desktop device.

Manages ubuntu desktop (primary computer).


### Notes

- You can use the `alias` command to see/remember all active aliases.

