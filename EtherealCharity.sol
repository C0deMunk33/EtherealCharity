pragma solidity ^0.4.18;
import "./EtherealFoundationOwned.sol";

contract EtherealCharity  is EtherealFoundationOwned{
    string public constant CONTRACT_NAME = "EtherealCharity";
    string public constant CONTRACT_VERSION = "A";
    string public constant CAUSE = "EtherealCharity Creation";
    string public constant URL = "none";
    
    
    event RecievedDonation(address indexed from, uint256 value, string note);
    function Donate(string note)  public payable{
        RecievedDonation(msg.sender, msg.value, note);
    }
    
    //this is the fallback
    event RecievedAnonDonation(address indexed from, uint256 value);
	function () payable public {
		RecievedAnonDonation(msg.sender, msg.value);		
	}
	
	event TransferedEth(address indexed to, uint256 value);
	function TransferEth(address to, uint256 value) public onlyOwner{
	    require(this.balance >= value);
	    
        if(value >0)
		{
			to.transfer(value);
			TransferedEth(to, value);
		}   
	}
}