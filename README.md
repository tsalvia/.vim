# Vim Configuration

## Getting Started

### Prerequisites

```bash:
$ sudo apt-get install vim curl
```

### Installing

1. Clone this repository.

   ```bash:
   $ cd $HOME
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

1. Open vim and install dein

   ```bash:
   :call dein#install()
   ```
