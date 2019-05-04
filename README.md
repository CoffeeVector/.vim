# My vim script

## Hotkey Templates
### The `<leader><leader>` jump hotkey
Hitting `<leader><leader>` (the leader key twice) equate to searching for the next marker "<++>" and going to it.
### Skeletons
Hitting various combinations of `<leader>` and a keyword will create a skeletons of common structures, for example the for loop.
Typing `<leader>for` will type the following code into your text file.
```
for (<++>) {
	<++>
}
```
Then hitting `<leader><leader>` will jump your cursor into the conditional section, then hitting `<leader><leader>` again will jump your cursor into the block section.
