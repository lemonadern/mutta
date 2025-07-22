export EDITOR='nvim'
export VISUAL='nvim'

# GNU tools
path=(
    /opt/homebrew/opt/grep/libexec/gnubin(N-/)       # grep
    /opt/homebrew/opt/gawk/libexec/gnubin(N-/)       # gawk
    /opt/homebrew/opt/gnu-tar/libexec/gnubin(N-/)    # gnu-tar
    /opt/homebrew/opt/gnu-sed/libexec/gnubin(N-/)    # gnu-sed
    /opt/homebrew/opt/gnu-time/libexec/gnubin(N-/)   # gnu-time
    /opt/homebrew/opt/binutils/bin(N-/)              # binutils
    /opt/homebrew/opt/findutils/libexec/gnubin(N-/)  # findutils
    /opt/homebrew/opt/diffutils/libexec/gnubin(N-/)  # diffutils
    /opt/homebrew/opt/coreutils/libexec/gnubin(N-/)  # coreutils
    /opt/homebrew/opt/moreutils/bin(N-/)             # moreutils
    /opt/homebrew/opt/gnu-getopt/bin(N-/)            # gnu-getopt
    ${path}
)

manpath=(
    /opt/homebrew/opt/grep/libexec/gnuman(N-/)       # grep
    /opt/homebrew/opt/gawk/libexec/gnuman(N-/)       # gawk
    /opt/homebrew/opt/gnu-tar/libexec/gnuman(N-/)    # gnu-tar
    /opt/homebrew/opt/gnu-sed/libexec/gnuman(N-/)    # gnu-sed
    /opt/homebrew/opt/gnu-time/libexec/gnuman(N-/)   # gnu-time
    /opt/homebrew/opt/binutils/share/man(N-/)        # binutils
    /opt/homebrew/opt/findutils/libexec/gnuman(N-/)  # findutils
    /opt/homebrew/opt/diffutils/libexec/gnuman(N-/)  # diffutils
    /opt/homebrew/opt/coreutils/libexec/gnuman(N-/)  # coreutils
    /opt/homebrew/opt/moreutils/share/man(N-/)       # moreutils
    /opt/homebrew/opt/gnu-getopt/share/man(N-/)      # gnu-getopt
    ${manpath}
)

# For compilers to find binutils
export LDFLAGS="-L/opt/homebrew/opt/binutils/lib"
export CPPFLAGS="-I/opt/homebrew/opt/binutils/include"

. "$HOME/.cargo/env"
