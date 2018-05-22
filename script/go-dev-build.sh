# !/bin/sh
# Auhtor:
#     wikinee
# Purpose:
#     This script is for golang dev build.
# Changelog:
#     first release 2018/05/21

echo "===== CLONING ====="
cd $GOPATH/src
git clone https://github.com/golang/tools $GOPATH/src/golang.org/x/tools
git clone https://github.com/golang/lint.git $GOPATH/src/golang.org/lint
go install golang.org/lint

echo "==== DOWNLOAD ===="
# if you can download
go get -u -v github.com/nsf/gocode
go get -u -v github.com/tools/godep
go get -u -v github.com/sqs/goreturns
go get -u -v github.com/rogpeppe/godef
go get -u -v github.com/josharian/impl
go get -u -v github.com/cweill/gotests
go get -u -v github.com/acroca/go-symbols
go get -u -v github.com/ramya-rao-a/go-outline
go get -u -v github.com/uudashr/gopkgs/cmd/gopkgs
go get -u -v github.com/derekparker/delve/cmd/dlv

# if you cannot download use git clone
# git clone https://github.com/nsf/gocode github.com/nsf/gocode
# git clone https://github.com/tools/godep github.com/tools/godep
# git clone github.com/uudashr/gopkgs/cmd/gopkgs github.com/uudashr/gopkgs/cmd/gopkgs
# git clone https://github.com/sqs/goreturns github.com/sqs/goreturns
# git clone https://github.com/rogpeppe/godef github.com/rogpeppe/godef
# git clone https://github.com/josharian/impl github.com/josharian/impl
# git clone https://github.com/cweill/gotests github.com/cweill/gotests
# git clone https://github.com/acroca/go-symbols github.com/acroca/go-symbols
# git clone https://github.com/ramya-rao-a/go-outline github.com/ramya-rao-a/go-outline

echo "===== INSTALL ====="
cd $GOPATH/src
go install github.com/nsf/gocode
go install github.com/tools/godep
go install github.com/sqs/goreturns
go install github.com/cweill/gotests
go install github.com/josharian/impl
go install github.com/rogpeppe/godef
go install golang.org/x/tools/cmd/guru
go install github.com/acroca/go-symbols
go install golang.org/x/tools/cmd/gorename
go install github.com/ramya-rao-a/go-outline
go install github.com/uudashr/gopkgs/cmd/gopkgs