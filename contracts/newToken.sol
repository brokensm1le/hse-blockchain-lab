pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract NewMintableToken is Ownable, ERC20 {
    constructor() public ERC20("Gold", "GLD") {
        _mint(msg.sender, amount);
    }

    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    function burn(address account, uint256 amount) public onlyOwner {
        _burn(account, amount);
    }

    enum Whowin {
        Home_win,
        Draw,
        Guest_win
    }

    struct Match {
        uint id;
        string team1;
        string team2;
        Whowin whowin;
    }

    mapping(string => Match) map_matches;

    event MatchAdded(uint id, string team1, string team2, Whowin whowin);
    event MatchDeleted(uint id);

    function addMatch(uint memory id, string team1, string team2, Whowin whowin) public {
        map_matches[id] = Match(id, team1, team2, whowin);
        emit MatchAdded(id, team1, team2, whowin);
    }

    function deleteMatch(uint memory id) public {
        delete map_matches[id];
        emit MatchDeleted(id);
    }
}
