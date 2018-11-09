pragma solidity ^0.4.24;

contract Tictoe
{
    address organiser;
    address player1;
    address player2;
    uint[3][3] game;
    uint turn;
    uint noofplayers;
    uint noofturns;
    
    constructor(){
        organiser = msg.sender;
        turn = 0;
        noofplayers = 0;
        noofturns = 0;
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
    
    
    function rowCrossed() returns (bool)
   {
       for (int i=0; i<3; i++)
       {
           if (game[i][0] == game[i][1] &&
               game[i][1] == game[i][2])
               return (true);
       }
       return(false);
   }
    
   function columnCrossed() returns (bool)
   {
       for (int i=0; i<3; i++)
       {
           if (game[0][i] == game[1][i] &&
               game[1][i] == game[2][i])
               return (true);
       }
       return(false);
   }
    
   function diagonalCrossed() returns (bool)
   {
       if (game[0][0] == game[1][1] &&
           game[1][1] == game[2][2])
           return(true);
            
       if (game[0][2] == game[1][1] &&
           game[1][1] == game[2][0])
           return(true);
    
       return(false);
   }
    

    
    function check_result(uint val) returns (uint){
        
        
       if(rowCrossed()||columnCrossed()||diagonalCrossed())
		   return 1;
	   if(noofturns>=9)
		   return 2;
	   return 0;
    }
    
    function play_game(uint x, uint y) public number_of_players(){
        uint result = 0; 
        if(turn == 0)
        {
            //player1
            game[x][y] = 1;
            turn = 1;
            noofturns += 1;
            result = check_result(uint(1));
        }
        else if(turn == 1)
        {
             //player2
             game[x][y] = 2;
             turn = 0;
             noofturns += 1;
             result = check_result(uint(2));
        }
        
        
    }
    
    
}
