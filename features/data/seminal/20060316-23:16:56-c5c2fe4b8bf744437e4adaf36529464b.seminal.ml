
exception Unimplemented
exception AlreadyDone

(*
#######################################
###########################################################
#####################################################################################################
*)

(*let pi = 4.0 *. atan 1.0*)

(*** part a ***)
type move = Home
			| Forward of float
			| Turn of float
			| For of int * move list

(*** part b ***)
(*let makePoly sides len =
	For(sides, [Forward(len); Turn((2.0 *. pi) /. (float_of_int sides))]);
	(*For(sides, [Forward(len); Turn(mod_float ((2.0 *. pi) /. (float_of_int sides)) (2.0 *. pi))])*)*)

(*** part c ***)
 let interpLarge (movelist : move list) : (float*float) list = 
  let rec loop movelist x y dir acc =
    match movelist with
      []				-> acc
    | Home::tl			-> loop tl 0.0 0.0 0.0 ((0.0,0.0)::acc)
    | Forward(dist)::tl	-> raise Unimplemented
		(*let newx = (x +. (dist *. cos dir)) in*)
		(*let newy = (y +. (dist *. sin dir)) in*)
		loop tl (x +. (dist *. cos dir)) (y +. (dist *. sin dir)) dir (((x +. (dist *. cos dir)),(y +. (dist *. sin dir)))::acc)
    | Turn(rad)::tl		-> loop tl x y (mod_float (dir +. rad) (2 *. pi)) acc
    | For(i,lst)::tl	-> raise Unimplemented
  in List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])

(*** part d ***)
let interpSmall (movelist : move list) : (float*float) list = 
  let interpSmallStep movelist x y dir : move list * float * float * float = 
  match movelist with
    [] -> raise Unimplemented
  | Home::tl -> raise Unimplemented
  | Forward(f)::tl -> raise Unimplemented
  | Turn(f)::tl -> raise Unimplemented
  | For(i,lst)::tl -> raise Unimplemented
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
  | Forward(f)::tl -> raise Unimplemented
  | Turn(f)::tl -> raise Unimplemented
  | For(i,lst)::tl -> raise Unimplemented

(*** possibly helpful testing code ***)

(* ######################################################################## *)
(* ############################################# *)
let example_logo_prog = raise Unimplemented
let ansL = interpLarge example_logo_prog
let ansS = interpSmall example_logo_prog
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

