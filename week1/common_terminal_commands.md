# Common Terminal Commands

- Directory means folder
- Need to make sure you're in the right directory when running commands or the files won't be found

## Commands

- `ls` (lists files and directories in the current directory)
- `cd <directory name>` (change directory) e.g. `cd lab01`
- `cd ..` (go to parent directory, i.e. go up one level)
- `mkdir <directory name>` (creates a new directory)
- `pwd` (print working directory, tells you where you are)
- `rm <filename>` (deletes a file)
- `man <term>` (help manual)
- `gedit <filename> &` (open/create file in the text editor gedit) e.g. `gedit no_vowels.c &`

- If you want to move things around folders, I would suggest VLAB or lab computers and use the drag and drop interface

### Compiling and running C files

- `dcc -o <program name> <c file>` (creates executable program from a c file) e.g. `dcc -o no_vowels no_vowels.c`
- `./<program name>` (runs program) e.g. `./no_vowels`

### Note
- you can specify a path e.g. `gedit comp1521/lab01/file.c &`
- you can use * to match multiple things e.g. `gedit *.c &` to open all .c files in the directory (be very careful when removing multiple things)

### VSCode Commands
- `code <filename>` (creates/opens file) e.g. `code no_vowels.c`
- `code <directory name>` (opens a whole directory in VSCode) e.g. `code lab01`
