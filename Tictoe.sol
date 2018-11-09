pragma solidity ^0.4.24;

contract Tictoe
{
    address organiser;
    address player1;
    address player2;
    uint[3][3] game;
    uint turn;
    uint noofplayers;
    
    
    constructor(){
        organiser = msg.sender;
        turn = 0;
        noofplayers = 0;
        for (uint i = 0;i < 3; i++)
        {
            for (uint j = 0;j<3;j++)
            {
                game[i][j] = 0;
            }
        }
        
    }
   
    modifier number_of_players(){
        require((noofplayers == 2) ,"players either more or less");
        _;
    }
    
    function register_player(address play){
        
        if(noofplayers == 0){
            player1 = play;
            noofplayers +=1;
        }
        else if(noofplayers == 1){
            player2 = play;
            noofplayers +=1;
        }
    }
    
    function play_game() public number_of_players(){
        if(turn == 0)
        {
            //player1
            turn = 1;
        }
        else if(turn == 1)
        {
             //player2
        }
    }
    
    
}
