exception Unimplemented
exception AlreadyDone

let pi = 3.1415926
let pi2 = 2.0 *. pi

(*** part a ***)
type move = Home | Forward of float | Turn of float | For of int * move list

(*** part b ***)
let makePoly sides len = For(sides, [Forward(len); Turn (pi2 /. float_of_int(sides))])

(*** part c ***)
let interpLarge (movelist : move list) : (float*float) list = 
  let rec loop movelist x y dir acc =
    match movelist with
      [] -> raise Unimplemented
    | Home::tl -> raise Unimplemented
    | Forward(f)::tl -> raise Unimplemented
    | Turn(f)::tl -> raise Unimplemented
    | For(i, moves)::tl -> raise Unimplemented
  in List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])
(*** part d ***)
(*
##############################################################
#############################################################################
#####################
#############################
#####################################
####
#####################################
#######################
#####
##################################################
*)
(*** part e ***)

(* ##################################################################### *)

(*** part f ***)
(*
###############################################################################
#############################################################################
####
#####################
#############################
###################################
*)

(*** possibly helpful testing code ***)

(* ######################################################################## *)
(* ############################################# *)
let example_logo_prog = makePoly 4 10.0
let ansL = interpLarge example_logo_prog
(*let ansS = interpSmall example_logo_prog*)
let ansI = (0.0,0.0)::(fst ((interpTrans example_logo_prog) 0.0 0.0 0.0))
let rec pr lst =
  match lst with
    [] -> ()
  | (x,y)::tl -> 
      print_string("(" ^ (string_of_float x) ^ "," ^ (string_of_float y) ^ ")");
      pr tl

let _ = 
  pr ansL; print_newline (); 
  pr ansS; print_newline ();
  pr ansI; print_newline (); 