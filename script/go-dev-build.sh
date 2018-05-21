# !/bin/sh
# Auhtor:
#     wikinee
# Purpose:
#     This script is for golang dev build.
# Changelog:
#     first release 2018/05/21

echo "===== CLONING ====="
git clone https://github.com/golang/tools $GOPATH/src/golang.org/x/tools
git clone https://github.com/golang/lint.git $GOPATH/src/golang.org/x/lint

echo "==== DOWNLOAD ===="
go get -u -v github.com/golang/lint
go get -u -v github.com/sqs/goreturns
go get -u -v github.com/rogpeppe/godef
go get -u -v github.com/josharian/impl
go get -u -v github.com/cweill/gotests
go get -u -v github.com/acroca/go-symbols
go get -u -v github.com/ramya-rao-a/go-outline

echo "===== INSTALL ====="
cd $GOPATH/src
go install github.com/golang/lint
go install github.com/sqs/goreturns
go install github.com/cweill/gotests
go install github.com/josharian/impl
go install github.com/rogpeppe/godef
go install golang.org/x/tools/cmd/guru
go install github.com/acroca/go-symbols
go install golang.org/x/tools/cmd/gorename
go install github.com/ramya-rao-a/go-outline