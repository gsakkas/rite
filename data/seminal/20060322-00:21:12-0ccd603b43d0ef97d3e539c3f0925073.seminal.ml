exception Unimplemented
exception AlreadyDone
exception InvalidAngle
let pi = 4.0 *. atan 1.0

(*** part a ***)
type move = 
    Home
  | Forward of float
  | Turn of float
  | For of int * move list

(*** part b ***)
let makePoly sides len =
  let angle = pi-.((pi*.(float_of_int (sides-2)))/.(float_of_int sides)) in
  let rec createMoveList moves acc =
    if moves = sides
    then 
      acc
    else 
       (createMoveList (moves+1) (Forward(len)::Turn(angle)::acc))in
  let moveList = createMoveList 0 [] in 
    For(sides, moveList)
(*** part c ***)
let interpLarge (movelist : move list) : (float*float) list = 
  let rec loop movelist x y dir acc =
    match movelist with
      [] -> acc
    | Home::tl -> loop tl 0.0 0.0 dir ((0.0,0.0)::acc)
    | Turn(newDir)::tl -> loop tl x y (dir+newDir) acc
    | For(moves, lst)::tl -> 
	let rec finalLst counter searchLst acc2=
	  if counter = 0 then
	    acc2
	  else match searchLst with
	    []->acc2
	  | hd::tail -> finalLst (counter-1) tail (hd::acc2) in
	loop (finalLst moves lst tl) x y dir acc
    | Forward(len)::tl -> 
	let xLen = (len*.(cos dir)) in
	let yLen = (len*.(sin dir)) in 
	if (dir > 0.0 && dir <= (pi/.2.0)) then
	  loop tl (x+.xLen) (y+.yLen) dir ((x+.xLen, y+.yLen)::acc)
	else 
          if (dir > (pi/.2.0) && dir <= pi) then
	    loop tl (x-.xLen) (y+.yLen) dir ((x-.xLen, y+.yLen)::acc)
        else if (dir > pi && dir <=((3.0*.pi)/.2.0)) then
	    loop tl (x-.xLen) (y-.yLen) dir ((x-.xLen, y-.yLen)::acc)
        else if (dir >((3.0*.pi)/.2.0) && dir<= (2.0*.pi))then
	    loop tl (x+.xLen) (y-.yLen) dir ((x+.xLen, y-.yLen)::acc)
        else raise InvalidAngle
	  
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
##
######################################

##############################################
##########################################
###########################################################################

################
################
############
#################
################################################################################
###########

###################################
###pr ansS; print_newline ();
  pr ansI; print_newline ();###

 *)
