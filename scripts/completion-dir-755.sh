#!/bin/bash

# - zsh-completionsの"insecure directories"が消えなかった時の対処 #環境構築 - Qiita
#   - https://qiita.com/riku929hr/items/d2a15276e94bd2b11e75
# - ターミナルで"zsh compinit: insecure directories, run compaudit for list."が表示された際の対応について
#   - https://zenn.dev/fujishiro/scraps/ad86d76417909b

chmod 755 $(brew --prefix)/share
