
exception Unimplemented
exception AlreadyDone

let pi = 3.14159

(*** part a ***)
type move = Home | Forward of float | Turn of float | For of (int * (move list))

(*** part b ***)
let makePoly sides len = For(sides, (Forward(len)::[Turn(2.0 *. pi /. float_of_int(sides))]))

(*** part c ***)
let interpLarge (movelist : move list) : (float*float) list = 
  let rec loop movelist x y dir acc =
    match movelist with
      [] -> acc
    | Home::tl -> if ((0.0 = x) && (0.0 = y))
                  then loop tl 0.0 0.0 0.0 acc
                  else loop tl 0.0 0.0 0.0 ((0.0,0.0)::acc)
    | Forward(f)::tl -> loop 
                          tl 
                          (x +. (f *. cos dir))
                          (y +. (f *. sin dir))
                          dir 
                          (((x +. (f *. cos dir)), (y +. (f *. sin dir)))::acc)
    | Turn(f)::tl -> loop
                       tl
                       x
                       y
                       (mod_float (dir +. f) (2.0 *. pi))
                       acc
    | For(0,lst)::tl -> loop tl x y dir acc
    | For(i,lst)::tl -> loop (lst::(For(i-1, lst)::tl)) x y dir acc
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

