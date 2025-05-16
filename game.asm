
INCLUDE Irvine32.inc
includelib WinMM.Lib
include macros.inc

PlaySound PROTO,
        pszSound:PTR BYTE, 
        hmod:DWORD,
        fdwSound:DWORD

.data
    ;SOUNDS
   SND_FILENAME DWORD 00020000h
SND_LOOP DWORD  00000008h
SND_ASYNC DWORD 00000001h
SND_NOSTOP DWORD 00000010h

file5 BYTE "among_us_trap_remix.wav",0
file1 BYTE "oooeee.wav",0
file2 BYTE "criquet.wav",0


 
PACMAN_ART db '                 RRRR  RRRR  RRR RRR   RR R    RRRR  RRRR  RRRR   RRRR  RR R  RRRR  RRRR ',13,10
           db '                          (RRQR\(RRRR\(RRR/RRR) (RR/R)  (RRQR\(RRRR\(RR)    RRQR (RR/R)(RR)  (RRRR\',13,10
           db '                           )RRR( RRQR/ )R((R(__  )RR(    )RRR( RRQR/ RRRR)/RRRRRR )RR(  RRRR))RRQR',13,10
           db '                          (RRQR/(RRRR)(RRR\RRR) (RR\R)  (RRQR/(RRRR)(RR)  \RR/\RR(RR\R)(RR)  (RRRR)',13,10 
           db '                           RRRR  RR R  RRR RRR   RR R    RRRR  RR R  RRRR  RR  RR RR R  RRRR  R  R ',13,10
           db 0
       
                                                 
                                                                      
STAT             DB '                                           _   _   _   _   _     ',13,10
                  DB '                                          / \ / \ / \ / \ / \      ',13,10
                  DB '                                         ( S | T | A | R | T )   ',13,10
                  DB '                                          \_/ \_/ \_/ \_/ \_/      ',13,10
                  DB 0   

INSTRUCTIONS    DB '                                _   _   _   _   _   _   _   _   _   _   _   _   ',13,10
                DB '                               / \ / \ / \ / \ / \ / \ / \ / \ / \ / \ / \ / \ ',13,10
                DB '                              ( I | n | s | t | r | u | c | t | i | o | n | s )',13,10
                DB '                               \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/',13,10
                DB 0

HIGHSCORE    DB '                                    _   _   _   _   _   _   _   _   _   ',13,10
              DB '                                   / \ / \ / \ / \ / \ / \ / \ / \ / \ ',13,10
              DB '                                  ( H | i | g | h | S | c | o | r | e ) ',13,10
              DB '                                   \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/',13,10
              DB 0            
EXITED           DB '                                              _   _   _   _    ',13,10
                 DB '                                             / \ / \ / \ / \   ',13,10
                 DB '                                            ( E | x | i | t )  ',13,10
                 DB '                                             \_/ \_/ \_/ \_/  ',13,10
                 DB 0
                                           
 POINTER            DB'  <<<<<<<<<<<<<<<<   ',13,10
                    DB 0

pauseScreen         db'                    ______       _     _    _    _______  ',13,10
                    db'                             (_____ \ /\  | |   | |  | |  (_______)',13,10
                    db'                              _____) )  \ | |   | |   \ \  _____   ',13,10
                    db'                             |  ____/ /\ \| |   | |    \ \|  ___)  ',13,10
                    db'                             | |   | |__| | |___| |_____) ) |_____ ',13,10
                    db'                             |_|   |______|\______(______/|_______)',13,10
         
                    db'                                                                                ',13,10
                    db 0

INSTRUCTIONS_SCREEN            db'Controls:                                                                                        ',13,10
                               db'                                                                                                 ',13,10
                               db' -Use the ( a , d) to move Paddle.                                            ',13,10
                               db' Break all the bricks on the screen using the ball while keeping it in play with the paddle. Clear the level to progress.',13,10
                               db'                                                                                                 ',13,10
                               db' Gameplay:                                                                                       ',13,10
                               db'                                                                                                 ',13,10
                               db' 1-Prevent the ball from falling below the paddle by bouncing it back.                           ',13,10
                               db' 2-The ball bounces off walls, the paddle, and bricks.                                           ',13,10
                               db' 3-Eating a power pellet turns the ghosts blue, allowing Pac-Man to eat them for a limited time. ',13,10
                               db' 4-Eating fruits for extra points may appear at certain times in the maze.                       ',13,10
                               db'                                                                                                 ',13,10
                               db' Scoring:                                                                                        ',13,10
                               db'                                                                                                 ',13,10
                               db' 1-Each brick you destroy earns you points.                                                      ',13,10
                               db' 2-Some bricks might require multiple hits to break.                                             ',13,10
                               db'                                                                                                 ',13,10
                               db' Power-ups:                                                                                      ',13,10
                               db'                                                                                                 ',13,10
                               db' 1-Fast Ball: Increases ball speed to make it harder.                                            ',13,10
                               db' 2-Reduces paddle width.                                                                         ',13,10
                               db' 3-Extra Ball: Adds an extra ball into play.                                                     ',13,10
                               db'                                                                                                 ',13,10
                               db' Lives:                                                                                          ',13,10
                               db'                                                                                                 ',13,10
                               db' 1-You start with 3 lives (default).                                                             ',13,10
                               db' 2-You lose a life if the ball falls below the paddle.                                           ',13,10
                               db'                                                                                                 ',13,10
                               db' Game Over:                                                                                      ',13,10
                               db'                                                                                                 ',13,10
                               db' The game ends if you lose all your lives.                                                       ',13,10
                               db 0
                               
YouWon   db'                    _______                                     ___           _            ',13,10
                  db'                 / _____)                            _        | |      _   (_)             ',13,10
                  db'                | /      ___  ____   ____  ____ ____| |_ _   _| | ____| |_  _  ___  ____     ',13,10
                  db'                | |     / _ \|  _ \ / _  |/ ___) _  |  _) | | | |/ _  |  _)| |/ _ \|  _ \   ',13,10
                  db'                | \____| |_| | | | ( ( | | |  ( ( | | |_| |_| | ( ( | | |__| | |_| | | | |   ',13,10
                  db'                 \______)___/|_| |_|\_|| |_|   \_||_|\___)____|_|\_||_|\___)_|\___/|_| |_|  ',13,10
                  db'                          _     _              _  _  _                                      ',13,10
                  db'                         | |   | |            | || || |                               ',13,10
                  db'                         | |___| |__  _   _   | || || | ___  ____                      ',13,10
                  db'                          \_____/ _ \| | | |  | ||_|| |/ _ \|  _ \                     ',13,10
                  db'                            ___| |_| | |_| |  | |___| | |_| | | | |                    ',13,10
                  db'                           (___)\___/ \____|   \______|\___/|_| |_|         ',13,10
                  db 0                                                                                              
                  
  GameOverScreen  db'                  ______                                       _            _                   ',13,10
            db'                            / _____)  /\  |  ___ \(_______)   / ___ \| |  | (_______(_____ \       ',13,10
            db'                           | /  ___  /  \ | | _ | |_____     | |   | | |  | |_____   _____) )      ',13,10
            db'                           | | (___)/ /\ \| || || |  ___)    | |   | |\ \/ /|  ___) (_____ (       ',13,10
            db'                           | \____/| |__| | || || | |_____   | |___| | \  / | |_____      | |      ',13,10
            db'                            \_____/|______|_||_||_|_______)   \_____/   \/  |_______)     |_|      ',13,10
            db 0              
                         anim1      db"        )        ",13,10
                                    db"        (        ",13,10
                                    db"       .-`-.     ",13,10
                                    db"       :   :     ",13,10
                                    db"       :TNT:     ",13,10
                                    db"       :___:     ",13,10,0d
                                    db"                 ",13,10
                         anim2      db"       \|/       ",13,10
                                    db"      - o -      ",13,10
                                    db"       /-`-.     ",13,10
                                    db"       :   :     ",13,10
                                    db"       :TNT:     ",13,10
                                    db"       :___:     ",13,10,0
                                    db"                 ",13,10
                         anim3      db"       .---.     ",13,10
                                    db"       : | :     ",13,10
                                    db"       :-o-:     ",13,10
                                    db"       :_|_:     ",13,10,0
                                    db"                 ",13,10
                         anim4      db"       .---.     ",13,10
                                    db"       (\|/)     ",13,10
                                    db"       --0--     ",13,10
                                    db"       (/|\)     ",13,10,0
                                    db"                 ",13,10
                         anim5      db"      '.\|/.'    ",13,10
                                    db"      (\   /)    ",13,10
                                    db"      - -O- -    ",13,10
                                    db"      (/   \)    ",13,10
                                    db"      ,'/|\'.    ",13,10,0
                         anim6      db"   '.  \ | /  ,' ",13,10
                                    db"     `. `.' ,'   ",13,10
                                    db"    ( .`.|,' .)  ",13,10
                                    db"    - ~ -0- ~ -  ",13,10
                                    db"    (            ",13,10,0
                         anim7      db"                 ",13,10
                                    db"   ','|'.` )     ",13,10
                                    db"     .' .'. '.   ",13,10
                                    db"   ,'  / | \  '. ",13,10
                                    db"       \ '  '    ",13,10
                                    db"    ` . `.' ,'   ",13,10
                                    db"    . `` ,'. '   ",13,10
                                    db"      ~ (   ~ -  ",13,10
                                    db"   '             ",13,10,0
                        anim8       db"                 ",13,10
                                    db"   . ','|` ` .   ",13,10
                                    db"     .'  '  '    ",13,10
                                    db"   ,   ' , '  `  ",13,10,0
                        anim9       db"                 ",13,10
                                    db"      (  ) (     ",13,10
                                    db"       ) ( )     ",13,10
                                    db"       (  )      ",13,10
                                    db"        ) /      ",13,10
                                    db"       ,---.     ",13,10,0


remainingTime dword 240


numbers dd 100 dup(0)
numCount dd 0
newNumber dd 0

i db 0
j db 0
maxRow db 0
maxCol db 0
rows BYTE 3
cols BYTE 7
Brick BYTE "     ", 0
SpBrickChar db "  @  ", 0
Space BYTE "     ", 0
Space2 BYTE "     ", 0
x BYTE ?
randSpace db "                                   ",0
ball db "  ",0
menuSelect db 1
GameScreenSize dd 3490

strScore BYTE " Score : ",0
score dw 0
levelNum db 1
inputChar BYTE ?


TimeUpMessage DB 'Time is up! Game Over!', 0

prompt1 db "Enter your name:",0
names db 20 dup (32)
strName db "Name:",0

livesString db "Lives:",0
lives3 db 3,' ',3,' ',3,0
lives2 db 3,' ',3,0
lives1 db 3,0
livesCount db 3
temp db 95
;-------------
; FILE HANDLING 
;-------------
HS1 BYTE "               HIGH SCORES  ",0AH,0

 BUFFER_SIZE = 501
 PRMPT BYTE "NAME                  SCORE               LEVEL",0AH,0
  filename BYTE "highscores.txt",0
fileHandle Handle  ?
buffer BYTE BUFFER_SIZE DUP(?)
stringLength DWORD ?
    ;prompt1 BYTE "Cannot create file",0dh,0ah,0
    prompt2 BYTE "Enter message: ",0
    prompt4 BYTE "Enter size: ",0
    prompt3 BYTE "Enter a Number: ",0
    task1arr db 10 dup(0)
    task1arrsize db ?
	swapped db 0
   a dd ?
   b dd ?
   bytesW dd ?
   q db ?
  temp1 dd ?
  temp2 dd ?
    Istr BYTE 11 DUP(0)    ; Buffer to store the resulting string (including null terminator)
    len DWORD ? 
    
    cc1 db 0
    Press0 BYTE "Press '0' to exit game",0ah,0
Press1 BYTE "Press '1' to back to the menu",0ah,0
initialColor dword ?
lightenedColor dword ?
increment db 50

paddleLength db 28
paddleLength2 db 14

paddleYPos db 42
paddleXPos db 0

ballXPos db 27
ballYPos db 0

ballVelocityX db -1
ballVelocityY db 1
paddle db "                            ",0

yPosBrick db 3,6,9
xPosBrick db 25

bricksStart db 25,35,45,55,65,75,85
bricksEnd db 30,40,50,60,70,80,90

BrickWidth db 5

brickGrid BYTE 3 DUP(7 DUP(1))
brickRemHelp BYTE 3 DUP(7 DUP(2))
brickGrid3 BYTE 3 DUP(7 DUP(3))


.code
;----------
 main PROC
;-----------
 mov remainingTime, 240
 Call InitializingFile
  mov eax, SND_FILENAME;; pszSound is a file name
or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file5
invoke PlaySound, esi, 0, eax
 ;Logo Page
  CAll DisplayLogo
  call clrscr
  Call DisplayMenu

  mov eax,black
 Call SetTextColor
 ret
 main ENDP

 


 ;------------
  Level1 PROC
 ;------------

 mov eax, SND_FILENAME;; pszSound is a file name
or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file5
invoke PlaySound, esi, 0, eax
 mov score,0
  startGame:
    
    call GetMaxXY
    mov maxRow, al   
    mov maxCol, dl
    sub maxRow,2
    push ebx
    movzx ebx,maxRow
    add bl,15
    mov ballYPos,bl
    pop ebx
    add maxRow,2
   
     push ebx
     push eax
     push edx
    movzx ebx,maxRow
    mov eax,6
    mov dl,2
    mul dl
    sub ebx,eax
    mov paddleXPos,bl
    dec paddleXPos
    pop edx
    pop eax
    pop ebx

    Call DisplayGameScr
    ;Main  Game Code
  gamePlay:

  comment @
 
    cmp remainingTime, 0
    je timeUp 

    ;call DelayOneSecond
   

       dec remainingTime
@
   moveBall:
    Call VanishPrevBall
    ;call RandomizeBallDirection
    Call BallMovementHandle
    Call CreateBall
   mov eax,180
   Call Delay
    call ReadKey
    mov inputChar, al
    cmp inputChar, 'x'
    je exitGame
    ;cmp inputChar, 'w'
    ;je moveBall
    ;cmp inputChar, 's'
    ;je moveDown
    cmp inputChar, 'a'
    je moveLeft
    cmp inputChar, 'd'
    je moveRight
    cmp inputChar, 'p'
    je PauseDisplay
    cmp inputChar, ' '
    je gamePlay
     movzx eax,paddleXPos
     mov edx,eax
     inc edx
    jmp gamePlay
  
 moveLeft:
    sub paddleYPos,2
    cmp paddleYPos,2
    jle moveRight

    ;call CheckCollision
    call createPaddle
    jmp gamePlay
moveRight:
 add paddleYPos,2
 mov bl,90
cmp paddleYPos,bl
je moveLeft
   ; call CheckCollision
      call createPaddle
    jmp gamePlay
PauseDisplay:
mov eax,blue(blue*16) 
Call SetTextColor
Call ClrScr
mov dh,10
mov dl,10
Call GotoXy
mov eax,White(Blue*16)
Call SetTextColor
mov edx,offset pauseScreen
Call WriteString
mov ecx,6
l2:
mov edx,offset Space2
call writeString
loop l2
Call waitmsg
Call DisplayGameScr
jmp gamePlay


 exitgame:
  mov eax,black
 Call SetTextColor
 Level1 ENDP
 DisplayMenu PROC
 ;START MENU
    mov eax,white
    Call SettextColor
    point1:
        mov dl,70
        mov dh,3
        call gotoxy
        mov edx,offset POINTER
        call writestring
        mov menuSelect,1
    jmp start_tab

    point2:
        mov dl,80
        mov dh,9
        call gotoxy
        mov edx,offset POINTER
        call writestring
        mov menuSelect,2
    jmp start_tab

    point3:
        mov dl,70
        mov dh,16
        call gotoxy
        mov edx,offset POINTER
        call writestring
        mov menuSelect,3
     jmp start_tab
     point4:
        mov dl,70
        mov dh,23
        call gotoxy
        mov edx,offset POINTER
        call writestring
        mov menuSelect,4

    start_tab:
    mov eax,white
    Call SettextColor
    mov dl,0
    mov dh,1
    call gotoxy
    mov edx,offset STAT
    call writestring

    mov dl,0
    mov dh,7
    call gotoxy
    mov edx,offset INSTRUCTIONS
    call writestring

    mov dl,0
    mov dh,14
    call gotoxy
    mov edx,offset HIGHSCORE
    call writestring

    mov dl,0
    mov dh,21
    call gotoxy
    mov edx,offset EXITED
    call writestring
    
    
    call readchar
    call clrscr
    cmp al,'1'
    je point1
    cmp al,'2'
    je point2
    cmp al,'3'
    je point3
     cmp al,'4'
    je point4
    cmp al,13
    je selection


    selection:
    cmp menuSelect,1
    je startGame
    cmp menuSelect,2
    je INSTRUCTIONSSCREEN
    cmp menuSelect,3
    je HighScoreScreen
    cmp menuSelect,4
    je exitgame

    StartGame:
    Call Level1
    ;Call Level2
    ;call Level3
    INSTRUCTIONSSCREEN:
    mov dl,0 
    mov dh,0
    call gotoxy
    mov edx,offset INSTRUCTIONS_SCREEN
    call writestring
    call readchar
    call clrscr
    cmp al,27
    je point2
    jmp INSTRUCTIONSSCREEN

    HighScoreScreen:
    Call clrscr 
mov eax, SND_FILENAME
;or eax, SND_LOOP
or eax, SND_ASYNC
mov esi , OFFSET file2
invoke PlaySound, esi, 0, eax
mov  edx, offset HS1
call writestring

mov edx, offset buffer
call writestring

MOV EDX, offset Press0
call writestring
MOV EDX, offset Press1
call writestring
call readint
cmp al, 0
je GLOBAL_EXIT
call clrscr
call DisplayMenu
    exitgame:
    ret




 DisplayMenu ENDP
 ;Display Whole Game 


 DisplayGameScr PROC
 
 mov eax ,black
 mov bl,16
 mul bl
 Call SetTextColor
 Call clrScr

    mov edx,offset randSpace
    call WriteString

    mov eax,white
    Call SetTextColor
    mov edx,offset strName
    call WriteString
    mov edx,offset names
     call WriteString

      mov eax,black
    Call SetTextColor
     mov edx,offset Space2
     call WriteString

      mov eax,white
    Call SetTextColor
      mov edx,offset strScore
    call WriteString
    movzx eax,score
     call WriteDec

     mov eax,black
    Call SetTextColor
     mov edx,offset Space2
     call WriteString

     cmp livesCount,3
     je PrintFor3
      cmp livesCount,2
     je PrintFor2
      cmp livesCount,1
     je PrintFor1
     PrintFor3:
      mov eax,white
    Call SetTextColor
      mov edx,offset livesString
    call WriteString
      mov edx,offset lives3
    call WriteString
    jmp GoNext
     PrintFor2:
      mov eax,white
    Call SetTextColor
      mov edx,offset livesString
    call WriteString
      mov edx,offset lives2
    call WriteString
    jmp GoNext
     PrintFor1:
      mov eax,white
    Call SetTextColor
      mov edx,offset livesString
    call WriteString
      mov edx,offset lives1
    call WriteString
     mov eax,black
    Call SetTextColor
   
    
  
    jmp GoNext
  GoNext: 
   
Call Crlf
Call Crlf


   call Randomize
    mov eax, 7 
    call SetTextColor
    movzx ecx, rows
        mov edi, OFFSET yPosBrick
        mov esi, OFFSET brickGrid
OuterLoop:
 mov eax,0
 Call SetTextColor
  
   mov dl,xPosBrick
   mov dh,[edi]
   Call GotoXy
   inc edi
    movzx edx, cols
InnerLoop:
mov bl,[esi]
cmp bl,1
je PrintBrick
   mov eax,black
    mov bl,16
    mul bl
    call SetTextColor
     push edx
    mov edx, OFFSET Brick
    call WriteString
    inc esi
    jmp PrintSpace
PrintBrick:
    mov eax, 14   
    call RandomRange   
    inc eax           
    mov bl,16
    mul bl
    call SetTextColor
     push edx
    mov edx, OFFSET Brick
    call WriteString
    inc esi
PrintSpace:
   mov eax,0
   Call SetTextColor
    mov edx, OFFSET Brick
    call WriteString
    pop edx
    dec edx
    cmp edx,0
    jg InnerLoop
    call Crlf
    Call Crlf
    Call Crlf
    dec ecx
    cmp ecx,0
    ja OuterLoop

    mov eax, 7
    call SetTextColor

    Next:
     Call CreateBall

   Call createPaddle

   ret
DisplayGameScr ENDP


createPaddle PROC
   mov eax,black 
   mov bl,16
   mul bl
   Call SetTextColor
  
   mov dh,paddleXPos
   mov dl,0
   Call GotoXY
   movzx ecx,paddleYPos
   l3:
   mov eax,black 
   mov bl,16
   mul bl
   mwrite " "
   loop l3
   mov eax,blue
   mov edx,blue
   Shl edx,4
   add eax,edx
   call SetTextColor
   
   movzx ecx,paddleLength
   l4:
   mwrite " "
   loop l4
  
  movzx ecx,temp
   movzx ebx,paddleYPos
   sub ecx,ebx
   mov bl,6
   l1:
    mov eax,black 
   mov bl,16
   mul bl
   Call SetTextColor
   mwrite " "
   loop l1
   
   ret
createPaddle ENDP

CreateBall PROC

  mov dh,ballXPos
  mov dl,ballYPos
  Call GotoXY
  
  mov eax,white
  mov dl, 16
  mul dl
  Call SetTextColor
  mov edx,offset ball
  Call WriteString
   mov eax,black
  mov dl, 16
  mul dl
  Call SetTextColor
  Call Crlf
  ret
CreateBall ENDP



DisplayLogo PROC
mov eax,black
mov bl,16
mul bl
Call SetTextColor
Call clrscr
     mov dl,10 
    mov dh,10
    ;mov eax,offset PACMAN_ART
    call gotoxy
    mov ecx, lengthof PACMAN_ART
    shl ecx,3
    sub ecx,50
     mov esi,offset PACMAN_ART
    DRAWSPLASHLOOP:
    
    mov al,[esi]
      cmp al, "R"
	je SETBLUE

    cmp al, "Q"
	je SETWHITE

     cmp al, 20
	mov eax,black
    call SetTextColor
    jmp KEEPDRAWING

      SETBLUE :
		mov eax, blue (blue*16)
		call SetTextColor
		jmp KEEPDRAWING

    SETWHITE :
		mov eax, black + (black*16)
		call SetTextColor
		jmp KEEPDRAWING

    KEEPDRAWING:
	mov eax, 0
	mov al, [esi]
	call WriteChar
	inc esi
	loop DRAWSPLASHLOOP
    mov eax,blue
    Call SetTextColor
    call waitmsg
    call clrscr 
    ;NAME INPUT
      mov eax,white
    Call SetTextColor
    mov dh,12
    mov dl,30
    call gotoxy
    mov eax,Blue
    Call SetTextColor
    mov edx,offset prompt1
    mov ecx,lengthof prompt1
    call writestring
    mov edx,offset names
    mov ecx,20
    call readstring
    call clrscr
 ret
DisplayLogo ENDP

VanishPrevBall PROC
mov dh,ballXPos
mov dl,ballYPos
Call GotoXY
 mov eax,black
  mov dl, 16
  mul dl
  Call SetTextColor
  mov edx,offset ball
  Call WriteString
  ret
VanishPrevBall ENDP

BallMovementHandle PROC
call CheckCollision
    ; Update ball position
    mov al, ballXPos
    add al, ballVelocityX
    mov ballXPos, al

    mov al, ballYPos
    add al, ballVelocityY
    mov ballYPos, al

    ; Check for collisions with walls
    cmp ballXPos, 2      ; Left wall
    jl ReverseXDirection
    mov edx,81
    cmp ballXPos, dl  ; Right wall
    jg ReverseXDirection

    cmp ballYPos, 2       ; Top wall
    jl ReverseYDirection
    
   call PaddleCollision
   call CheckBrickCollision
  

    ret

ReverseXDirection:
    neg ballVelocityX
    ret

ReverseYDirection:
    neg ballVelocityY
    ret
BallMovementHandle ENDP


CheckCollision PROC
    ; Check for left or right wall collision
    mov al, ballXPos
    cmp al, 3        
    jl ReverseX
  

    ; Check for top wall collision
    mov al, ballYPos
    cmp al, 6
    jl ReverseY
    cmp al, 105      
    jg ReverseY
   

    ret

ReverseX:
    ; Reverse X velocity
    neg ballVelocityX
    ret

ReverseY:
    ; Reverse Y velocity
    neg ballVelocityY
    ret

BallMissed:
    dec livesCount
    cmp livesCount, 0
    je GameOver
    call ResetBallPosition
    ret

GameOver:
  Call clrscr
    mov dh,10
    mov dl, 10
    call GotoXy
    mov eax,white(blue*16)
    Call SetTextColor
   jmp GLOBAL_EXIT
    CheckCollision ENDP

ResetBallPosition PROC

    mov al,paddleXPos
    mov ballXPos ,al
    dec ballXPos
    mov al,paddleYPos
    mov ballYPos,al
    push eax
    push ebx
    movzx eax,paddlelength
    mov bl,2
    div bl
    add ballYPos,al
    pop ebx
    pop eax
    mov eax,1
    mov ballVelocityX, -1
    mov ballVelocityY, -1
    call CreatePaddle
    ret
ResetBallPosition ENDP


PaddleCollision PROC
    movzx ebx,paddleXPos
    dec ebx
    mov al, ballXPos
    cmp al, bl
    jl returnPaddleCollision
    cmp al,bl
    je CheckBallOnPaddle
    cmp al, bl
    jg Livereduce
    cmp ballXPos,bl
    je PaddleDetect
    jmp PaddleDetect

    CheckBallOnPaddle:
    mov bl,paddleYpos
    cmp ballYPos,bl
    jge NextCheckBallOnPaddle
    jmp returnPaddleCollision
    NextCheckBallOnPaddle:
    add bl,paddleLength
    cmp ballYPos,bl
    jle PaddleDetect
    jmp returnPaddleCollision
    Livereduce:
     dec livesCount
    cmp livesCount, 0
    je GameOver
    call ResetBallPosition
    call createPaddle
    Call DisplayGameScr
    jmp returnPaddleCollision

    PaddleDetect:
  
    neg ballVelocityX
    jmp returnPaddleCollision

    GameOver:
    Call clrscr
    mov dh,10
    mov dl, 10
    call GotoXy
    mov eax,white(blue*16)
    Call SetTextColor
   jmp GLOBAL_EXIT

returnPaddleCollision:
    ret
PaddleCollision ENDP


CheckBrickCollision PROC
mov i,0
mov j,0
   movzx ebx,xPosBrick
   cmp BallYPos,bl
   jl NoBrickCollision

   mov esi,offset yPosBrick
  
   mov ecx,3
   l1:
   inc i
   mov bl,[esi]
   inc esi
   cmp ballXPos,bl
   jl NoBrickCollision
   cmp ballXPos,bl
   je NextCheck
   Loop l1

   jmp NoBrickCollision
   
   cmp ballXPos,9
   jg NoBrickCollision
   NextCheck:
   mov ecx,lengthof bricksStart
    mov esi,offset bricksStart
   mov edi,offset bricksEnd
   l2:
   inc j
   mov bl,[esi]
   mov bh,[edi]
   inc esi
   inc edi
   cmp ballYPos,bl
   jge CheckEnd
   CheckEnd:
   cmp ballYPos,bh
   jle Collision
   loop l2
   jmp NoBrickCollision
  Collision: 
    dec i
    dec j
    mov bl,0
     movzx edx, i
    movzx eax,cols
    imul edx, eax
    add dl, j
    lea esi, brickGrid
    add esi, edx
    cmp byte ptr [esi], 0  
    je NoBrickCollision
    mov byte ptr [esi], bl
CheckScore:
    add score, 1
    mov eax,offset yPosBrick
    movzx edx,i
    add eax,edx
    mov dh, [eax]
  
    mov dl, 25
    Call RemoveBrick
    cmp score, 21
    je NextLevel
    jmp nobrickcollision
NextLevel:
    call Level2 
nobrickcollision:


    ret

CheckBrickCollision ENDP

InsertValue PROC
    
    movzx edx, i
    movzx eax,cols
    imul edx, eax
    add dl, j
    lea esi, brickGrid
    add esi, edx
    cmp byte ptr [esi], 0  
    je next
    mov byte ptr [esi], bl
    next:
    ret
InsertValue ENDP

RemoveBrick PROC
    mov eax,0
   Call SetTextColor
   Call GotoXy
    mov esi,offset brickGrid
      movzx edx, i
    movzx eax,cols
    imul edx, eax
    add esi, edx
     movzx edx, cols
InnerLoop:
mov bl,[esi]
cmp bl,1
je PrintBrick
   mov eax,black
    mov bl,16
    mul bl
    call SetTextColor
     push edx
    mov edx, OFFSET Brick
    call WriteString
    inc esi
    jmp PrintSpace
PrintBrick:
    mov eax, 14   
    call RandomRange   
    inc eax           
    mov bl,16
    mul bl
    call SetTextColor
     push edx
    mov edx, OFFSET Brick
    call WriteString
    inc esi
PrintSpace:
   mov eax,0
   Call SetTextColor
    mov edx, OFFSET Brick
    call WriteString
    pop edx
    dec edx
    cmp edx,0
    jg InnerLoop

    neg ballVelocityX
     mov bx,-1
    cmp ballVelocityX,-1
    je IncrementPro
    inc ballXPos
    jmp ScoreUpdate
    IncrementPro:
    dec ballXPos
 ScoreUpdate:
 mov dh,0
 mov dl,0
 Call Gotoxy
    mov eax ,black
 mov bl,16
 mul bl
 Call SetTextColor


    mov edx,offset randSpace
    call WriteString

    mov eax,white
    Call SetTextColor
    mov edx,offset strName
    call WriteString
    mov edx,offset names
     call WriteString

      mov eax,black
    Call SetTextColor
     mov edx,offset Space2
     call WriteString

      mov eax,white
    Call SetTextColor
      mov edx,offset strScore
    call WriteString
    movzx eax,score
     call WriteDec

     mov eax,black
    Call SetTextColor
     mov edx,offset Space2
     call WriteString

     cmp livesCount,3
     je PrintFor3
      cmp livesCount,2
     je PrintFor2
      cmp livesCount,1
     je PrintFor1
     PrintFor3:
      mov eax,white
    Call SetTextColor
      mov edx,offset livesString
    call WriteString
      mov edx,offset lives3
    call WriteString
    jmp GoNext
     PrintFor2:
      mov eax,white
    Call SetTextColor
      mov edx,offset livesString
    call WriteString
      mov edx,offset lives2
    call WriteString
    jmp GoNext
     PrintFor1:
      mov eax,white
    Call SetTextColor
      mov edx,offset livesString
    call WriteString
      mov edx,offset lives1
    call WriteString
    jmp GoNext
  GoNext:  
    ret
RemoveBrick ENDP




; LEVEL 2

;-----------
 Level2 PROC
;----------
inc levelNum
movzx eax, ballVelocityX
mov bl,10
mul bl
mov ballVelocityX,al

movzx eax, ballVelocityY
mov bl,10
mul bl
mov ballVelocityY,al

mov paddleLength,18
Call clrscr
mov bl,2
movzx ecx, rows
movzx eax,cols
imul ecx, eax
mov esi,offset brickRemHelp
l1:

mov byte ptr [esi], bl
 next:
    inc esi
loop l1

   startGame:
    
    call GetMaxXY
    mov maxRow, al   
    mov maxCol, dl
    sub maxRow,2
    push ebx
    movzx ebx,maxRow
    add bl,15
    mov ballYPos,bl
    pop ebx
    add maxRow,2
   
     push ebx
     push eax
     push edx
    movzx ebx,maxRow
    mov eax,6
    mov dl,2
    mul dl
    sub ebx,eax
    mov paddleXPos,bl
    dec paddleXPos
    pop edx
    pop eax
    pop ebx

    Call DisplayGameScr2
    Call VanishPrevBall
    Call ResetBallPosition2
    ;Main  Game Code
  gamePlay:

   moveBall:
    Call VanishPrevBall
    ;call RandomizeBallDirection
    Call BallMovementHandle2
    Call CreateBall

    mov eax,70
    Call Delay
    call ReadKey
    mov inputChar, al
    cmp inputChar, 'x'
    je exitGame
    ;cmp inputChar, 'w'
    ;je moveBall
    ;cmp inputChar, 's'
    ;je moveDown
    cmp inputChar, 'a'
    je moveLeft
    cmp inputChar, 'd'
    je moveRight
    cmp inputChar, 'p'
    je PauseDisplay

     movzx eax,paddleXPos
     mov edx,eax
     inc edx
    jmp gamePlay
  
 moveLeft:
    sub paddleYPos,2
    cmp paddleYPos,1
    jle moveRight

    call createPaddle
    jmp gamePlay
 moveRight:
 add paddleYPos,2
 mov bl,94
 cmp paddleYPos,bl
  je moveLeft
      call createPaddle
    jmp gamePlay

    PauseDisplay:
mov eax,blue(blue*16) 
Call SetTextColor
Call ClrScr
mov dh,10
mov dl,10
Call GotoXy
mov eax,White(Blue*16)
Call SetTextColor
mov edx,offset pauseScreen
Call WriteString
mov ecx,6
l2:
mov edx,offset Space2
call writeString
loop l2
Call waitmsg
Call DisplayGameScr
jmp gamePlay


 exitgame:
  mov eax,black
 Call SetTextColor
 Level2 ENDP
BallMovementHandle2 PROC
call CheckCollision2
    ; Update ball position
    mov al, ballXPos
    add al, ballVelocityX
    mov ballXPos, al

    mov al, ballYPos
    add al, ballVelocityY
    mov ballYPos, al

    ; Check for collisions with walls
    cmp ballXPos, 2      ; Left wall
    jl ReverseXDirection
    mov edx,81
    cmp ballXPos, dl  ; Right wall
    jg ReverseXDirection

    cmp ballYPos, 2       ; Top wall
    jl ReverseYDirection
    
   call PaddleCollision2
   call CheckBrickCollision2
  

    ret

ReverseXDirection:
    neg ballVelocityX
    ret

ReverseYDirection:
    neg ballVelocityY
    ret
BallMovementHandle2 ENDP


CheckCollision2 PROC
    ; Check for left or right wall collision
    mov al, ballXPos
    cmp al, 3        
    jl ReverseX
  

    ; Check for top wall collision
    mov al, ballYPos
    cmp al, 4
    jl ReverseY
    cmp al, 105      
    jg ReverseY
   

    ret

ReverseX:
    ; Reverse X velocity
    neg ballVelocityX
    ret

ReverseY:
    ; Reverse Y velocity
    neg ballVelocityY
    ret

BallMissed:
    dec livesCount
    cmp livesCount, 0
    je GameOver
    call ResetBallPosition2
    ret

GameOver:
     Call clrscr
    mov eax,white(blue*16)
    Call SetTextColor
   jmp GLOBAL_EXIT
    ret
    CheckCollision2 ENDP
ResetBallPosition2 PROC

    mov al,paddleXPos
    mov ballXPos ,al
    dec ballXPos
    mov al,paddleYPos
    mov ballYPos,al
    push eax
    push ebx
    movzx eax,paddlelength
    mov bl,2
    div bl
    add ballYPos,al
    pop ebx
    pop eax
    mov eax,1
    mov ballVelocityX, -1
    mov ballVelocityY, -1
    call CreatePaddle
    ret
ResetBallPosition2 ENDP


PaddleCollision2 PROC
    movzx ebx,paddleXPos
    dec ebx
    mov al, ballXPos
    cmp al, bl
    jl returnPaddleCollision
    cmp al,bl
    je CheckBallOnPaddle
    cmp al, bl
    jg Livereduce
    cmp ballXPos,bl
    je PaddleDetect
    jmp PaddleDetect

    CheckBallOnPaddle:
    mov bl,paddleYpos
    cmp ballYPos,bl
    jge NextCheckBallOnPaddle
    jmp returnPaddleCollision
    NextCheckBallOnPaddle:
    add bl,paddleLength
    cmp ballYPos,bl
    jle PaddleDetect
    jmp returnPaddleCollision
    Livereduce:
     dec livesCount
    cmp livesCount, 0
    je GameOver
    call ResetBallPosition2
    call createPaddle
    Call DisplayGameScr2
    jmp returnPaddleCollision

    PaddleDetect:
  
    neg ballVelocityX
    jmp returnPaddleCollision

    GameOver:
    Call clrscr
  
    mov eax,white(blue*16)
    Call SetTextColor

  jmp GLOBAL_EXIT
returnPaddleCollision:
    ret
PaddleCollision2 ENDP


CheckBrickCollision2 PROC
mov i,0
mov j,0
   movzx ebx,xPosBrick
   cmp BallYPos,bl
   jl NoBrickCollision

   mov esi,offset yPosBrick
  
   mov ecx,3
   l1:
   inc i
   mov bl,[esi]
   inc esi
   cmp ballXPos,bl
   jl NoBrickCollision
   cmp ballXPos,bl
   je NextCheck
   Loop l1

   jmp NoBrickCollision
   
   cmp ballXPos,9
   jg NoBrickCollision
   NextCheck:
   mov ecx,lengthof bricksStart
    mov esi,offset bricksStart
   mov edi,offset bricksEnd
   l2:
   inc j
   mov bl,[esi]
   mov bh,[edi]
   inc esi
   inc edi
   cmp ballYPos,bl
   jge CheckEnd
   CheckEnd:
   cmp ballYPos,bh
   jle Collision
   loop l2
   jmp NoBrickCollision
  Collision: 
    dec i
    dec j
    mov bl,0
     movzx edx, i
    movzx eax,cols
    imul edx, eax
    add dl, j
    lea esi, brickRemHelp
    add esi, edx
    cmp byte ptr [esi], 0  
    je NoBrickCollision
    cmp byte ptr [esi],2
    je Two
    cmp byte ptr [esi],1
    je One
    One:
    mov byte ptr [esi], 0
    add score, 2
    jmp CheckScore
    Two:
    mov byte ptr [esi], 1
CheckScore:
    
    mov eax,offset yPosBrick
    movzx edx,i
    add eax,edx
    mov dh, [eax]
  
    mov dl, 25
    Call RemoveBrick2
    cmp score, 63
    je NextLevel
    jmp nobrickcollision
NextLevel:
    call Level3
nobrickcollision:


    ret

CheckBrickCollision2 ENDP



RemoveBrick2 PROC
    mov eax,0
   Call SetTextColor
   Call GotoXy
    mov esi,offset brickRemHelp
      movzx edx, i
    movzx eax,cols
    imul edx, eax
    add esi, edx
     movzx edx, cols
InnerLoop:
mov bl,[esi]
cmp bl,1
je PrintLightBrick
cmp bl,2
je PrintBrick
   mov eax,black
    mov bl,16
    mul bl
    call SetTextColor
     push edx
    mov edx, OFFSET Brick
    call WriteString
    inc esi
    jmp PrintSpace
PrintBrick:
    mov eax,3 
    mov bl,16
    mul bl
    call SetTextColor
     push edx
    mov edx, OFFSET Brick
    call WriteString
    inc esi
    jmp PrintSpace
PrintLightBrick:
    mov eax, Gray
    mov bl,16
    mul bl
    call SetTextColor
     push edx
    mov edx, OFFSET Brick
    call WriteString
    inc esi
PrintSpace:
   mov eax,0
   Call SetTextColor
    mov edx, OFFSET Brick
    call WriteString
    pop edx
    dec edx
    cmp edx,0
    jg InnerLoop

    neg ballVelocityX
    mov bx,-1
    cmp ballVelocityX,-1
    je IncrementPro
    inc ballXPos
    jmp ScoreUpdate
    IncrementPro:
    dec ballXPos
 ScoreUpdate:
 mov dh,0
 mov dl,0
 Call Gotoxy
    mov eax ,black
 mov bl,16
 mul bl
 Call SetTextColor


    mov edx,offset randSpace
    call WriteString

    mov eax,white
    Call SetTextColor
    mov edx,offset strName
    call WriteString
    mov edx,offset names
     call WriteString

      mov eax,black
    Call SetTextColor
     mov edx,offset Space2
     call WriteString

      mov eax,white
    Call SetTextColor
      mov edx,offset strScore
    call WriteString
    movzx eax,score
     call WriteDec

     mov eax,black
    Call SetTextColor
     mov edx,offset Space2
     call WriteString

     cmp livesCount,3
     je PrintFor3
      cmp livesCount,2
     je PrintFor2
      cmp livesCount,1
     je PrintFor1
     PrintFor3:
      mov eax,white
    Call SetTextColor
      mov edx,offset livesString
    call WriteString
      mov edx,offset lives3
    call WriteString
    jmp GoNext
     PrintFor2:
      mov eax,white
    Call SetTextColor
      mov edx,offset livesString
    call WriteString
      mov edx,offset lives2
    call WriteString
    jmp GoNext
     PrintFor1:
      mov eax,white
    Call SetTextColor
      mov edx,offset livesString
    call WriteString
      mov edx,offset lives1
    call WriteString
    jmp GoNext
  GoNext:  
    ret
RemoveBrick2 ENDP

 DisplayGameScr2 PROC
 
 mov eax ,black
 mov bl,16
 mul bl
 Call SetTextColor
 Call clrScr

    mov edx,offset randSpace
    call WriteString

    mov eax,white
    Call SetTextColor
    mov edx,offset strName
    call WriteString
    mov edx,offset names
     call WriteString

      mov eax,black
    Call SetTextColor
     mov edx,offset Space2
     call WriteString

      mov eax,white
    Call SetTextColor
      mov edx,offset strScore
    call WriteString
    movzx eax,score
     call WriteDec

     mov eax,black
    Call SetTextColor
     mov edx,offset Space2
     call WriteString

     cmp livesCount,3
     je PrintFor3
      cmp livesCount,2
     je PrintFor2
      cmp livesCount,1
     je PrintFor1
     PrintFor3:
      mov eax,white
    Call SetTextColor
      mov edx,offset livesString
    call WriteString
      mov edx,offset lives3
    call WriteString
    jmp GoNext
     PrintFor2:
      mov eax,white
    Call SetTextColor
      mov edx,offset livesString
    call WriteString
      mov edx,offset lives2
    call WriteString
    jmp GoNext
     PrintFor1:
      mov eax,white
    Call SetTextColor
      mov edx,offset livesString
    call WriteString
      mov edx,offset lives1
    call WriteString
    jmp GoNext
  GoNext:  
Call Crlf
Call Crlf


   call Randomize
    mov eax, 7 
    call SetTextColor
    movzx ecx, rows
        mov edi, OFFSET yPosBrick
        mov esi, OFFSET brickRemHelp
OuterLoop:
 mov eax,0
 Call SetTextColor
  
   mov dl,xPosBrick
   mov dh,[edi]
   Call GotoXy
   inc edi
    movzx edx, cols
InnerLoop:
mov bl,[esi]
cmp bl,1
je PrintLightBrick
cmp bl,2
je PrintBrick
   mov eax,black
    mov bl,16
    mul bl
    call SetTextColor
     push edx
    mov edx, OFFSET Brick
    call WriteString
    inc esi
    jmp PrintSpace
PrintBrick:
    mov eax,3
    mov bl,16
    mul bl
    call SetTextColor
     push edx
    mov edx, OFFSET Brick
    call WriteString
    inc esi
    jmp PrintSpace
PrintLightBrick:
    mov eax, Gray
    mov bl,16
    mul bl
    call SetTextColor
     push edx
    mov edx, OFFSET Brick
    call WriteString
    inc esi
PrintSpace:
   mov eax,0
   Call SetTextColor
    mov edx, OFFSET Brick
    call WriteString
    pop edx
    dec edx
    cmp edx,0
    jg InnerLoop
    call Crlf
    Call Crlf
    Call Crlf
    dec ecx
    cmp ecx,0
    ja OuterLoop

    mov eax, 7
    call SetTextColor

    Next:
     Call CreateBall

   Call createPaddle

   ret
DisplayGameScr2 ENDP



;-----------
 Level3 PROC
;-----------
inc levelNum
movzx eax, ballVelocityX
mov bl,100
mul bl
mov ballVelocityX,al

movzx eax, ballVelocityY
mov bl,100
mul bl
mov ballVelocityY,al

mov paddleLength,18
Call clrscr
mov bl,3
movzx ecx, rows
movzx eax,cols
imul ecx, eax
mov esi,offset brickGrid3
l1:

mov byte ptr [esi], bl
 next:
    inc esi
loop l1



mov ecx,4

L2:
mov esi,offset brickGrid3
mov eax,20
Call RandomRange
mov ebx,eax
add esi,ebx
mov byte ptr [esi],5
Loop L2


mov esi,offset brickGrid3
mov eax,20
Call RandomRange
mov ebx,eax
add esi,ebx
mov byte ptr [esi],4 ;Special Brick

   startGame:
    
    call GetMaxXY
    mov maxRow, al   
    mov maxCol, dl
    sub maxRow,2
    push ebx
    movzx ebx,maxRow
    add bl,15
    mov ballYPos,bl
    pop ebx
    add maxRow,2
   
     push ebx
     push eax
     push edx
    movzx ebx,maxRow
    mov eax,6
    mov dl,2
    mul dl
    sub ebx,eax
    mov paddleXPos,bl
    dec paddleXPos
    pop edx
    pop eax
    pop ebx

    Call DisplayGameScr3
    Call VanishPrevBall
    Call ResetBallPosition3
    ;Main  Game Code
  gamePlay:

   moveBall:
    Call VanishPrevBall
    ;call RandomizeBallDirection
    Call BallMovementHandle3
    Call CreateBall

    mov eax,40
    Call Delay
    call ReadKey
    mov inputChar, al
    cmp inputChar, 'x'
    je exitGame
    ;cmp inputChar, 'w'
    ;je moveBall
    ;cmp inputChar, 's'
    ;je moveDown
    cmp inputChar, 'a'
    je moveLeft
    cmp inputChar, 'd'
    je moveRight
     cmp inputChar, 'p'
    je PauseDisplay
    
     movzx eax,paddleXPos
     mov edx,eax
     inc edx
    jmp gamePlay
  
 moveLeft:
    sub paddleYPos,2
    cmp paddleYPos,2
    jle moveRight

    call createPaddle
    jmp gamePlay
 moveRight:
 add paddleYPos,2
 mov bl,94
 cmp paddleYPos,bl
  je moveLeft
      call createPaddle
    jmp gamePlay

    PauseDisplay:
mov eax,blue(blue*16) 
Call SetTextColor
Call ClrScr
mov dh,10
mov dl,10
Call GotoXy
mov eax,White(Blue*16)
Call SetTextColor
mov edx,offset pauseScreen
Call WriteString
mov ecx,6
l3:
mov edx,offset Space2
call writeString
loop l3
Call waitmsg
Call DisplayGameScr
jmp gamePlay


 exitgame:
  mov eax,black
 Call SetTextColor

Level3 ENDP


 BallMovementHandle3 PROC
call CheckCollision3
    ; Update ball position
    mov al, ballXPos
    add al, ballVelocityX
    mov ballXPos, al

    mov al, ballYPos
    add al, ballVelocityY
    mov ballYPos, al

    ; Check for collisions with walls
    cmp ballXPos, 2      ; Left wall
    jl ReverseXDirection
    mov edx,80
    cmp ballXPos, dl  ; Right wall
    jg ReverseXDirection

    cmp ballYPos, 5      ; Top wall
    jl ReverseYDirection
    
   call PaddleCollision3
   call CheckBrickCollision3
  

    ret

ReverseXDirection:
    neg ballVelocityX
    ret

ReverseYDirection:
    neg ballVelocityY
    ret
BallMovementHandle3 ENDP


CheckCollision3 PROC
    ; Check for left or right wall collision
    mov al, ballXPos
    cmp al, 3        
    jl ReverseX
  

    ; Check for top wall collision
    mov al, ballYPos
    cmp al, 4
    jl ReverseY
    cmp al, 105      
    jg ReverseY
   

    ret

ReverseX:
    ; Reverse X velocity
    neg ballVelocityX
    ret

ReverseY:
    ; Reverse Y velocity
    neg ballVelocityY
    ret

BallMissed:
    dec livesCount
    cmp livesCount, 0
    je GameOver
    call ResetBallPosition3
    ret

GameOver:
     Call clrscr
    mov eax,white(blue*16)
    Call SetTextColor
   jmp GLOBAL_EXIT
    ret
    CheckCollision3 ENDP


ResetBallPosition3 PROC

    mov al,paddleXPos
    mov ballXPos ,al
    dec ballXPos
    mov al,paddleYPos
    mov ballYPos,al
    push eax
    push ebx
    movzx eax,paddlelength
    mov bl,2
    div bl
    add ballYPos,al
    pop ebx
    pop eax
    mov eax,1
    mov ballVelocityX, -1
    mov ballVelocityY, -1
    call CreatePaddle
    ret
ResetBallPosition3 ENDP


PaddleCollision3 PROC
    movzx ebx,paddleXPos
    dec ebx
    mov al, ballXPos
    cmp al, bl
    jl returnPaddleCollision
    cmp al,bl
    je CheckBallOnPaddle
    cmp al, bl
    jg Livereduce
    cmp ballXPos,bl
    je PaddleDetect
    jmp PaddleDetect

    CheckBallOnPaddle:
    mov bl,paddleYpos
    cmp ballYPos,bl
    jge NextCheckBallOnPaddle
    jmp returnPaddleCollision
    NextCheckBallOnPaddle:
    add bl,paddleLength
    cmp ballYPos,bl
    jle PaddleDetect
    jmp returnPaddleCollision
    Livereduce:
     dec livesCount
    cmp livesCount, 0
    je GameOver
    call ResetBallPosition3
    call createPaddle
    Call DisplayGameScr3
    jmp returnPaddleCollision

    PaddleDetect:
  
    neg ballVelocityX
    jmp returnPaddleCollision

    GameOver:
    Call clrscr
  
    mov eax,white(blue*16)
    Call SetTextColor

  jmp GLOBAL_EXIT
returnPaddleCollision:
    ret
PaddleCollision3 ENDP


CheckBrickCollision3 PROC
mov i,0
mov j,0
   movzx ebx,xPosBrick
   cmp BallYPos,bl
   jl NoBrickCollision

   mov esi,offset yPosBrick
  
   mov ecx,3
   l1:
   inc i
   mov bl,[esi]
   inc esi
   cmp ballXPos,bl
   jl NoBrickCollision
   cmp ballXPos,bl
   je NextCheck
   Loop l1

   jmp NoBrickCollision
   
   cmp ballXPos,9
   jg NoBrickCollision
   NextCheck:
   mov ecx,lengthof bricksStart
    mov esi,offset bricksStart
   mov edi,offset bricksEnd
   l2:
   inc j
   mov bl,[esi]
   mov bh,[edi]
   inc esi
   inc edi
   cmp ballYPos,bl
   jge CheckEnd
   CheckEnd:
   cmp ballYPos,bh
   jle Collision
   loop l2
   jmp NoBrickCollision
  Collision: 
    dec i
    dec j
    mov bl,0
     movzx edx, i
    movzx eax,cols
    imul edx, eax
    add dl, j
    lea esi, brickGrid3
    add esi, edx
    cmp byte ptr [esi], 0  
    je NoBrickCollision
    cmp byte ptr [esi],3
    je Three
    cmp byte ptr [esi],5
    je CheckScore
    cmp byte ptr [esi],4
    je SpBrick
    cmp byte ptr [esi],2
    je Two
    cmp byte ptr [esi],1
    je One
    SpBrick:
    add score, 15
    jmp CheckScore
    One:
    mov byte ptr [esi], 0
    add score, 3
    jmp CheckScore
    Three:
    mov byte ptr [esi], 2
    jmp CheckScore
    Two:
    mov byte ptr [esi], 1
CheckScore:
    
    mov eax,offset yPosBrick
    movzx edx,i
    add eax,edx
    mov dh, [eax]
  
    mov dl, 25
    Call RemoveBrick3
    cmp score, 114
    je NextLevel
    jmp nobrickcollision
NextLevel:
   ; call YouWonDisplay
nobrickcollision:


    ret

CheckBrickCollision3 ENDP



RemoveBrick3 PROC
    mov eax,0
   Call SetTextColor
   Call GotoXy
    mov esi,offset brickGrid3
      movzx edx, i
    movzx eax,cols
    imul edx, eax
    add esi, edx
     movzx edx, cols
InnerLoop:
mov bl,[esi]
cmp bl,1
je PrintGrayBrick
cmp bl,2
je PrintLightBrick
cmp bl,3
je PrintBrick
cmp bl,5
je PrintBrick
cmp bl,4
je PrintSpecialBrick

   mov eax,black
    mov bl,16
    mul bl
    call SetTextColor
     push edx
    mov edx, OFFSET Brick
    call WriteString
    inc esi
    jmp PrintSpace
 PrintSp:
    push edx
    mov edx, OFFSET SpBrickChar
    call WriteString
    inc esi
    jmp PrintSpace
PrintBrick:
    mov eax,3
    mov bl,16
    mul bl
    call SetTextColor
     push edx
    mov edx, OFFSET Brick
    call WriteString
    inc esi
    jmp PrintSpace

  PrintLightBrick:
    mov eax,lightCyan
    mov bl,16
    mul bl
    call SetTextColor
     push edx
    mov edx, OFFSET Brick
    call WriteString
    inc esi
    jmp PrintSpace
  PrintSpecialBrick:
    mov eax,black(black*16)
    call SetTextColor
    push edx
    mov edx, OFFSET Brick
    call WriteString
    mov byte ptr [esi],0
    inc esi
    mov ecx,5
    l3:
    mov eax,20
    call RandomRange
    mov edi,offset brickGrid3
    add edi,eax
    mov ebx,[edi]
    cmp ebx,0
    je L3
     cmp ebx,5
    je L3
    mov byte ptr [edi],0
    dec ecx
    cmp ecx,0
    jne l3
    Call DisplayGameScr3
    jmp PrintSpace
PrintGrayBrick:
    mov eax, Gray
    mov bl,16
    mul bl
    call SetTextColor
     push edx
    mov edx, OFFSET Brick
    call WriteString
    inc esi

PrintSpace:
   mov eax,0
   Call SetTextColor
    mov edx, OFFSET Brick
    call WriteString
    pop edx
    dec edx
    cmp edx,0
    jg InnerLoop

    neg BallVelocityX
     mov bx,-1
    cmp BallVelocityX,-1
    je IncrementPro
    inc ballXPos
    jmp ScoreUpdate
    IncrementPro:
    dec ballXPos
 ScoreUpdate:
 mov dh,0
 mov dl,0
 Call Gotoxy
    mov eax ,black
 mov bl,16
 mul bl
 Call SetTextColor


    mov edx,offset randSpace
    call WriteString

    mov eax,white
    Call SetTextColor
    mov edx,offset strName
    call WriteString
    mov edx,offset names
     call WriteString

      mov eax,black
    Call SetTextColor
     mov edx,offset Space2
     call WriteString

      mov eax,white
    Call SetTextColor
      mov edx,offset strScore
    call WriteString
    movzx eax,score
     call WriteDec

     mov eax,black
    Call SetTextColor
     mov edx,offset Space2
     call WriteString

     cmp livesCount,3
     je PrintFor3
      cmp livesCount,2
     je PrintFor2
      cmp livesCount,1
     je PrintFor1
     PrintFor3:
      mov eax,white
    Call SetTextColor
      mov edx,offset livesString
    call WriteString
      mov edx,offset lives3
    call WriteString
    jmp GoNext
     PrintFor2:
      mov eax,white
    Call SetTextColor
      mov edx,offset livesString
    call WriteString
      mov edx,offset lives2
    call WriteString
    jmp GoNext
     PrintFor1:
      mov eax,white
    Call SetTextColor
      mov edx,offset livesString
    call WriteString
      mov edx,offset lives1
    call WriteString
    jmp GoNext
  GoNext:  
    ret
RemoveBrick3 ENDP

 DisplayGameScr3 PROC
 
 mov eax ,black
 mov bl,16
 mul bl
 Call SetTextColor
 Call clrScr

    mov edx,offset randSpace
    call WriteString

    mov eax,white
    Call SetTextColor
    mov edx,offset strName
    call WriteString
    mov edx,offset names
     call WriteString

      mov eax,black
    Call SetTextColor
     mov edx,offset Space2
     call WriteString

      mov eax,white
    Call SetTextColor
      mov edx,offset strScore
    call WriteString
    movzx eax,score
     call WriteDec

     mov eax,black
    Call SetTextColor
     mov edx,offset Space2
     call WriteString

     cmp livesCount,3
     je PrintFor3
      cmp livesCount,2
     je PrintFor2
      cmp livesCount,1
     je PrintFor1
     PrintFor3:
      mov eax,white
    Call SetTextColor
      mov edx,offset livesString
    call WriteString
      mov edx,offset lives3
    call WriteString
    jmp GoNext
     PrintFor2:
      mov eax,white
    Call SetTextColor
      mov edx,offset livesString
    call WriteString
      mov edx,offset lives2
    call WriteString
    jmp GoNext
     PrintFor1:
      mov eax,white
    Call SetTextColor
      mov edx,offset livesString
    call WriteString
      mov edx,offset lives1
    call WriteString
    jmp GoNext
  GoNext:  
Call Crlf
Call Crlf


   call Randomize
    mov eax, 7 
    call SetTextColor
    movzx ecx, rows
        mov edi, OFFSET yPosBrick
        mov esi, OFFSET brickGrid3
OuterLoop:
 mov eax,0
 Call SetTextColor
  
   mov dl,xPosBrick
   mov dh,[edi]
   Call GotoXy
   inc edi
    movzx edx, cols
InnerLoop:
mov bl,[esi]
cmp bl,1
je PrintGrayBrick
cmp bl,2
je PrintLightBrick
cmp bl,3
je PrintBrick
cmp bl,5
je PrintBrick
cmp bl,4
je PrintBrick
   mov eax,black
    mov bl,16
    mul bl
    call SetTextColor
     push edx
    mov edx, OFFSET Brick
    call WriteString
    inc esi
    jmp PrintSpace

PrintSpBrick:
    push edx
    mov edx, OFFSET SpBrickChar
    call WriteString
    inc esi
    jmp PrintSpace
PrintBrick:
    mov eax,3
    mov bl,16
    mul bl
    call SetTextColor
     push edx
    mov edx, OFFSET Brick
    call WriteString
    inc esi
    jmp PrintSpace

 PrintLightBrick:
    mov eax,lightCyan
    mov bl,16
    mul bl
    call SetTextColor
     push edx
    mov edx, OFFSET Brick
    call WriteString
    inc esi
    jmp PrintSpace

PrintGrayBrick:
    mov eax, Gray
    mov bl,16
    mul bl
    call SetTextColor
     push edx
    mov edx, OFFSET Brick
    call WriteString
    inc esi
PrintSpace:
   mov eax,0
   Call SetTextColor
    mov edx, OFFSET Brick
    call WriteString
    pop edx
    dec edx
    cmp edx,0
    jg InnerLoop
    call Crlf
    Call Crlf
    Call Crlf
    dec ecx
    cmp ecx,0
    ja OuterLoop

    mov eax, 7
    call SetTextColor

    Next:
     Call CreateBall

   Call createPaddle

   ret
DisplayGameScr3 ENDP

   WriteNumInFile PROC
    mov eax, 0
    push ecx
    mov edx,OFFSET filename
 
    mov fileHandle,eax
    cmp eax, INVALID_HANDLE_VALUE 
    jne file_ok
    ; no: skip
    mov edx,OFFSET prompt1
    ; display error
    call WriteString
    jmp quit
    file_ok:
        mov eax,fileHandle
        mov edx, esi
        pop ecx
        call WriteToFile
        
        mov bytesW, eax
        MOV edx, Offset filename
        mov eax,fileHandle
        call CloseFile
    quit:
    ret
WriteNumInFile endP


;;;;FILE HANDLING
writenum PROC
mov eax, 0
    push ecx
    mov edx,OFFSET filename
    call CreateOutputFile
    mov fileHandle,eax
    cmp eax, INVALID_HANDLE_VALUE ; error found?
    jne file_ok
    ; no: skip
    mov edx,OFFSET prompt1
    ; display error
    call WriteString
    jmp quit
    file_ok:
        mov eax,fileHandle
        mov edx, esi
        pop ecx
        call WriteToFile
        
        mov bytesW, eax
        MOV edx, Offset filename
        mov eax,fileHandle
        call CloseFile
    quit:
    ret
writenum endP



InitializingFile PROC
    mov edx,OFFSET filename
    call OpenInputFile
    mov fileHandle,eax
    cmp eax,INVALID_HANDLE_VALUE 
    jne file_ok1
    mWrite <"Cannot open file",0dh,0ah>
    jmp quit1
    file_ok1:
        mov edx,OFFSET buffer
        mov ecx,BUFFER_SIZE
        call ReadFromFile
        jnc check_buffer_size

        check_buffer_size:
        cmp eax,BUFFER_SIZE
        ; buffer large enough?
        jb buf_size_ok
        ; yes
        mWrite <"Error: Buffer too small for the file",0dh,0ah>
        jmp quit1
        ; and quit
        buf_size_ok:
        mov b, eax
            mov buffer[eax],0
            ; insert null terminator
            ; Display the buffer.
           ; mWrite <"Buffer:",0dh,0ah,0dh,0ah>
           ; mov edx,OFFSET buffer
            ; display the buffer
            ;call WriteString

    quit1:
    mov eax, fileHandle
    CALL CLOSEFILE
    ret
InitializingFile endP


ADD_SPACE PROC 
push edi
mov edi, offset space
SPACEl:
mov al, [edi]
MOV [ESI],AL
inc ebx
INC ESI
LOOP SPACEl
pop edi

RET
ADD_SPACE ENDP


FileHandling PROC
MOV ebx, b
mov edi, offset names


mov esi, offset buffer 
mov ecx, lengthof names
add esi, ebx
addname:
mov al, [edi]
cmp al, 0
je finish
mov [esi], al
inc esi
inc ebx
inc edi

loop addname

;nexL:
;jmp nexL

finish:
mov esi, offset buffer
add esi, ebx
MOV ECX, 12
CALL ADD_SPACE

;;;score

    movzx eax, score
    ;mov al, score          ; Load the number into eax
         ; Load the address of str into edx
    push ebx
    call itos
    pop ebx
    mov esi, offset buffer
    add esi, ebx

mov ecx, len
dec edi

addscr:
mov al, [edi]
MOV [ESI], al
inc ebx
dec edi
inc esi
loop addscr

MOV ECX, 18
CALL ADD_SPACE

movzx eax, levelNum
call itos

mov esi, offset buffer
 add esi, ebx

mov ecx, len
dec edi

addslvl:
mov al, [edi]
MOV [ESI], al
inc ebx
dec edi
inc esi
loop addslvl
mov al, 0Ah
mov [esi], al

mov ecx, ebx
inc ecx
mov esi, offset buffer

call writenum


RET
FileHandling ENDP

;;;;Int to string
itos PROC
push ebx

mov bl, 10
mov edi, offset Istr
mov len, 0
loop1:
cmp al, 0
je ex
div bl
mov q, al
add ah, 48
mov [edi], ah
inc edi
inc len
mov eax, 0
mov al,q
jmp loop1



ex:

;pop esi
pop ebx
;pop eax
ret
itos ENDP


UpdateTimeDisplay PROC
mov eax,white
Call SetTextColor

    cmp remainingTime, 0
    je stopDisplay

    mov eax, remainingTime
    mov ebx, 60
    div bl

    movzx edx, dl
    movzx ecx, al

    mov eax, ecx
    call WriteDec
    mov dl, ':'
    call WriteChar
    mov eax, edx
    call WriteDec

    ret

stopDisplay:
    ret
UpdateTimeDisplay ENDP

timeUp:
    
    mov eax,Red
    call SetTextColor
    mov edx, offset TimeUpMessage
    call WriteString
   mov eax,white(blue*16)
    call SetTextColor
    jmp GLOBAL_EXIT

 YouWonDisplay PROC
 Call ClrScr
 mov eax,blue(white*16)
 Call SetTextColor
 mov edx, Offset YouWon
 Call WriteString


  YouWonDisplay  ENDP

  DisplayLast PROC
 mov eax,white
 Call SetTextColor
 mov edx, Offset anim1
 Call WriteString
 Call clrScr
  mov eax,white
 Call SetTextColor
 mov edx, Offset anim2
 Call WriteString
 Call clrScr
  mov eax,white
 Call SetTextColor
 mov edx, Offset anim3
 Call WriteString
 Call clrScr
  mov eax,white
 Call SetTextColor
 mov edx, Offset anim4
 Call WriteString
 Call clrScr
  mov eax,white
 Call SetTextColor
 mov edx, Offset anim5
 Call WriteString
 Call WriteString
 Call clrScr
  mov eax,white
 Call SetTextColor
 mov edx, Offset anim6
 Call WriteString
 Call clrScr
  mov eax,white
 Call SetTextColor
 mov edx, Offset anim7
 Call WriteString
 Call clrScr
  mov eax,white
 Call SetTextColor
 mov edx, Offset anim8
 Call WriteString
 DisplayLast ENDP
GLOBAL_EXIT::
mov eax, SND_FILENAME;;
or eax, SND_ASYNC;; 
mov esi , OFFSET file1
invoke PlaySound, esi, 0, eax
call clrscr
mov dh,10
mov dl,10
Call GotoXy
 mov edx, offset gameOverScreen
    call WriteString
 call   FileHandling
 END main
 