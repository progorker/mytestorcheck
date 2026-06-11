```
===========_____=======_============
  _ __ _  |_   _|__ __| |_ ___ _ _ 
 | '  \ || || |/ -_|_-<  _/ _ \ '_|
 |_|_|_\_, ||_|\___/__/\__\___/_|  
=======|__/=========================
 [ myTestor ] Unit Testing Platform
           ----- oOo -----
Check Testor's features using MySQL
====================================


-|_|-----------|___/----------------------
             Alpha Testing
------------------------------------------


-------|__/-------------------------
        RUNNING BRIDGE
------------------------------------

$) export MYTESTORPROXY_DIR=""
$) nano $MYTESTORPROXY_DIR/config.php
----> Modify myTestor account, myTestorProxy account and other settings
$) cd $MYTESTORPROXY_DIR && php ./agent.php


-------|__/-------------------------
    Controlling source versions
------------------------------------

$) export MYTESTORCHECK_DIR=""
$) nano $MYTESTORCHECK_DIR/svc-cfg.php
---> Modify myTestorProxy account and other settings
$) cd $MYTESTORCHECK_DIR && php ./svc.php


-------|__/-------------------------
          RUN TESTS
------------------------------------

$) export MYTESTORCHECK_DIR=""

$) cd $MYTESTORCHECK_DIR

$) nano ./tests-config.sql

$)-- Change accounts information

$) mysql --user=mytestorcheck --password=kunqhtsadzmopeh mytestortested

$) source ./tests.sql


```
