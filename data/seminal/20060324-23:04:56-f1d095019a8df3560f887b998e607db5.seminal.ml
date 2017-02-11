
exception Unimplemented
exception AlreadyDone

let pi = 4. *. atan 1.

(*** part a ***)
type move = Home
          | Forward of float
          | Turn of float
          | Loop of int * (move list)

(*** part b ***)
let makePoly sides len =
  Loop(sides, [Forward(len); Turn(2. *. pi /. (float_of_int sides))])

(*** part c ***)
let interpLarge (movelist : move list) : (float*float) list = 
  let rec loop movelist x y dir acc =
    match movelist with
      [] -> acc
    | Home::tl -> let x = 0. and y = 0. in
                    loop tl x y dir ((x, y)::acc);
    | Forward(dist)::tl -> let x = x +. (dist *. (cos dir))
                           and y = y +. (dist *. (sin dir)) in
                             loop tl x y dir ((x, y)::acc);
    | Turn(rot)::tl -> loop tl x y (mod_float (dir +. rot) (2 *. pi)) acc
    | Loop(0, innerList)::tl -> loop tl x y dir acc
    | Loop(count, innerList)::tl -> let movelist = (Loop(count-1, innerList))::innerList@tl in
                                      loop movelist x y dir acc
  in List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])

(*** part d ***)
let interpSmall (movelist : move list) : (float*float) list = 
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
(*
###########################################
########################################
########################################
#########################################################################

################
################
############
#################
################################################################################
###########

########
#############################
############################
#############################
*)
