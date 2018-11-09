pragma solidity ^0.4.24;

contract Tictoe
{
    address public organiser;
    address public player1;
    address public player2;
    uint[3][3]  public game;
    uint public turn;
    uint public noofplayers;
    uint public noofturns;
    
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
    
     modifier check_game(uint x,uint y){
        require((game[x][y] == 0) ,"It is filled");
        _;
    }
    
    function register_player(){
        
        if(noofplayers == 0){
            player1 = msg.sender;
            noofplayers +=1;
        }
        else if(noofplayers == 1){
            player2 = msg.sender;
            noofplayers +=1;
        }
    }
    
    
    function rowCrossed() returns (bool)
   {
       for (uint i=0; i<3; i++)
       {
           if (game[i][0] == game[i][1] &&
               game[i][1] == game[i][2] && game[i][0] !=0)
               return (true);
       }
       return(false);
   }
    
   function columnCrossed() returns (bool)
   {
       for (uint i=0; i<3; i++)
       {
           if (game[0][i] == game[1][i] &&
               game[1][i] == game[2][i] && game[0][i] !=0)
               return (true);
       }
       return(false);
   }
    
   function diagonalCrossed() returns (bool)
   {
       if (game[0][0] == game[1][1] &&
           game[1][1] == game[2][2] && game[0][0] != 0)
           return(true);
            
       if (game[0][2] == game[1][1] &&
           game[1][1] == game[2][0] && game[0][2] != 0)
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
    
    function play_game(uint x, uint y) public number_of_players() check_game(x,y)  returns (string message){
        uint result = 0; 
        if(turn == 0 && msg.sender == player1)
        {
           
            //player1
                game[x][y] = 1;
                turn = 1;
                noofturns += 1;
                result = check_result(uint(1));
                if(result == 1){
                    return ("Player1 is winner");
                    
                }
                else if(result == 2){
                    return ("Game Draw");
                }
        
           
        }
        else if(turn == 1 && msg.sender == player2)
        {
             
             //player2
                 game[x][y] = 2;
                 turn = 0;
                 noofturns += 1;
                 result = check_result(uint(2));
                 
                 if(result == 1){
                    return ("Player2 is winner");
                    
                }
                
                else if(result == 2){
                    return ("Game Draw");
                }
            
        }
        else 
        {
            return ("Not your turn");
        }
       
    
    }    
    
}
