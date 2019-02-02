
exception Unimplemented
exception AlreadyDone

(*** part a ***)
type move = Home 
          | Forward of float
          | Turn of float
          | For of (int*(move list))

let pi = 4.0 *. atan 1.0

(*** part b ***)
let makePoly sides len = 
  let sided = sides in
  let d = 2.0 *. pi /. (float_of_int(sides)) in
  For (sided, [Forward len; Turn d])


(*** part c ***)
let advance p rad dir =
  match p with
  | (x,y) -> (x +. (rad *. (cos dir)), y +. (rad *. (sin dir)))

let interpLarge (movelist : move list) : (float*float) list = 
  let rec loop movelist p dir acc =
    match movelist with
    | [] -> acc
    | Home::tl          -> 
        loop tl (0.0,0.0) 0.0 ((0.0,0.0)::acc)
    | (Forward f)::tl   -> 
        let pnew = advance p f dir in
        loop tl pnew dir (pnew::acc)
    | (Turn f)::tl      -> 
        let dirnew = mod_float (dir +. f) (2 *. pi) in
        loop tl p dirnew acc
    | (For (i,lst))::tl -> 
        let rec execFor idx p dir acc = 
          match idx with
          | 0   -> (p, dir, acc)
          | idx -> execFor (idx-1) lst (loop lst p dir acc)
          in
        match (execFor i p dir acc) with
        | (pnew, dirnew, accnew) ->
            loop tl pnew dirnew accnew
    in 
  List.rev (loop movelist (0.0,0.0) 0.0 [(0.0,0.0)])





























(*** part d ***)
let interpSmall (movelist : move list) : (float*float) list = 
  let interpSmallStep movelist x y dir : move list * float * float * float = 
  match movelist with
    [] -> raise Unimplemented
  | Home::tl -> raise Unimplemented
  | _ -> raise Unimplemented  
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
  | _ -> raise Unimplemented  
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

