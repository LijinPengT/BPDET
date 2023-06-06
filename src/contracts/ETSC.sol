// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract ETSC {

    // register pool
    struct regInfo {
        uint timestamp;
        string cipherIDInfo;
    }
    regInfo[] registerPool;
    
    string[] certPool;

    function getRegLen() public view returns (uint length) {
        return registerPool.length;
    }

    function getCertLen() public view returns (uint length) {
        return certPool.length;
    }

    function Register(uint timestamp, string memory cipherIDInfo) public {
        registerPool.push(regInfo({
            timestamp: timestamp,
            cipherIDInfo: cipherIDInfo
        }));
    }

    function fetchRegInfo(uint index) public view returns (string memory cipherIDInfo) {
        if(registerPool.length > index){
            string memory cidinfo = registerPool[index].cipherIDInfo;
            return cidinfo;
        }
        return "empty";
        
    }

    function postCert(string memory cipherCertP) public {
        certPool.push(cipherCertP);
    }

    function receCert(uint index) public view returns (string memory cert) {
        if(certPool.length > index){
            return certPool[index];
        }
        return "empty";
    }

    // demand&response pool
    struct demandInfo {
        uint timestamp;
        uint amount;
        uint desPrice;
        string pk_dt;
        string certD;
        uint delay;
    }
    struct responseInfo {
        uint timestamp;
        string pk_sr;
        string concealLabel;
        string cipherAuthInfo;
    }
    demandInfo[] demandPool;
    responseInfo[] responsePool;

    function getDemandLen() public view returns (uint length) {
        return demandPool.length;
    }
    function getResponseLen() public view returns (uint length) {
        return responsePool.length;
    }

    function postDemand(
        uint timestamp,
        uint amount,
        uint desPrice,
        string memory pk_dt,
        string memory certD,
        uint delay
    ) public {
        demandPool.push(demandInfo({
            timestamp: timestamp,
            amount: amount,
            desPrice: desPrice,
            pk_dt: pk_dt,
            certD: certD,
            delay: delay
        }));
    }

    function resDemand(
        uint timestamp,
        string memory pk_sr,
        string memory concealLabel,
        string memory cipherAuthInfo
    ) public {
        responsePool.push(responseInfo({
            timestamp: timestamp,
            pk_sr: pk_sr,
            concealLabel: concealLabel,
            cipherAuthInfo: cipherAuthInfo
        }));
    }

    function fetchDemand(uint index) public view returns (
        uint timestamp,
        uint amount,
        uint desPrice,
        string memory pk_dt,
        string memory certD,
        uint delay
    ) {
        if(demandPool.length > index){
            uint t = demandPool[index].timestamp;
            uint amt = demandPool[index].amount;
            uint desp = demandPool[index].desPrice;
            string memory pkdt = demandPool[index].pk_dt;
            string memory certd = demandPool[index].certD;
            uint d = demandPool[index].delay;
            return (t, amt, desp, pkdt, certd, d);
        }
        return (0, 0, 0, "empty", "empty", 0);
    }

    function fetchResponse(uint index) public view returns (
        uint timestamp,
        string memory pk_sr,
        string memory concealLabel,
        string memory cipherAuthInfo
    ) {
        if(responsePool.length > index){
            uint t = responsePool[index].timestamp;
            string memory pksr = responsePool[index].pk_sr;
            string memory cl = responsePool[index].concealLabel;
            string memory cauthinfo = responsePool[index].cipherAuthInfo;
            return (t, pksr, cl, cauthinfo);
        }
        return (0, "empty", "empty", "empty");
    }

    // negotiation pool
    struct negoInfo {
        uint timestamp;
        string cl_p;
        string pk_pr;
        string cipherNegInfo;
    }
    negoInfo[] negoInfoPool;

    function getNegInfoLen() public view returns (uint length) {
        return negoInfoPool.length;
    }

    function postNegInfo(
        uint timestamp,
        string memory cl_p,
        string memory pk_pr,
        string memory cipherNegInfo
    ) public {
        negoInfoPool.push(negoInfo({
            timestamp: timestamp,
            cl_p: cl_p,
            pk_pr: pk_pr,
            cipherNegInfo: cipherNegInfo
        }));
    }

    function fetchNegInfo(uint index)
     public view returns (
        uint timestamp,
        string memory cl_p,
        string memory pk_pr,
        string memory cipherNegInfo
    ){
        if(negoInfoPool.length > index){
            uint t = negoInfoPool[index].timestamp;
            string memory clp = negoInfoPool[index].cl_p;
            string memory pkpr = negoInfoPool[index].pk_pr;
            string memory cneginfo = negoInfoPool[index].cipherNegInfo;
            return (t, clp, pkpr, cneginfo);
        }
        return (0, "empty", "empty", "empty");
    }
}
