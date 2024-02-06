// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";
import {FundFundMe, WithdrawFundMe} from "../../script/Interactions.s.sol";

contract InteractionsTest is Test {
    FundMe fundMe;
    address USER = makeAddr("user");
    uint256 constant SEND_VALUE = 0.1 ether;
    uint256 constant STARTING_VALUE = 10 ether;
    uint256 constant GAS_PRICE = 1;

    function setUp() external {
        DeployFundMe deploy = new DeployFundMe();
        vm.deal(USER, STARTING_VALUE); // This should deal Ether, not tokens
        uint256 userBalance = address(USER).balance;
        console.log("User balance after deal: %s", userBalance);
        require(
            userBalance >= STARTING_VALUE,
            "Insufficient balance for setup"
        );
        fundMe = deploy.run();
    }

    function testUserCanFundInteractions() public {
        // arrange
        FundFundMe fundFundMe = new FundFundMe();
        WithdrawFundMe withdrawFundMe = new WithdrawFundMe();

        // act
        // --fund
        vm.deal(address(fundFundMe), STARTING_VALUE);
        fundFundMe.fundFundMe(address(fundMe));

        // --withdraw
        withdrawFundMe.withdrawFundMe(address(fundMe));

        // assert
        assert(address(fundMe).balance == 0);
    }
}
