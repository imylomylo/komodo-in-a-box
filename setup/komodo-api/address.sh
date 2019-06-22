function getaddressutxos {
    source ~/.komodo/$CHAIN/$CHAIN.conf
    KIABMETHOD="getaddressutxos"
    curl --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\":\"curltest\", \"method\": \"$KIABMETHOD\", \"params\": [\"$DEVADDRESS\"] }" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq '.' > ~/.kiabresponse
    KIABRESPONSE=`cat ~/.kiabresponse`
    message_box "$KIABMETHOD" "$KIABRESPONSE"
}