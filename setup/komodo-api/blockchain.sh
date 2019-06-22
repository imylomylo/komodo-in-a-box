function getrawmempool {
 #   source ~/.komodo/$CHAIN/$CHAIN.conf
    KIABMETHOD="getrawmempool"
    curl --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\":\"curltest\", \"method\": \"$KIABMETHOD\", \"params\": [true] }" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq '.' > ~/.kiabresponse
    KIABRESPONSE=`cat ~/.kiabresponse`
    message_box "$KIABMETHOD" "$KIABRESPONSE"
}

function coinsupply {
#    source ~/.komodo/$CHAIN/$CHAIN.conf
    KIABMETHOD="coinsupply"
    curl --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\":\"curltest\", \"method\": \"$KIABMETHOD\", \"params\": [] }" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq '.' > ~/.kiabresponse
    KIABRESPONSE=`cat ~/.kiabresponse`
    message_box "$KIABMETHOD" "$KIABRESPONSE"
}

function getblockchaininfo {
#    source ~/.komodo/$CHAIN/$CHAIN.conf
    KIABMETHOD="getblockchaininfo"
    curl --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\":\"curltest\", \"method\": \"$KIABMETHOD\", \"params\": [] }" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq '.' > ~/.kiabresponse
    KIABRESPONSE=`cat ~/.kiabresponse`
    message_box "$KIABMETHOD" "$KIABRESPONSE"
}

function getblockbyheight { 
    KIABMETHOD="getblock"
    curl --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\":\"curltest\", \"method\": \"$KIABMETHOD\", \"params\": [\"$HEIGHT\"] }" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq '.' > ~/.kiabresponse
    KIABRESPONSE=`cat ~/.kiabresponse`
    message_box "$KIABMETHOD" "$KIABRESPONSE"
}

function getblockbyhash { 
    KIABMETHOD="getblock"
    curl --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\":\"curltest\", \"method\": \"$KIABMETHOD\", \"params\": [\"$BLOCKHASH\"] }" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq '.' > ~/.kiabresponse
    KIABRESPONSE=`cat ~/.kiabresponse`
    message_box "$KIABMETHOD" "$KIABRESPONSE"
}