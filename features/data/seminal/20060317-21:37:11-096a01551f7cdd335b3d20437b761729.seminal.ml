exception Unimplemented
exception AlreadyDone

let pi = 4.0 *. atan 1.0

(*** part a ***)
type move = 
    Home
  | Forward of float
  | Turn of float
  | For of int * move list

(*** part b ***)
let makePoly sides len =
  let angle = pi-.(pi/.sides) in
  let rec createMoveList moves =
    if moves = sides 
    then 
      []
    else 
       Forward (len)::Turn(angle)::(createMoveList (moves+1))in
  let moveList = createMoveList 0 in 
    For(sides, moveList)


    

(*** part c ***)
let interpLarge (movelist : move list) : (float*float) list = 
  let rec loop movelist x y dir acc =
    match movelist with
      [] -> []
    | Home::tl -> loop tl 0.0 0.0 dir ((0.0,0.0)::acc)
    | Forward(len)::tl -> 
	let xLen = (len*.(cos dir)) in
	let yLen = (len*.(sin dir)) in 
	loop tl xLen yLen dir ((xLen, yLen)::acc)
    | Turn(newDir)::tl -> loop tl x y newDir acc
    | For(moves, lst)::tl -> 
	let rec finalLst counter searchLst acc2=
	  if counter = 0 then
	    acc2
	  else match searchLst with
	    []->[]
	  | hd::tail -> finalLst (counter-1) tail (hd::acc2) in
	loop (finalLst moves lst tl) x y dir acc
	 
  in List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])

(*** part d ***)
(*let interpSmall (movelist : move list) : (float*float) list = 
  let interpSmallStep movelist x y dir : move list * float * float * float = 
  match movelist with
    [] -> raise Unimplemented
  | Home::tl -> raise Unimplemented
  (* ########################### *)
  in
  let rec loop movelist x y dir acc =
    raise Unimplemented
  in 
  List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])

(*** part e ***)

(* ##################################################################### *)

(*** part f ***)
let interpTrans movelist : float->float->float-> (float * float) list * float= 
  let compose f1 f2 = raise Unimplemented (* ######################### *)
  in
  match movelist with
    [] -> raise Unimplemented
  | Home::tl -> raise Unimplemented
  (* ########################### *)

(*** possibly helpful testing code ***)

(* ######################################################################## *)
(* ############################################# *)
let example_logo_prog = (makePoly 5 3.0)::[]

let ansL = interpLarge example_logo_prog
(*let ansS = interpSmall example_logo_prog
let ansI = (0.0,0.0)::(fst ((interpTrans example_logo_prog) 0.0 0.0 0.0))*)
##
################
################
############
#################
################################################################################
###########

########
##############################
######################
###################################
### pr ansS; print_newline ();
  pr ansI; print_newline ();###

 *)
