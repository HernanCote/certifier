pragma solidity ^0.4.23;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Certifier.sol";

contract TestCertifier {
    
    function testContractInstance() public {
        Certifier certifier = Certifier(DeployedAddresses.Certifier());
        Assert.equal(certifier.owner(), msg.sender, "Expected owner was not certified");
    }

    function testAddCourse() public {
        bytes32 code = "SC";
        string storage name = "Solidity Course";
        uint cost = 3;
        uint duration = 9;
        uint threshold = 80;
        bytes32[] storage codes = ["abc", "bcd", "cde"];

        Certifier certifier = Certifier(DeployedAddresses.Certifier());
        
        Assert.equal(certifier.addCourse(code, name, cost, duration, threshold, codes), 66, "Tx 66 char");
        
    }
}