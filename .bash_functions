gbnf ()
{
    export GBN=`gbn`;

    if [ $GBN ]; then
        echo -n " ($GBN)"
    fi
}

jdunk-scp-down()
{
    scp -P 48006 jared@jdunk.com:$1 $2
}

jdunk-scp-up()
{
    scp -P 48006 $1 jared@jdunk.com:$2
}

gciad()
{
    if [ $# -ne 1 ]
    then
      echo "Usage: $0 <ISO-8601-date> (ex: 2020-01-31T13:30:59)"
      return 1
    fi
    GIT_COMMITTER_DATE="$1" git commit --amend --date="$1" --no-edit
}

aws-get-function-code()
{
    if [ $# -ne 1 ]
    then
      echo "Usage: $0 <function-name>"
      return 1
    fi

    wget -O $1.zip "$(aws lambda get-function --function-name $1 --query Code.Location|tr -d '"')"
}
