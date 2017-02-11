
exception Unimplemented
exception AlreadyDone

let pi = 4.0 *. atan 1.0

(*** part a ***)
type move = Home
			| Forward of float
			| Turn of float
			| For of int * move list

(*** part b ***)
let makePoly sides len =
	For(sides, [Forward(len); Turn((2.0 *. pi) /. (float_of_int sides))])

(*** part c ***)
 let interpLarge (movelist : move list) : (float*float) list = 
  let rec loop movelist x y dir acc =
    match movelist with
      []				-> acc
    | Home::tl			-> loop tl 0.0 0.0 0.0 ((0.0,0.0)::acc)
    | Forward(dist)::tl	->
		let newx = (x +. (dist *. cos dir)) in
		let newy = (y +. (dist *. sin dir)) in
		loop tl newx newy dir ((newx,newy)::acc)
    | Turn(rad)::tl		-> loop tl x y (mod_float (dir +. rad) (2.0 *. pi)) acc
    | For(i,lst)::tl	->
		if (i > 0)
		then (
			(*let iacc = (loop lst x y dir acc) in
			loop ((For(i-1, lst))::tl) x y dir iacc*)
			loop ((loop lst x y dir acc)::(For(i-1, lst))::tl) x y dir acc
		)
		else (loop tl x y dir acc)	
  in List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])

(*** part d ***)
let interpSmall (movelist : move list) : (float*float) list = 
  let interpSmallStep movelist x y dir : move list * float * float * float = 
	  match movelist with
		[]					-> raise AlreadyDone
	  | Home::tl			-> (tl, 0.0, 0.0, 0.0)
	  | Forward(dist)::tl	-> (tl, x +. (dist *. cos dir), y +. (dist *. sin dir), dir)
	  | Turn(rad)::tl		-> (tl, x, y, mod_float (dir +. rad) (2.0 *. pi))
	  | For(i,lst)::tl		-> raise Unimplemented
  in let rec loop movelist x y dir acc =
    match (interpSmallStep movelist x y dir) with
    | (lst,x1,y1,dir1)	->
		if ((x1 <> x) || (y1 <> y))
		then match lst with
			 | []		-> ((x1,y1)::acc)
			 | hd1::tl1	-> loop lst x1 y1 dir1 ((x1,y1)::acc)
		else match lst with
			 | []		-> acc
			 | hd1::tl1	-> loop lst x1 y1 dir1 acc
  in List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])

(*** part e ***)
(*
#######################################################################################
################################################################################
########################################################################################
#######################################################################################
#######################################################################################
#########################################################################################
#############################################
*)

(*** part f ***)
let interpTrans movelist : float->float->float-> (float * float) list * float= 
  let compose f1 f2 = raise Unimplemented (* ######################### *) in
	  match movelist with
		[]				-> raise Unimplemented
	  | Home::tl		-> raise Unimplemented
	  | Forward(f)::tl	-> raise Unimplemented
	  | Turn(f)::tl		-> raise Unimplemented
	  | For(i,lst)::tl	-> raise Unimplemented

(*** possibly helpful testing code ***)

(* ######################################################################## *)
(* ############################################# *)
let example_logo_prog = [Forward(2.0); Turn(pi /. 2.0);
						Forward(2.0); Turn((3.0 *. pi) /. 4.0);
						Forward(2.828);
						Home;
						(*For(4,[Forward(2.0); Turn(pi /. 4.0)]);*)
						(*(makePoly 4 1.0);*)
						Turn((3.0 *. pi) /. 4.0);
						Forward(1.0);
						Home;]
let ansL = interpLarge example_logo_prog
(*let ansS = interpSmall example_logo_prog*)
(*let ansI = (0.0,0.0)::(fst ((interpTrans example_logo_prog) 0.0 0.0 0.0))*)

let rec pr lst =
  match lst with
    [] -> ()
  | (x,y)::tl -> 
      (*print_string("(" ^ (string_of_float x) ^ "," ^ (string_of_float y) ^ ")");*)
      print_string((string_of_float x) ^ "," ^ (string_of_float y) ^ "\n");
      pr tl

let _ = 
  pr ansL; print_newline (); 
  (*pr ansS; print_newline ();*)
  (*pr ansI; print_newline ();*)