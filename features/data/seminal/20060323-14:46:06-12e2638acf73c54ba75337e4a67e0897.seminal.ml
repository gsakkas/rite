
exception Unimplemented
exception AlreadyDone

(*** part a ***)
type move = Home (* ############################ *)
                | Forward of float
                | Turn of float
                | For of int * (move list)

(*** part b ***)

let pi = 4.0 *. atan 1.0

let makePoly sides len = 
        let dtheta = 2.0 *. pi /. (float sides) in
        let rec loop count (mlist : move list) =
                if count = 0 then (List.rev mlist) else
                        loop (count - 1)
                        (Turn dtheta::(Forward len::mlist)) in
        loop sides []

(*** part c ***)

let interpLarge (movelist : move list) : (float*float) list = 
  let rec loop movelist x y dir acc =
    match movelist with
      [] -> acc
    | Home::tl -> loop tl 0.0 0.0 0.0 [(0.0,0.0)]@acc
    | Forward(len)::tl -> let delta_x = len *. (cos dir) in
                            let delta_y = len *. (sin dir) in
                    loop tl (x +. delta_x) (y +. delta_y) dir 
                        [(x +. delta_x), (y +. delta_y)]@acc
    | Turn(rad)::tl -> loop tl x y (mod_float (dir +. rad) (2.0 *. pi)) acc
    | For(index,mlist)::tl -> 
                    let rec loop2 i outlist =
                            if i = 0 then outlist
                                    else loop2 (i - 1) mlist@outlist in
                    loop ((loop2 index [])@tl) x y dir acc 
  in List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])

(*** part d ***)
let interpSmall (movelist : move list) : (float*float) list = 
  let interpSmallStep movelist x y dir : move list * float * float * float = 
  match movelist with
    [] -> raise AlreadyDone
  | Home::tl -> (tl,0.0,0.0,0.0)
  | Forward(len)::tl -> (tl,(x +. (len *. (cos dir))),
                           (y +. (len *. (sin dir))),
                           dir)
  | Turn(rad)::tl -> (tl,x,y,(mod_float (dir +. rad) (2.0 *. pi)))
  | For(index, mlist)::tl -> raise Unimplemented
  | For(index,mlist)::tl -> 
                    let rec loop2 i outlist =
                            if i = 0 then outlist
                                    else loop2 (i - 1) mlist@outlist in
                    loop2 index tl
  in
  let rec loop movelist x y dir acc =
          let step = interpSmallStep movelist x y dir in
          match step with
          ([], x, y, d) -> acc (* #### *)
         |(ml2, x2, y2, d2) -> if (x<>x2) || (y<>y2)
                            then loop ml2 x2 y2 d2 [(x2,y2)]@acc
                            else loop ml2 x y dir acc 
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

