pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./ETBToken.sol";
import './interfaces/SkillScience.sol';

contract SuperDeveloper is ERC721 {

    struct Developer {
        uint256 id;
        uint256 userId;
        uint256 eTBHoldings;
        uint256 generation;
        uint256 skillA;
        uint256 skillB;
    }

    event superSaiyanMerge(
        address payable owner;
        uint256 developerId;
        uint256 frontEndId;
        uint256 backEndId;
        uint256 skills;
    )

    mapping(uint256 => Developer) private developers;
    //mapping(uint256 => Developer) private developer1;
    //mapping(uint256 => Developer) private developer2;
    uint256 public generation;
    uint256 public newBirthFee = 1000000 * 1000000000;
    uint256 public nextId;
    address public admin;
    uint256 public geneTicker;

    event superSaiyanMerge(uint256 frontendId, uint256 backendId, uint256 eTBHoldings);
    event birthNewDeveloper(uint256 frontendId, uint256 backendId, uint256 eTBHoldings);

    constructor(string memory _name,
        string memory _symbol) ERC721(_name, _symbol) {
            admin = msg.sender;    
        }

    //function superSaiyanMerge(uint256 developer1Id, uint256 developer2Id) external {
        //require(developer1Id < nextId && developer2Id < nextId, 'These two developers must exist');
        //Developer storage developer1 = developers[developer1Id];
        //Developer storage developer2 = developers[developer2Id];
        //require(ownerOf(developer1Id) == msg.sender && ownerOf(developer2Id) == msg.sender, 'msg.sender must own both the developers');
        //uint256 maxGen = deverloper1.generation > developer2.generation ? developer1.generation : developer2.generation; //stuck at this line - need to find a way to correct it
        //uint256 skillA = _random(4) > 1 ? developer1.skillA : developer2.skillA;
        //uint256 skillB = _random(4) > 1 ? developer1.skillB : developer2.skillB;
        //developers[nextId] = Developer(nextId, maxGen, skillA, skillB);
        //_mint(nextId, msg.sender);
        //nextId++;
    //}

    function developersOwner() external returns (uint) {
        return developers.length;
    }

    function validMergingPair(Developer storage _frontEnd, uint256 _frontEndId, Developer storage _backend, uint256 _backEndId) {
        private view returns(bool)
        {
            if (_frontEndId == _backEndId) {
                return false;
            }

            if (_frontEnd.frontEndId == _backEndId || _frontEnd.backEndId == _backEndId) {
                return false;
            }

            if (_backEnd.frontEndId == _frontEndId || _backEnd.backEndId == _frontEndId) {
                return false;
            }

            if (_backEnd.frontEndId == 0 || _frontEnd.backEndId == 0) {
                return true;
            }

            if (_backEnd.frontEndId == _frontEnd.frontEndId || _backend.backEndId == _frontEnd.backEndId) {
                return false;
            }

            return true;
        }
    }

    function mergeablePair(uint256 _frontEndId, uint256 _backEndId) public view returns(bool) {
        require(_frontEndId > 0);
        require(_backEndId > 0);
        Developer storage frontEnd = developers[_frontEndId];
        Developer storage backEnd = developers[backEnd];
        return _isValidMergingPair(frontEnd, _frontEndId, backEnd, _backEndId) && _isStringPermitted(_backEndId, _frontEndId);

    }

    function eTBBalance(address owner) public view returns (uint) {
        return eTBTokenHoldings[owner];
    }

    function mergePair(uint256 _frontEndId, uint256 _backEndId) internal returns {
        uint256 memory skillArray;
        uint256 random = uint256(block.timestamp % 255);
        uint256 i = 1;
        uint256 index = 7;

        for (i =1; i <= 128; i=i*2) {
            if (random & i != 0) {
                skillArray[index] = uint256( _frontEndSkills % 100);
            } else {
                skillArray[index] = uint256(_backEndSkills % 100);
            }
            _frontEndSkills = _frontEndSkills / 100;
            _backEndSkills = _backEndSkills / 100;

            index = index - 1;
        }

        uint256 newSkill;

        for (i = 0; i < 8; i++) {
            newSkill = newSkill + skillArray[i];
            if (i != 7) {
                newSkill = newSkill * 100;
            }
        }

        return newSkill;
        
    }

    function getNewSkill(uint256 _eTBTokenHoldings, uint256 _frontEndId, uint256 _backEndId) {
        for (uint256 i < _nextSkillId; i <skillArray.length; i++) {
            if (_from <skillArray[i].add(newSkill)) {
                uint256 indexSkill = _from;
            }
        }
    }

    function mint() external {
        require(msg.sender == admin, 'only admin');
        developers[nextId] = Developer(nextId, 1, _random(10));
        _mint(nextId, msg.sender);
        nextId++;
    }

    function _random(uint256 max) internal view returns(uint) {
        return uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty))) % max;
    }

    modifier onlyDeveloperOwner(uint256 _developerId) {
        require(owner[msg.sender]);
        _;
    }


}