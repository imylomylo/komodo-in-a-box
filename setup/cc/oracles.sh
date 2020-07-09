function oracleslist {
  KIABMETHOD="oracleslist"
  if ps aux | grep komodod | grep $CHAIN | grep -v grep ; then
    curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"$KIABMETHOD\", \"params\": []}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result' > ~/.kiabresponse
    KIABRESPONSE=`cat ~/.kiabresponse`
    message_box "$KIABMETHOD" "$KIABRESPONSE"
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function helper_oracleslist {
  KIABMETHOD="oracleslist"
  if ps aux | grep komodod | grep $CHAIN | grep -v grep ; then
    curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"$KIABMETHOD\", \"params\": []}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result' > ~/.kiabresponse
    KIABRESPONSE=`cat ~/.kiabresponse`
    # message box removed
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function oraclesinfo {
  KIABMETHOD="oraclesinfo"
  if ps aux | grep komodod | grep $CHAIN | grep -v grep ; then
    curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"$KIABMETHOD\", \"params\": [\"$ORACLESTXID\"]}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result' > ~/.kiabresponse
    KIABRESPONSE=`cat ~/.kiabresponse`
    message_box "$KIABMETHOD" "$KIABRESPONSE"
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function helper_oraclesinfo {
  KIABMETHOD="oraclesinfo"
  if ps aux | grep komodod | grep $CHAIN | grep -v grep ; then
    curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"$KIABMETHOD\", \"params\": [\"$ORACLESTXID\"]}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result' > ~/.kiabresponse
    KIABRESPONSE=`cat ~/.kiabresponse`
    # message box removed
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function oraclescreate {
  KIABMETHOD="oraclescreate"
  if ps aux | grep komodod | grep $CHAIN | grep -v grep ; then
    curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"$KIABMETHOD\", \"params\": [\"$ORACLESNAME\", \"$ORACLESDESCRIPTION\", \"$ORACLESFORMAT\"]}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result.hex' > ~/.kiabresponse
    KIABRESPONSE=`cat ~/.kiabresponse`
    RAWHEX=$KIABRESPONSE
    sendrawtransaction
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function oraclesaddress {
  KIABMETHOD="oraclesaddress"
  if ps aux | grep komodod | grep $CHAIN | grep -v grep ; then
    # source ~/.komodo/$CHAIN/$CHAIN.conf
    curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"$KIABMETHOD\", \"params\": []}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result' > ~/.kiabresponse
    KIABRESPONSE=`cat ~/.kiabresponse`
    message_box "$KIABMETHOD" "$KIABRESPONSE"
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function oraclesfund {
  KIABMETHOD="oraclesfund"
  if ps aux | grep komodod | grep $CHAIN | grep -v grep ; then
    curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"$KIABMETHOD\", \"params\": [\"$ORACLESTXID\"]}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result.hex' > ~/.kiabresponse
    KIABRESPONSE=`cat ~/.kiabresponse`
    RAWHEX=$KIABRESPONSE
    sendrawtransaction  
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function oraclesregister {
  KIABMETHOD="oraclesregister"
  if ps aux | grep komodod | grep $CHAIN | grep -v grep ; then
    curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"$KIABMETHOD\", \"params\": [\"$ORACLESTXID\", \"$ORACLESDATAFEE\"]}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result.hex' > ~/.kiabresponse
    KIABRESPONSE=`cat ~/.kiabresponse`
    cat ~/.kiabresponse
    sleep 3
    RAWHEX=$KIABRESPONSE
    sendrawtransaction  
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function oraclessubscribe {
  KIABMETHOD="oraclessubscribe"
  if ps aux | grep komodod | grep $CHAIN | grep -v grep ; then
    SUBSCRIBERPAYMENT=0.05
    ORACLESPUBLISHERID="02eac2d2f777c1e166d970a4091fc4e908fff83459ca0be0820e15975506ade7d7"
    curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"$KIABMETHOD\", \"params\": [\"$ORACLESTXID\", \"$ORACLESPUBLISHERID\", \"$SUBSCRIBERPAYMENT\"]}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result.hex' > ~/.kiabresponse
    KIABRESPONSE=`cat ~/.kiabresponse`
    cat ~/.kiabresponse
    sleep 3
    RAWHEX=$KIABRESPONSE
    sendrawtransaction  
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}
