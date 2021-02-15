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
