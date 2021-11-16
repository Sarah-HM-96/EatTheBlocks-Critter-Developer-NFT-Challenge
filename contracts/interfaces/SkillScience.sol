pragma solidity ^0.8.0;

interface SkillScience {
    function isSkillScience() public returns (bool);

    function mixSkills(uint256 skill1, uint256 skill2) public returns (uint256);
}