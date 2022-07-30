# Solidty-Funding_contract

					FUNDING CONTRACT
Overview:
	We have declared a contract named fundme within which a state variable and empty array is being declared.
	State variable-minimumusd of uint256 is declared and set to 1.
	An array named funders is declared.
	A variable owner of datatype address is declared.
	A constructor is created in which the address of sg.sender is stored to owner variable.
	For this contract, we’re going to need two main functions, one for funding and another one to withdraw.
	In Fund function, we set the minimum amount of USD to be donated.
	We check for the donated value to be greater than the minimum amount using the require statement. If the statement fails, it reverts by sending a message of “minimum amount is 1$"
	But the amount donated is in ether, so we must convert ether into USD.
	For that case, we create a libarary called “PriceConversion.sol” which imports a price consumer file from chainlink website. 
  The import syntax is given - "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
	This file is an interface which cannot be deployed on the blockchain but it consists of the function which can be used by other external contracts to emit result.
	The price of ETHER is brought by this interface file from the chainlink oracle as the blockchain itself cannot work with the external world data.
	We can contact with the external contract by using  
         •	API
         •	Address
  The address can be obtained from the Rinkeby Test network(ETH).
	This AggregatorV3Interface file gives the required API to use the external contract.
	With this, the price conversion library can be set and can be imported in our funding contract.
  Once It is imported and the condition is met, the array is being added up with the address of the funders and the amount of USD they have funded.
  For the withdraw function, only the owner of the contract must withdraw the fund, hence we create a modifier, in which the msg.sender address must match with the   owner address.
  If the condition fails, then the withdraw will fail.
	Once the condition is approved, we loop through the Funders array and change the amount donated by the funders to be 0 as we have withdrawn them.
	We reset the array for new funders to fund the contract.
	Using call function the ether is accessed using address(this).balance and withdrawn by the owner.

			


