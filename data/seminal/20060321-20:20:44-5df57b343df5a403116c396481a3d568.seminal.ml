
exception Unimplemented
exception AlreadyDone

(*** part a ***)
(* ############################ *)
type move = Home | Forward of float | Turn of float | For of int list

(* ###############################################################
############################ *)
let pi = acos(-1.0)
let unit_circle = 2.0 *. pi


(*** part b ***)
let makePoly sides len =
   if (sides = 0 ) then (raise Division_by_zero)
   else  (
     let rot = unit_circle /. sides in
     let rec loop x y acc side_count =
        if (side_count=sides) then []
        else let new_x = x +. (len *. (cos acc)) in
             let new_y = y +. (len *. (sin acc)) in
             (new_x,new_y):: (loop new_x new_y (acc +. rot) (side_count +1))
     in loop 0.0 0.0 0.0 0        
   )
        
           
	

(*** part c ***)
let interpLarge (movelist : move list) : (float*float) list = 
  let rec loop movelist x y dir acc =
    match movelist with
      [] -> raise Unimplemented
    | Home::tl -> raise Unimplemented
    (* ########################### *)
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

