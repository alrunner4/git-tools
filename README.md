### `nix profile add github:alrunner4/git-tools`
Install these tools into your profile.

### `git-index-dates $index_paths_to_CR2_files`
Creates timestamped index entries for CR2 image files under the tree named
ORIGINALS-DATED.

### `git promisor-flush`
Deletes all packfiles that were fulfilled from a promisor remote. Reading
contained objects will then require another promisor fulfillment.

### `git store-files $filenames`
Move working files referred to by `$filenames` into the object store,
removing them from the work tree.

### `git todo-update-index`
Reads `update-index --index-info` entries from `$GIT_DIR/index-info.todo`
into the index. `index-info.todo` can be appended-to to defer index
updates for batching.
