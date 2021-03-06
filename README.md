# Vim Configuration

## Getting Started

### Prerequisites

```bash:
$ sudo apt-get install vim curl git
```

### Installing

1. Clone this repository.

   ```bash:
   $ cd
   $ git clone https://github.com/tsalvia/.vim
   ```

1. Run below script.

   ```bash:
   $ mkdir -p $HOME/.vim/bundle
   $ cd $HOME/.vim/bundle
   $ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
   $ sh ./installer.sh $HOME/.vim/bundle
   ```

1. Link .vimrc to home directory.

   ```bash:
   $ ln -s $HOME/.vim/.vimrc $HOME/.vimrc
   ```

1. Install dein

   ```bash:
   $ vim
   :call dein#install()
   ```
   
   or
   
   ```bash:
   $ vim -c ":silent! call dein#install() | :q"
   ```
