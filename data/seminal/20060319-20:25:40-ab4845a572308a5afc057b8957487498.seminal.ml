exception Unimplemented
exception AlreadyDone
exception EmptyMoveList

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
      [] -> acc
    | Home::tl -> loop tl 0.0 0.0 0.0 ((0.0,0.0)::acc)
    | Forward(f)::tl -> 
      (
        let x = x +. (f *. cos(dir)) in
        let y = y +. (f *. sin(dir)) in
        loop tl x y dir ((x,y)::acc)
      )
    | Turn(f)::tl -> loop tl x y (mod_float(dir +. f) pi2) acc
    | For(i,moves)::tl -> 
      (
        if i > 0 then
            loop (List.append moves (For(i-1,moves)::tl)) x y dir acc
        else
            loop tl x y dir acc
      )
  in List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])

let foo (movelist : move list): int * int = 
  match movelist with 
    [] -> raise EmptyMoveList
  | Home::tl -> (1,2)
  | Forward(f)::tl -> raise Unimplemented 
  | Turn(f)::tl -> raise Unimplemented 
  | For(i,moves)::tl -> raise Unimplemented 

(*let bar = print_string ("got: " ^ (string_of_int(foo([Home]))) ^ "\n")*)

(*** part d ***)
let interpSmall (movelist : move list) : (float*float) list = 
  let interpSmallStep movelist x y dir : move list * float * float * float = 
  match movelist with
    [] -> raise EmptyMoveList
  | Home::tl -> (tl, 2.0, 0.0, 0.0)
  | Forward(f)::tl -> raise Unimplemented  
  | Turn(f)::tl -> raise Unimplemented  
  | For(i,moves)::tl -> raise Unimplemented  
  in
  let rec loop movelist x y dir acc =
    match interpSmallStep movelist x y dir with
      (newList,newX,newY,newDir) -> 
        if(x <> newX) then print_string "x doesnt match";
        if(y <> newY) then print_string "y doesnt match";
        loop newList, newX, newY, newDir, acc;
  in 
  List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])

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
let example_logo_prog = [makePoly 12 2.0]
let ansL = interpLarge example_logo_prog
let ansS = interpSmall [Home]
(*let ansI = (0.0,0.0)::(fst ((interpTrans example_logo_prog) 0.0 0.0 0.0))*)
let rec pr lst =
  match lst with
    [] -> ()
  | (x,y)::tl -> 
      print_string("\t(" ^ (string_of_float x) ^ "," ^ (string_of_float y) ^ ")\n");
      pr tl

let _ = 
  print_string "large: \n"; pr ansL; print_newline (); 
  print_string "small: \n"; pr ansS; print_newline (); 
(* ########################## *)